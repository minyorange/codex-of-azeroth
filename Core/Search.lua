CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local Search = CoA.Class:extend()

function Search:constructor()
    self.history = {}
    self.maxHistory = 20
end

function Search:Search(query, options)
    if not query or query == "" then return {} end

    options = options or {}
    local maxResults = options.maxResults or 50
    local category   = options.category
    local expansion  = options.expansion

    local allEntries = {}
    if category then
        allEntries = CoA.Database:GetByCategory(category)
    elseif expansion then
        allEntries = CoA.Database:GetByExpansion(expansion)
    else
        allEntries = CoA.Database:GetAll()
    end

    local results = {}
    for _, entry in ipairs(allEntries) do
        local score = self:_ScoreEntry(entry, query)
        if score > 0 then
            table.insert(results, { entry = entry, score = score })
        end
    end

    table.sort(results, function(a, b) return a.score > b.score end)

    local limited = {}
    for i = 1, math.min(#results, maxResults) do
        table.insert(limited, results[i].entry)
    end
    return limited
end

function Search:QuickSearch(query, maxResults)
    maxResults = maxResults or 10
    if not query or query == "" then return {} end

    local q = self:_Normalize(query)
    local results = {}

    for _, entry in ipairs(CoA.Database:GetAll()) do
        if self:_Normalize(entry.name):find(q, 1, true) then
            table.insert(results, entry)
            if #results >= maxResults then break end
        end
    end
    return results
end

function Search:AddToHistory(query)
    if not query or query == "" then return end
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

function Search:_Normalize(text)
    if not text then return "" end
    text = tostring(text):lower()
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

function Search:_StripForFuzzy(text)
    return self:_Normalize(text):gsub("[%s%p]", "")
end

function Search:_Levenshtein(a, b)
    if a == b then return 0 end
    if #a == 0 then return #b end
    if #b == 0 then return #a end

    local prev, curr = {}, {}
    for j = 0, #b do prev[j] = j end
    for i = 1, #a do
        curr[0] = i
        for j = 1, #b do
            local cost = (a:sub(i, i) == b:sub(j, j)) and 0 or 1
            curr[j] = math.min(
                (prev[j] or 0) + 1,
                (curr[j - 1] or 0) + 1,
                (prev[j - 1] or 0) + cost
            )
        end
        for j = 0, #b do prev[j] = curr[j] end
    end
    return prev[#b]
end

function Search:_ScoreEntry(entry, query)
    if not entry or not query or query == "" then return 0 end

    local score = 0
    local q = self:_Normalize(query)
    local qFuzzy = self:_StripForFuzzy(query)
    local entryName = self:_Normalize(entry.name or "")

    if entryName == q then
        score = score + 1000
    elseif entryName:find(q, 1, true) then
        score = score + 500
    end

    if entry.id and entry.id:lower() == q then
        score = score + 800
    elseif entry.id and entry.id:lower():find(q, 1, true) then
        score = score + 300
    end

    if entry.summary and self:_Normalize(entry.summary):find(q, 1, true) then
        score = score + 100
    end

    if entry.description and self:_Normalize(entry.description):find(q, 1, true) then
        score = score + 50
    end

    for _, tag in ipairs(entry.tags or {}) do
        local tagNorm = self:_Normalize(tag)
        if tagNorm == q then
            score = score + 200
        elseif tagNorm:find(q, 1, true) then
            score = score + 80
        end
    end

    if entry.faction and self:_Normalize(entry.faction):find(q, 1, true) then
        score = score + 30
    end

    if entry.race and self:_Normalize(entry.race):find(q, 1, true) then
        score = score + 30
    end

    if score == 0 and qFuzzy ~= "" then
        local nameFuzzy = self:_StripForFuzzy(entry.name or "")
        if #nameFuzzy > 0 and #qFuzzy > 0 then
            local distance = self:_Levenshtein(qFuzzy, nameFuzzy)
            local maxLen = math.max(#qFuzzy, #nameFuzzy)
            if distance <= maxLen * 0.3 then
                score = score + (100 - distance * 5)
            end
        end
    end

    return score
end

CoA.Search = Search:new()
