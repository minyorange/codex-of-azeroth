-- ============================================================
-- Codex of Azeroth :: Search Engine
-- ============================================================
-- Motor de búsqueda que recorre todas las entradas y devuelve
-- resultados ordenados por relevancia. Implementa búsqueda
-- fuzzy (tolerante a typos) y soporte para tags.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.Search = {}
local Search = CoA.Search

-- ============================================================
-- Normalizar texto para búsqueda
-- ============================================================
local function Normalize(text)
    if not text then return "" end
    text = tostring(text):lower()
    -- Quitar acentos comunes en español
    local accents = {
        ["á"] = "a", ["é"] = "e", ["í"] = "i", ["ó"] = "o", ["ú"] = "u",
        ["à"] = "a", ["è"] = "e", ["ì"] = "i", ["ò"] = "o", ["ù"] = "u",
        ["ä"] = "a", ["ë"] = "e", ["ï"] = "i", ["ö"] = "o", ["ü"] = "u",
        ["ñ"] = "n", ["ç"] = "c",
    }
    for accented, plain in pairs(accents) do
        text = text:gsub(accented, plain)
    end
    return text
end

-- Quitar espacios y caracteres especiales para matching difuso
local function StripForFuzzy(text)
    return Normalize(text):gsub("[%s%p]", "")
end

-- ============================================================
-- Distancia Levenshtein (básica, O(n*m))
-- ============================================================
local function Levenshtein(a, b)
    if a == b then return 0 end
    if #a == 0 then return #b end
    if #b == 0 then return #a end

    local prev = {}
    local curr = {}
    for j = 0, #b do prev[j] = j end
    for i = 1, #a do
        curr[0] = i
        for j = 1, #b do
            local cost = (a:sub(i, i) == b:sub(j, j)) and 0 or 1
            curr[j] = math.min(
                (prev[j] or 0) + 1,        -- deletion
                (curr[j-1] or 0) + 1,       -- insertion
                (prev[j-1] or 0) + cost     -- substitution
            )
        end
        for j = 0, #b do prev[j] = curr[j] end
    end
    return prev[#b]
end

-- ============================================================
-- Calcular "score" de relevancia (mayor = mejor)
-- ============================================================
local function ScoreEntry(entry, query)
    if not entry or not query or query == "" then return 0 end

    local score = 0
    local q = Normalize(query)
    local qFuzzy = StripForFuzzy(query)

    -- Coincidencia exacta en el nombre (peso alto)
    if Normalize(entry.name) == q then
        score = score + 1000
    elseif Normalize(entry.name):find(q, 1, true) then
        score = score + 500
    end

    -- Coincidencia en el id
    if entry.id and entry.id:lower() == q then
        score = score + 800
    elseif entry.id and entry.id:lower():find(q, 1, true) then
        score = score + 300
    end

    -- Coincidencia en summary
    if entry.summary and Normalize(entry.summary):find(q, 1, true) then
        score = score + 100
    end

    -- Coincidencia en description
    if entry.description and Normalize(entry.description):find(q, 1, true) then
        score = score + 50
    end

    -- Coincidencia en tags
    for _, tag in ipairs(entry.tags or {}) do
        if Normalize(tag) == q then
            score = score + 200
        elseif Normalize(tag):find(q, 1, true) then
            score = score + 80
        end
    end

    -- Coincidencia en faction
    if entry.faction and Normalize(entry.faction):find(q, 1, true) then
        score = score + 30
    end

    -- Coincidencia en race
    if entry.race and Normalize(entry.race):find(q, 1, true) then
        score = score + 30
    end

    -- Búsqueda fuzzy en el nombre (typos)
    if score == 0 and qFuzzy ~= "" then
        local nameFuzzy = StripForFuzzy(entry.name or "")
        if #nameFuzzy > 0 and #qFuzzy > 0 then
            local distance = Levenshtein(qFuzzy, nameFuzzy)
            local maxLen = math.max(#qFuzzy, #nameFuzzy)
            -- Aceptar si la distancia es menor al 30% del largo
            if distance <= maxLen * 0.3 then
                score = score + (100 - distance * 5)
            end
        end
    end

    return score
end

-- ============================================================
-- Búsqueda principal
-- ============================================================
function Search:Search(query, options)
    if not query or query == "" then return {} end

    options = options or {}
    local maxResults = options.maxResults or 50
    local category    = options.category    or nil
    local expansion   = options.expansion   or nil

    local results = {}
    local allEntries = {}

    if category then
        allEntries = CoA.Database:GetByCategory(category)
    elseif expansion then
        allEntries = CoA.Database:GetByExpansion(expansion)
    else
        allEntries = CoA.Database:GetAll()
    end

    for _, entry in ipairs(allEntries) do
        local score = ScoreEntry(entry, query)
        if score > 0 then
            table.insert(results, { entry = entry, score = score })
        end
    end

    -- Ordenar por score descendente
    table.sort(results, function(a, b) return a.score > b.score end)

    -- Limitar
    local limited = {}
    for i = 1, math.min(#results, maxResults) do
        table.insert(limited, results[i].entry)
    end

    return limited
end

-- ============================================================
-- Búsqueda rápida solo por nombre (para autocompletar)
-- ============================================================
function Search:QuickSearch(query, maxResults)
    maxResults = maxResults or 10
    if not query or query == "" then return {} end

    local q = Normalize(query)
    local results = {}

    for _, entry in ipairs(CoA.Database:GetAll()) do
        if Normalize(entry.name):find(q, 1, true) then
            table.insert(results, entry)
            if #results >= maxResults then break end
        end
    end

    return results
end

-- ============================================================
-- Historial de búsquedas (en memoria, no persistente todavía)
-- ============================================================
Search.history = {}
Search.maxHistory = 20

function Search:AddToHistory(query)
    if not query or query == "" then return end
    -- Evitar duplicados consecutivos
    if self.history[1] == query then return end
    table.insert(self.history, 1, query)
    while #self.history > self.maxHistory do
        table.remove(self.history)
    end
end

function Search:GetHistory()
    return self.history
end

function Search:ClearHistory()
    self.history = {}
end
