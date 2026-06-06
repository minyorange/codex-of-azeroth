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
CoA.title       = "Codex of Azeroth"
CoA.folderName  = "CodexOfAzeroth"
CoA.version     = "0.1.0"
CoA.debug       = true  -- DEBUG ACTIVADO para ver errores

-- Variables de estado
CoA.isLoaded    = false
CoA.isMainFrameOpen = false
CoA.currentEntryId  = nil
CoA.currentCategory = nil

-- Submódulos (se cargan en orden desde el .toc)
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

function CoA:Debug(msg, ...)
    -- debug siempre activo mientras lo necesitemos
    msg = "|cffffff00[CoA DEBUG]|r " .. tostring(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg)
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

    -- Inicializar submódulos con protección pcall para ver errores
    local modules = {
        {"Database", self.Database},
        {"MinimapBtn", self.MinimapBtn},
        {"MainFrame", self.MainFrame},
    }

    for _, mod in ipairs(modules) do
        local name, obj = mod[1], mod[2]
        if obj and obj.Initialize then
            local ok, err = pcall(obj.Initialize, obj)
            if not ok then
                self:Print("|cffff4040ERROR en " .. name .. ": " .. tostring(err))
            end
        else
            self:Debug(name .. " no tiene Initialize() o es nil")
        end
    end

    self:Debug("Addon inicializado correctamente.")
end

-- ============================================================
-- Eventos
-- ============================================================
local eventFrame = CreateFrame("Frame", "CoA_EventFrame")
CoA.eventFrame = eventFrame

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    local coa = CodexOfAzeroth

    if event == "ADDON_LOADED" then
        local addonName = ...
        if addonName == coa.folderName then
            coa.Locale = CodexOfAzeroth_L
            DEFAULT_CHAT_FRAME:AddMessage("|cff88c0ff[CoA] Addon cargado|r")
        end
        return
    end

    if event == "PLAYER_LOGIN" then
        coa:Initialize()
        return
    end
end)

-- ============================================================
-- Slash Commands
-- ============================================================
SLASH_CODEX1 = "/coa"
SLASH_CODEX2 = "/codex"
SlashCmdList["CODEX"] = function(msg)
    msg = (msg or ""):lower()
    coa:Debug("Slash ejecutado, msg='" .. tostring(msg) .. "'")
    coa:Debug("MainFrame = " .. tostring(CoA.MainFrame))
    if CoA.MainFrame then
        coa:Debug("MainFrame.Toggle = " .. tostring(type(CoA.MainFrame.Toggle)))
        coa:Debug("MainFrame.frame = " .. tostring(CoA.MainFrame.frame))
    end

    if msg == "" or msg == "abrir" or msg == "open" then
        if CoA.MainFrame and CoA.MainFrame.Toggle then
            local ok, err = pcall(CoA.MainFrame.Toggle, CoA.MainFrame)
            if not ok then
                coa:Print("|cffff4040ERROR en Toggle: " .. tostring(err))
            end
        else
            coa:Print("|cffff4040MainFrame no disponible. Recarga con /reload|r")
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
        if CoA.MainFrame and CoA.MainFrame.OpenEntry then
            CoA.MainFrame:OpenEntry(msg)
        end
    end
end