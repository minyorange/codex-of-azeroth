-- ============================================================
-- Codex of Azeroth :: Core Principal
-- ============================================================
-- Clase principal del addon. Maneja:
--   - Inicialización al PLAYER_LOGIN
--   - Eventos globales
--   - Slash commands
--   - Acceso centralizado a submódulos
-- ============================================================

-- Asegurarnos de que el namespace existe
CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

-- ============================================================
-- Tabla principal del addon
-- ============================================================
CoA.name        = "Codex of Azeroth"
CoA.version     = "0.1.0"
CoA.debug       = false  -- Cambiar a true para ver logs en consola

-- Variables de estado
CoA.isLoaded    = false
CoA.isMainFrameOpen = false
CoA.currentEntryId  = nil
CoA.currentCategory = nil

-- Submódulos (se cargan en orden desde el .toc)
CoA.Locale      = nil  -- Se asigna en ADDON_LOADED desde Locale/*.lua
CoA.Database    = nil  -- Database.lua
CoA.Search      = nil  -- Search.lua
CoA.Categories  = nil  -- UI/Categories.lua
CoA.CodeEntry   = nil  -- UI/CodeEntry.lua
CoA.MinimapBtn  = nil  -- UI/MinimapButton.lua
CoA.MainFrame   = nil  -- UI/MainFrame.lua

-- ============================================================
-- Helpers
-- ============================================================
function CoA:Print(msg, ...)
    if select('#', ...) > 0 then
        msg = msg:format(...)
    end
    local color = "|cff88c0ff"  -- Color azul claro de WoW
    DEFAULT_CHAT_FRAME:AddMessage(color .. "[CoA]|r " .. tostring(msg))
end

function CoA:Debug(msg, ...)
    if not self.debug then return end
    msg = "|cffffff00[DEBUG]|r " .. tostring(msg)
    self:Print(msg, ...)
end

function CoA:L(msg)
    if not self.Locale then
        return tostring(msg)
    end
    return self.Locale[msg] or msg
end

-- ============================================================
-- Inicialización
-- ============================================================
function CoA:Initialize()
    if self.isLoaded then return end

    self:Print(self:L("MSG_LOADED"), self.version)
    self.isLoaded = true

    -- Inicializar submódulos
    if self.Database and self.Database.Initialize then
        self.Database:Initialize()
    end

    if self.MinimapBtn and self.MinimapBtn.Initialize then
        self.MinimapBtn:Initialize()
    end

    if self.MainFrame and self.MainFrame.Initialize then
        self.MainFrame:Initialize()
    end

    self:Debug("Addon inicializado correctamente.")
end

-- ============================================================
-- Eventos
-- ============================================================
local eventFrame = CreateFrame("Frame", "CoA_EventFrame")
CoA.eventFrame = eventFrame

-- Registrar ADDON_LOADED INMEDIATAMENTE (esto se ejecuta al cargar el .toc)
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    local coa = CodexOfAzeroth

    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == coa.name then
            coa.Locale = CodexOfAzeroth_L
            coa:Debug(string.format(
                "ADDON_LOADED para %s (locale=%s, traducciones=%s)",
                addonName,
                tostring(GetLocale()),
                tostring(coa.Locale and "OK" or "no disponibles, fallback a claves")
            ))
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        coa:Initialize()
        return
    end

    -- Otros eventos registrados dinámicamente
    if coa.eventHandlers and coa.eventHandlers[event] then
        for _, handler in ipairs(coa.eventHandlers[event]) do
            local ok, err = pcall(handler, event, ...)
            if not ok then
                coa:Print("|cffff4040Error en evento " .. event .. ": " .. tostring(err))
            end
        end
    end
end)

-- ============================================================
-- Slash Commands
-- ============================================================
SLASH_CODEX1 = "/coa"
SLASH_CODEX2 = "/codex"
SlashCmdList["CODEX"] = function(msg)
    msg = (msg or ""):lower()

    if msg == "" or msg == "abrir" or msg == "open" then
        if CoA.MainFrame and CoA.MainFrame.Toggle then
            CoA.MainFrame:Toggle()
        end
    elseif msg == "buscar" or msg == "search" then
        if CoA.MainFrame and CoA.MainFrame.OpenSearch then
            CoA.MainFrame:OpenSearch()
        end
    elseif msg == "ayuda" or msg == "help" then
        CoA:Print(CoA:L("SLASH_HELP"))
    elseif msg == "version" then
        CoA:Print("v" .. CoA.version)
    else
        -- Intentar abrir directamente una entrada por id
        if CoA.MainFrame and CoA.MainFrame.OpenEntry then
            CoA.MainFrame:OpenEntry(msg)
        end
    end
end