CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local Database = CoA.Class:extend()

function Database:constructor()
    self.entries = {}
    self.byCategory = {
        npcs = {}, locations = {}, factions = {}, events = {}, concepts = {},
    }
    self.byExpansion = {}
    self.byFaction = {}
    self.allIds = {}
    self._sortedCache = {}
    self._cacheDirty = true
end

function Database:AddEntry(data)
    if not data or not data.id then return false end

    data.category    = data.category or "npcs"
    data.name        = data.name or "Sin nombre"
    data.summary     = data.summary or ""
    data.description = data.description or data.summary
    data.tags        = data.tags or {}
    data.related     = data.related or {}
    data.sources     = data.sources or {}
    data.expansions  = data.expansions or {}
    data.faction     = data.faction or nil
    data.race        = data.race or nil
    data.location    = data.location or nil
    data.icon        = data.icon or "INV_Misc_Book_09"

    local id = data.id
    self.entries[id] = data
    table.insert(self.allIds, id)
    self._cacheDirty = true

    if self.byCategory[data.category] then
        table.insert(self.byCategory[data.category], id)
    end

    for _, exp in ipairs(data.expansions) do
        local expKey = self:_NormalizeKey(exp)
        if not self.byExpansion[expKey] then
            self.byExpansion[expKey] = {}
        end
        table.insert(self.byExpansion[expKey], id)
    end

    if data.faction then
        local facKey = self:_NormalizeKey(data.faction)
        if not self.byFaction[facKey] then
            self.byFaction[facKey] = {}
        end
        table.insert(self.byFaction[facKey], id)
    end

    return true
end

function Database:GetEntry(id)
    if not id then return nil end
    return self.entries[id:lower()] or self.entries[id]
end

function Database:GetEntries(ids)
    local results = {}
    for _, id in ipairs(ids or {}) do
        local entry = self:GetEntry(id)
        if entry then table.insert(results, entry) end
    end
    return results
end

function Database:GetByCategory(category)
    local ids = self.byCategory[category] or {}
    return self:GetEntries(ids)
end

function Database:GetByExpansion(expansion)
    local ids = self.byExpansion[self:_NormalizeKey(expansion)] or {}
    return self:GetEntries(ids)
end

function Database:GetByFaction(faction)
    local ids = self.byFaction[self:_NormalizeKey(faction)] or {}
    return self:GetEntries(ids)
end

function Database:GetAll()
    if not self._cacheDirty and self._sortedCache then
        return self._sortedCache
    end
    local all = {}
    for _, entry in pairs(self.entries) do
        table.insert(all, entry)
    end
    table.sort(all, function(a, b)
        return (a.name or "") < (b.name or "")
    end)
    self._sortedCache = all
    self._cacheDirty = false
    return all
end

function Database:GetEntryCount()
    local count = 0
    for _ in pairs(self.entries) do count = count + 1 end
    return count
end

function Database:GetCategoryDisplayName(categoryId)
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

function Database:_NormalizeKey(str)
    if not str then return "" end
    return tostring(str):lower():gsub("%s+", "_"):gsub("^%s*(.-)%s*$", "%1")
end

CoA.Database = Database:new()
