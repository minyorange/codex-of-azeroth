CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.Colors = {
    GOLD       = "|cffffcc66",
    BLUE       = "|cff88c0ff",
    RED        = "|cffff4040",
    GREEN      = "|cff66ff66",
    WHITE      = "|cffffffff",
    GRAY       = "|cffaaaaaa",
    DARK_GRAY  = "|cff777777",
    TITLE_BG   = { 0.04, 0.04, 0.08, 0.95 },
    PANEL_BG   = { 0.05, 0.05, 0.1, 0.9 },
    BORDER     = { 0.3, 0.3, 0.4, 1 },
    HIGHLIGHT  = { 0.2, 0.2, 0.4, 0.8 },
    HOVER_BG   = { 0.2, 0.2, 0.3, 0.8 },
}

function CoA.ColorWrap(color, text)
    return color .. tostring(text) .. "|r"
end
