-- ============================================================
-- Codex of Azeroth :: Timeline (Línea Temporal)
-- ============================================================
-- Datos sobre la línea temporal de eventos importantes.
-- Esto se usa para mostrar visualmente la cronología de Azeroth.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.Timeline = {}
CoA.Timeline.events = {}

-- ============================================================
-- Añadir eventos a la línea temporal
-- ============================================================
local function AddTimelineEvent(event)
    table.insert(CoA.Timeline.events, event)
end

-- Hitos temporales principales
AddTimelineEvent { year = "Millones de años atrás", name = "Orden de Azeroth por los Titanes", eventId = "titanes" }
AddTimelineEvent { year = "Era Antigua (10.000+ años)", name = "Guerra de los Ancestros", eventId = "guerra_de_los_ancestros" }
AddTimelineEvent { year = "Era Antigua (10.000 años)", name = "El Pozo de la Eternidad se rompe y crea el Mar de los Sudorosos", eventId = "guerra_de_los_ancestros" }
AddTimelineEvent { year = "Año 0", name = "Tiempos de Warcraft: Orcs & Humans", eventId = "primera_guerra" }
AddTimelineEvent { year = "Año 0", name = "Primera Guerra: Los orcos conquistan Ventormenta", eventId = "primera_guerra" }
AddTimelineEvent { year = "Año 2", name = "Segunda Guerra: La Horda invade Lordaeron", eventId = "segunda_guerra" }
AddTimelineEvent { year = "Año 4", name = "Tercera Guerra: Plaga, Legión y caída de Lordaeron", eventId = "tercera_guerra" }
AddTimelineEvent { year = "Año 4", name = "World of Warcraft (Vanilla) - Apertura del Portal Oscuro", eventId = "tercera_guerra" }
AddTimelineEvent { year = "Año 5", name = "The Burning Crusade - Outland", eventId = "invasion_legion" }
AddTimelineEvent { year = "Año 6", name = "Wrath of the Lich King - Muerte de Arthas", eventId = "tercera_guerra" }
AddTimelineEvent { year = "Año 7", name = "Cataclysm - Deathwing destruye el mundo", eventId = "catastrofe" }
AddTimelineEvent { year = "Año 8", name = "Mists of Pandaria - Destrucción de Theramore", eventId = "cuarta_guerra" }
AddTimelineEvent { year = "Año 9", name = "Warlords of Draenor - Línea temporal alternativa", eventId = "legion_ardiente" }
AddTimelineEvent { year = "Año 10", name = "Legion - Invasión de la Legión Ardiente", eventId = "invasion_legion" }
AddTimelineEvent { year = "Año 11", name = "Battle for Azeroth - Cuarta Guerra", eventId = "cuarta_guerra" }
AddTimelineEvent { year = "Año 12", name = "Shadowlands - Crisis de las Almas", eventId = "crisis_almas" }
AddTimelineEvent { year = "Año 13", name = "Dragonflight - El Vuelo de las Islas", eventId = "vuelo_dragon" }
AddTimelineEvent { year = "Año 14", name = "The War Within - Crisis subterránea", eventId = "tww" }

-- Lista de expansiones para referencia rápida
CoA.Timeline.expansions = {
    { id = "vanilla",   name = "World of Warcraft",        year = "2004" },
    { id = "tbc",       name = "The Burning Crusade",     year = "2007" },
    { id = "wotlk",     name = "Wrath of the Lich King",  year = "2008" },
    { id = "cata",      name = "Cataclysm",               year = "2010" },
    { id = "mop",       name = "Mists of Pandaria",       year = "2012" },
    { id = "wod",       name = "Warlords of Draenor",     year = "2014" },
    { id = "legion",    name = "Legion",                  year = "2016" },
    { id = "bfa",       name = "Battle for Azeroth",      year = "2018" },
    { id = "sl",        name = "Shadowlands",             year = "2020" },
    { id = "df",        name = "Dragonflight",            year = "2022" },
    { id = "tww",       name = "The War Within",          year = "2024" },
}

CoA.Timeline:Debug = function(self, msg)
    if CoA.debug then
        CoA:Print("[Timeline] " .. tostring(msg))
    end
end
