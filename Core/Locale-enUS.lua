local locale = GetLocale()
if locale ~= "enUS" and locale ~= "enGB" then return end

local L = CodexOfAzeroth_L
if not L then return end

L["WINDOW_TITLE"]             = "Codex of Azeroth"
L["WELCOME_MESSAGE"]          = "Welcome to the Codex. Select a category or search for an entry to begin."
L["BUTTON_CLOSE"]             = "Close"
L["BUTTON_SEARCH"]            = "Search"
L["BUTTON_BACK"]              = "Back"

L["CATEGORY_NPCS"]            = "Characters"
L["CATEGORY_LOCATIONS"]       = "Locations"
L["CATEGORY_FACTIONS"]        = "Factions"
L["CATEGORY_EVENTS"]          = "Historical Events"
L["CATEGORY_CONCEPTS"]        = "Concepts"
L["CATEGORY_FAVORITES"]       = "Favorites"
L["CATEGORY_TIMELINE"]        = "Timeline"
L["CATEGORY_ALL"]             = "All entries"
L["CATEGORY_EXPANSION"]       = "By Expansion"
L["CATEGORY_NAVIGATION"]      = "Navigation"

L["SEARCH_PLACEHOLDER"]       = "Search the Codex..."
L["SEARCH_NO_RESULTS"]        = "No results found for \"%s\"."
L["SEARCH_RESULTS"]           = "Search results"
L["SEARCH_HISTORY"]           = "Recent searches"

L["ENTRY_SUMMARY"]            = "Summary"
L["ENTRY_DESCRIPTION"]        = "Description"
L["ENTRY_RELATED"]            = "Related entries"
L["ENTRY_SOURCES"]            = "Sources"
L["ENTRY_FACTION"]            = "Faction"
L["ENTRY_RACE"]               = "Race"
L["ENTRY_LOCATION"]           = "Location"
L["ENTRY_ERAS"]               = "Eras"
L["ENTRY_EXPANSIONS"]         = "Expansions"
L["ENTRY_TAGS"]               = "Tags"

L["TIMELINE_TITLE"]           = "Azeroth Timeline"
L["TIMELINE_FILTER"]          = "Filter by expansion"
L["TIMELINE_ALL"]             = "Show all"

L["TOOLTIP_HAS_ENTRY"]        = "Click to view in the Codex"
L["TOOLTIP_RIGHT_CLICK"]      = "Right click for more options"

L["OPTIONS_TITLE"]            = "Codex Options"
L["OPTIONS_GENERAL"]          = "General"
L["OPTIONS_SHOW_MINIMAP"]     = "Show minimap button"

L["MSG_LOADED"]               = "v%s loaded. Type /coa to open."
L["MSG_NOT_FOUND"]            = "Entry not found."
L["MSG_ERROR"]                = "An error occurred. Check your console."

L["SLASH_HELP"]               = "Available commands: /coa - Open/Close the main window. /coa search <text> - Search. /coa version - Version."

L["STATS_LOADING"]            = "|cffaaaaaaLoading...|r"
L["STATS_ENTRIES"]            = "|cffaaaaaa%d entries in the Codex|r"
L["ENTRIES_COUNT"]            = "%d entries"

L["FACTION_LABEL"]            = "|cffaaaaaaFaction:|r"
L["RACE_LABEL"]               = "|cffaaaaaaRace:|r"
L["LOCATION_LABEL"]           = "|cffaaaaaaLocation:|r"

L["SEARCH_RESULTS_FOR"]       = "Results: '%s' (%d)"
L["SEARCH_NO_RESULTS_FOR"]    = "No results for '%s'"
L["SEARCH_DID_YOU_MEAN"]     = "Did you mean: '%s'"
