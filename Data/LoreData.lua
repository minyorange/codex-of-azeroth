-- ============================================================
-- Codex of Azeroth :: LoreData (Índice General)
-- ============================================================
-- Este archivo sirve como punto de integración de todos los datos
-- y proporciona estadísticas generales de la base de datos.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

-- Esperar a que la base de datos esté poblada
local function Init()
    if not CoA.Database then
        -- Reintentar más tarde
        local f = CreateFrame("Frame")
        f:SetScript("OnUpdate", function(self)
            if CoA.Database and CoA.Database.GetEntryCount then
                self:SetScript("OnUpdate", nil)
                self:Hide()
                CoA.LoreData:ReportStats()
            end
        end)
        f:Show()
    end
end

CoA.LoreData = {}
CoA.LoreData.stats = {}

function CoA.LoreData:ReportStats()
    if not CoA.Database then return end

    local total = CoA.Database:GetEntryCount()
    local npcs = #(CoA.Database:GetByCategory("npcs") or {})
    local locations = #(CoA.Database:GetByCategory("locations") or {})
    local factions = #(CoA.Database:GetByCategory("factions") or {})
    local events = #(CoA.Database:GetByCategory("events") or {})
    local concepts = #(CoA.Database:GetByCategory("concepts") or {})

    self.stats = {
        total     = total,
        npcs      = npcs,
        locations = locations,
        factions  = factions,
        events    = events,
        concepts  = concepts,
    }

    if CoA.debug then
        CoA:Print(string.format(
            "Base de datos cargada: %d entradas (NPCs:%d, Lugares:%d, Facciones:%d, Eventos:%d, Conceptos:%d)",
            total, npcs, locations, factions, events, concepts
        ))
    end
end

function CoA.LoreData:GetStats()
    if not self.stats or not self.stats.total then
        self:ReportStats()
    end
    return self.stats or {}
end

-- Inicializar cuando todo esté listo
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            CoA.LoreData:ReportStats()
        end)
    end
end)
