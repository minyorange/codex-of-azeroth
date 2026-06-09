CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.LoreData = {}
local LoreData = CoA.LoreData
LoreData.stats = {}

function LoreData:ReportStats()
    if not CoA.Database then return end

    local total = CoA.Database:GetEntryCount()
    local npcs = #(CoA.Database:GetByCategory("npcs") or {})
    local locations = #(CoA.Database:GetByCategory("locations") or {})
    local factions = #(CoA.Database:GetByCategory("factions") or {})
    local events = #(CoA.Database:GetByCategory("events") or {})
    local concepts = #(CoA.Database:GetByCategory("concepts") or {})

    self.stats = {
        total = total,
        npcs = npcs, locations = locations,
        factions = factions, events = events, concepts = concepts,
    }

    CoA:Debug(string.format(
        "DB: %d entradas (NPCs:%d, Lugares:%d, Facciones:%d, Eventos:%d, Conceptos:%d)",
        total, npcs, locations, factions, events, concepts
    ))
end

function LoreData:GetStats()
    if not self.stats or not self.stats.total then
        self:ReportStats()
    end
    return self.stats or {}
end
