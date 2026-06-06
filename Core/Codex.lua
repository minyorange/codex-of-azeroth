-- ============================================================
-- Codex of Azeroth :: Core Principal
-- ============================================================
-- Clase principal del addon. Maneja:
--   - Inicialización al PLAYER_LOGIN
--   - Eventos globales
--   - Slash commands
--   - Acceso centralizado a submódulos
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

-- ============================================================
-- Tabla principal del addon
-- ============================================================
CoA.title       = "Codex of Azeroth"
CoA.folderName  = "CodexOfAzeroth"
CoA.version     = "0.1.0"
CoA.isLoaded    = false
CoA.isMainFrameOpen = false
CoA.currentEntryId  = nil
CoA.currentCategory = nil

-- Submódulos
CoA.Locale      = nil
CoA.Database    = nil
CoA.Search      = nil
CoA.Categories  = nil
CoA.CodeEntry   = nil
CoA.MinimapBtn  = nil
CoA.MainFrame   = nil

-- ============================================================
-- Helpers
-- ============================================================
function CoA:Print(msg, ...)
    if select('#', ...) > 0 then
        msg = msg:format(...)
    end
    DEFAULT_CHAT_FRAME:AddMessage("|cff88c0ff[CoA]|r " .. tostring(msg))
end

function CoA:L(msg)
    if not self.Locale then return tostring(msg) end
    return self.Locale[msg] or msg
end

-- ============================================================
-- Eventos
-- ============================================================
-- Frame que escucha eventos desde el momento en que se carga
local f = CreateFrame("Frame", nil, UIParent)
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")

f:SetScript("OnEvent", function(self, event, ...)
    local coa = CodexOfAzeroth
    if not coa then return end

    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == "CodexOfAzeroth" then
            -- Cargar locale si existe
            coa.Locale = CodexOfAzeroth_L
            DEFAULT_CHAT_FRAME:AddMessage("|cff88c0ff[CoA] Addon cargado|r")
        end

    elseif event == "PLAYER_LOGIN" then
        -- Inicializar addon (con proteccion contra errores)
        local ok, err = pcall(function()
            -- Marcar como cargado
            if coa.isLoaded then return end
            coa.isLoaded = true

            coa:Print("v" .. coa.version .. " cargado. Escribe /coa para abrir.")

            -- Inicializar Database
            if coa.Database and coa.Database.Initialize then
                coa.Database:Initialize()
            end

            -- Inicializar MinimapButton
            if coa.MinimapBtn and coa.MinimapBtn.Initialize then
                coa.MinimapBtn:Initialize()
            end

            -- Inicializar MainFrame
            if coa.MainFrame and coa.MainFrame.Initialize then
                coa.MainFrame:Initialize()
            end
        end)

        if not ok then
            DEFAULT_CHAT_FRAME:AddMessage("|cffff4040[CoA ERROR] " .. tostring(err) .. "|r")
        end
    end
end)

-- ============================================================
-- Slash Commands
-- ============================================================
SLASH_CODEX1 = "/coa"
SLASH_CODEX2 = "/codex"
SlashCmdList["CODEX"] = function(msg)
    local coa = CodexOfAzeroth
    msg = (msg or ""):lower()

    if msg == "" then
        if coa.MainFrame and coa.MainFrame.Toggle then
            local ok, err = pcall(coa.MainFrame.Toggle, coa.MainFrame)
            if not ok then
                coa:Print("|cffff4040Error: " .. tostring(err))
            end
        else
            coa:Print("MainFrame no inicializado. Prueba /reload")
        end
    elseif msg == "ayuda" or msg == "help" then
        coa:Print("Comandos: /coa - abre/cierra | /coa version - versión")
    elseif msg == "version" then
        coa:Print("v" .. coa.version)
    else
        if coa.MainFrame and coa.MainFrame.OpenEntry then
            coa.MainFrame:OpenEntry(msg)
        end
    end
end