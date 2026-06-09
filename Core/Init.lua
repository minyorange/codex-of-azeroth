CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth
setmetatable(CoA, { __index = CoA })

CoA.name    = "Codex of Azeroth"
CoA.version = "0.2.0"
CoA.debug   = false

CoA.isLoaded        = false
CoA.isMainFrameOpen = false
CoA.currentEntryId  = nil
CoA.currentCategory = nil

function CoA:Print(msg, ...)
    if select("#", ...) > 0 then
        msg = msg:format(...)
    end
    DEFAULT_CHAT_FRAME:AddMessage(CoA.Colors.BLUE .. "[CoA]|r " .. tostring(msg))
end

function CoA:Debug(msg, ...)
    if not self.debug then return end
    self:Print(CoA.ColorWrap(CoA.Colors.GOLD, "[DEBUG] " .. tostring(msg)), ...)
end

function CoA:L(msg)
    if not self.Locale then return tostring(msg) end
    return self.Locale[msg] or msg
end

function CoA:Initialize()
    if self.isLoaded then return end

    self.Locale = CodexOfAzeroth_L

    self.isLoaded = true
    self:Print(self:L("MSG_LOADED"), self.version)

    if self.Events then
        self.Events:On("PLAYER_LOGIN", function()
            self:_OnPlayerLogin()
        end)
        self:Debug("Eventos registrados. Esperando PLAYER_LOGIN...")
    end

    C_Timer.After(1, function()
        if not self._loginDone then
            self:_OnPlayerLogin()
        end
    end)
end

function CoA:_OnPlayerLogin()
    if self._loginDone then return end
    self._loginDone = true

    self:Debug("PLAYER_LOGIN: Inicializando UI...")

    if self.MinimapBtn and self.MinimapBtn.Initialize then
        self.MinimapBtn:Initialize()
    end

    if self.MainFrame and self.MainFrame.Initialize then
        self.MainFrame:Initialize()
    end

    if self.LoreData and self.LoreData.ReportStats then
        C_Timer.After(1, function()
            self.LoreData:ReportStats()
        end)
    end

    self:Debug("Addon inicializado correctamente.")
end

SLASH_CODEX1 = "/coa"
SLASH_CODEX2 = "/codex"
SlashCmdList["CODEX"] = function(msg)
    msg = (msg or ""):lower():trim()

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
        if CoA.MainFrame and CoA.MainFrame.OpenEntry then
            CoA.MainFrame:OpenEntry(msg)
        end
    end
end

CoA:Initialize()
