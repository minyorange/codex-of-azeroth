-- ============================================================
-- Codex of Azeroth :: Localización esES
-- ============================================================
-- Textos traducibles del addon. Por defecto en español (esES).
-- Las claves se mantienen estables; solo cambian los valores.
-- Para añadir un nuevo idioma, crea Locale/<codigo>.lua con la
-- misma estructura y añade el código a "## X-Localizations" en
-- el .toc. Core/Codex.lua seleccionará el archivo adecuado con
-- GetLocale() automáticamente.
-- ============================================================

local L = {}
-- Patrón estándar de WoW: cada locale se autoregistra solo si coincide
-- con la del juego. Core/Codex.lua recoge CodexOfAzeroth_L en ADDON_LOADED.
-- Si ningún archivo coincide, CoA:L() devuelve la clave (inglés por defecto).
local _activeLocale = GetLocale()
if _activeLocale == "esES" or _activeLocale == "esMX" then
    CodexOfAzeroth_L = L
end

-- ====== General ======
L["ADDON_NAME"]               = "Codex of Azeroth"
L["ADDON_TAG"]                = "CoA"
L["ADDON_VERSION"]            = "0.1.0"

-- ====== Ventana principal ======
L["WINDOW_TITLE"]             = "Codex of Azeroth"
L["WELCOME_MESSAGE"]          = "Bienvenido al Códice. Selecciona una categoría o busca una entrada para comenzar."
L["BUTTON_CLOSE"]             = "Cerrar"
L["BUTTON_SEARCH"]            = "Buscar"
L["BUTTON_BACK"]              = "Atrás"

-- ====== Categorías ======
L["CATEGORY_NPCS"]            = "Personajes"
L["CATEGORY_LOCATIONS"]       = "Lugares"
L["CATEGORY_FACTIONS"]        = "Facciones"
L["CATEGORY_EVENTS"]          = "Eventos Históricos"
L["CATEGORY_CONCEPTS"]        = "Conceptos"
L["CATEGORY_FAVORITES"]       = "Favoritos"
L["CATEGORY_TIMELINE"]        = "Línea Temporal"
L["CATEGORY_ALL"]             = "Todas las entradas"
L["CATEGORY_EXPANSION"]       = "Por Expansión"

-- ====== Búsqueda ======
L["SEARCH_PLACEHOLDER"]       = "Buscar en el Códice..."
L["SEARCH_NO_RESULTS"]        = "No se encontraron resultados para \"%s\"."
L["SEARCH_RESULTS"]           = "Resultados de búsqueda"
L["SEARCH_HISTORY"]           = "Búsquedas recientes"

-- ====== Entradas ======
L["ENTRY_SUMMARY"]            = "Resumen"
L["ENTRY_DESCRIPTION"]        = "Descripción"
L["ENTRY_RELATED"]            = "Entradas relacionadas"
L["ENTRY_SOURCES"]            = "Fuentes"
L["ENTRY_FACTION"]            = "Facción"
L["ENTRY_RACE"]               = "Raza"
L["ENTRY_LOCATION"]           = "Ubicación"
L["ENTRY_ERAS"]               = "Eras"
L["ENTRY_EXPANSIONS"]         = "Expansiones"
L["ENTRY_TAGS"]               = "Etiquetas"
L["ENTRY_FAVORITE_ADD"]       = "Marcar como favorito"
L["ENTRY_FAVORITE_REMOVE"]    = "Quitar de favoritos"
L["ENTRY_NOTE_PLACEHOLDER"]   = "Añade tu nota personal..."
L["ENTRY_NOTE_SAVE"]          = "Guardar nota"
L["ENTRY_NOTE_SAVED"]         = "Nota guardada."

-- ====== Línea temporal ======
L["TIMELINE_TITLE"]           = "Línea Temporal de Azeroth"
L["TIMELINE_FILTER"]          = "Filtrar por expansión"
L["TIMELINE_ALL"]             = "Mostrar todo"

-- ====== Tooltips ======
L["TOOLTIP_HAS_ENTRY"]        = "Click para ver en el Códice"
L["TOOLTIP_RIGHT_CLICK"]      = "Click derecho para más opciones"

-- ====== Opciones ======
L["OPTIONS_TITLE"]            = "Opciones del Códice"
L["OPTIONS_GENERAL"]          = "General"
L["OPTIONS_SHOW_MINIMAP"]     = "Mostrar botón en minimapa"
L["OPTIONS_SHOW_TOOLTIPS"]    = "Mostrar tooltips en NPCs con lore"
L["OPTIONS_SHOW_MAP_PINS"]    = "Mostrar pins en el mapa"
L["OPTIONS_LANGUAGE"]         = "Idioma del Códice"
L["OPTIONS_RESET"]            = "Restablecer datos"

-- ====== Mensajes ======
L["MSG_LOADED"]               = "v%s cargado. Escribe /coa para abrir."
L["MSG_NOT_FOUND"]            = "Entrada no encontrada."
L["MSG_ERROR"]                = "Ha ocurrido un error. Revisa la consola."

-- ====== Slash commands ======
L["SLASH_HELP"]               = "Comandos disponibles: /coa - Abre/Cierra la ventana principal."
