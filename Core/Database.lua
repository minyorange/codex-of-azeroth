-- ============================================================
-- Codex of Azeroth :: Database
-- ============================================================
-- Gestiona el acceso a la base de datos de lore.
-- Indexa entradas por id y permite búsquedas rápidas.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.Database = {}
local DB = CoA.Database

-- ============================================================
-- Almacenes en memoria
-- ============================================================
DB.entries     = {}  -- [id] = entryData
DB.byCategory  = {   -- [categoryName] = { id1, id2, ... }
    ["npcs"]       = {},
    ["locations"]  = {},
    ["factions"]   = {},
    ["events"]     = {},
    ["concepts"]   = {},
}
DB.byExpansion = {}  -- [expansionName] = { id1, id2, ... }
DB.byFaction   = {}  -- [factionName]   = { id1, id2, ... }
DB.allIds      = {}  -- Lista plana de todos los ids, ordenada alfabéticamente

-- ============================================================
-- Categorías válidas
-- ============================================================
DB.categories = {
    "npcs",
    "locations",
    "factions",
    "events",
    "concepts",
}

-- ============================================================
-- Inicialización: agregar todas las entradas al índice
-- ============================================================
function DB:Initialize()
    self:Debug("Indexando base de datos...")

    -- Los archivos de Data/ crean entradas con CoA.Database:AddEntry
    -- Aquí solo esperamos a que existan.
    -- Llamamos a un hook que las datas usen

    self.entries      = {}
    self.byCategory   = { npcs={}, locations={}, factions={}, events={}, concepts={} }
    self.byExpansion  = {}
    self.byFaction    = {}
    self.allIds       = {}

    self:Debug("Base de datos lista. Entradas cargadas: " .. tostring(self:GetEntryCount()))
end

function DB:Debug(msg, ...)
    if CoA.debug then
        CoA:Print("[Database] " .. tostring(msg), ...)
    end
end

-- ============================================================
-- Añadir una entrada
-- ============================================================
function DB:AddEntry(entryData)
    if not entryData or not entryData.id then
        self:Debug("AddEntry: entrada sin id, ignorada.")
        return false
    end

    -- Asignar defaults
    entryData.category    = entryData.category or "npcs"
    entryData.name        = entryData.name or "Sin nombre"
    entryData.summary     = entryData.summary or ""
    entryData.description = entryData.description or entryData.summary
    entryData.tags        = entryData.tags or {}
    entryData.related     = entryData.related or {}
    entryData.sources     = entryData.sources or {}
    entryData.expansions  = entryData.expansions or {}
    entryData.faction     = entryData.faction or nil
    entryData.race        = entryData.race or nil
    entryData.location    = entryData.location or nil
    entryData.icon        = entryData.icon or "INV_Misc_Book_09"

    -- Guardar
    self.entries[entryData.id] = entryData
    table.insert(self.allIds, entryData.id)

    -- Indexar por categoría
    if self.byCategory[entryData.category] then
        table.insert(self.byCategory[entryData.category], entryData.id)
    end

    -- Indexar por expansión
    for _, exp in ipairs(entryData.expansions) do
        local expKey = self:NormalizeKey(exp)
        if not self.byExpansion[expKey] then
            self.byExpansion[expKey] = {}
        end
        table.insert(self.byExpansion[expKey], entryData.id)
    end

    -- Indexar por facción
    if entryData.faction then
        local facKey = self:NormalizeKey(entryData.faction)
        if not self.byFaction[facKey] then
            self.byFaction[facKey] = {}
        end
        table.insert(self.byFaction[facKey], entryData.id)
    end

    return true
end

-- ============================================================
-- Obtener una entrada
-- ============================================================
function DB:GetEntry(id)
    if not id then return nil end
    return self.entries[id:lower()] or self.entries[id]
end

-- ============================================================
-- Obtener múltiples entradas
-- ============================================================
function DB:GetEntries(ids)
    local results = {}
    for _, id in ipairs(ids or {}) do
        local entry = self:GetEntry(id)
        if entry then
            table.insert(results, entry)
        end
    end
    return results
end

-- ============================================================
-- Obtener por categoría
-- ============================================================
function DB:GetByCategory(category)
    local ids = self.byCategory[category] or {}
    return self:GetEntries(ids)
end

-- ============================================================
-- Obtener por expansión
-- ============================================================
function DB:GetByExpansion(expansion)
    local ids = self.byExpansion[self:NormalizeKey(expansion)] or {}
    return self:GetEntries(ids)
end

-- ============================================================
-- Obtener por facción
-- ============================================================
function DB:GetByFaction(faction)
    local ids = self.byFaction[self:NormalizeKey(faction)] or {}
    return self:GetEntries(ids)
end

-- ============================================================
-- Obtener todas (ordenadas por nombre)
-- ============================================================
function DB:GetAll()
    local all = {}
    for id, _ in pairs(self.entries) do
        table.insert(all, self.entries[id])
    end
    table.sort(all, function(a, b)
        return (a.name or "") < (b.name or "")
    end)
    return all
end

function DB:GetEntryCount()
    return #self.allIds
end

-- ============================================================
-- Utilidades
-- ============================================================
function DB:NormalizeKey(str)
    if not str then return "" end
    return tostring(str):lower():gsub("%s+", "_"):trim()
end

-- Devuelve el nombre legible de una categoría
function DB:GetCategoryDisplayName(categoryId)
    local L = CoA.Locale or {}
    local map = {
        npcs      = L["CATEGORY_NPCS"]      or "Personajes",
        locations = L["CATEGORY_LOCATIONS"] or "Lugares",
        factions  = L["CATEGORY_FACTIONS"]  or "Facciones",
        events    = L["CATEGORY_EVENTS"]    or "Eventos",
        concepts  = L["CATEGORY_CONCEPTS"]  or "Conceptos",
    }
    return map[categoryId] or categoryId
end
