-- ============================================================
-- Codex of Azeroth :: MainFrame
-- ============================================================
-- Ventana principal del Códice. Contiene:
--   - Título y barra de búsqueda
--   - Panel lateral de categorías
--   - Vista de entrada
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.MainFrame = {}
local MF = CoA.MainFrame

-- ============================================================
-- Inicializar
-- ============================================================
function MF:Initialize()
    if self.frame then return end

    -- Frame raíz
    local f = CreateFrame("Frame", "CoA_MainFrame", UIParent, "BackdropTemplate")
    f:SetSize(780, 540)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetResizable(true)
    f:SetMinResize(600, 400)
    f:SetMaxResize(1200, 900)
    f:Hide()

    f:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        insets   = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    f:SetBackdropColor(0.04, 0.04, 0.08, 0.95)
    f:SetBackdropBorderColor(0.4, 0.4, 0.5, 1)

    -- Título (draggable)
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", f, "TOP", 0, -16)
    title:SetText(CoA:L("WINDOW_TITLE"))
    title:SetTextColor(1, 0.85, 0.4)
    f.title = title

    -- Botón cerrar
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
    close:SetScript("OnClick", function() self:Hide() end)
    f.close = close

    -- Barra de búsqueda
    local searchFrame = CreateFrame("Frame", nil, f, "BackdropTemplate")
    searchFrame:SetSize(550, 30)
    searchFrame:SetPoint("TOP", f, "TOP", 0, -42)
    searchFrame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets   = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    searchFrame:SetBackdropColor(0, 0, 0, 0.5)

    local searchBox = CreateFrame("EditBox", nil, searchFrame)
    searchBox:SetSize(520, 24)
    searchBox:SetPoint("CENTER", searchFrame, "CENTER", 0, 0)
    searchBox:SetAutoFocus(false)
    searchBox:SetFontObject("GameFontHighlight")
    searchBox:SetTextColor(1, 1, 1)
    searchBox:SetText(CoA:L("SEARCH_PLACEHOLDER"))
    searchBox:SetTextColor(0.6, 0.6, 0.6)
    searchBox.searchFrame = searchFrame

    searchBox:SetScript("OnEditFocusGained", function(self)
        if self:GetText() == CoA:L("SEARCH_PLACEHOLDER") then
            self:SetText("")
            self:SetTextColor(1, 1, 1)
        end
    end)
    searchBox:SetScript("OnEditFocusLost", function(self)
        if self:GetText() == "" then
            self:SetText(CoA:L("SEARCH_PLACEHOLDER"))
            self:SetTextColor(0.6, 0.6, 0.6)
        end
    end)
    searchBox:SetScript("OnEnterPressed", function(self)
        local query = self:GetText()
        if query and query ~= "" and query ~= CoA:L("SEARCH_PLACEHOLDER") then
            MF:DoSearch(query)
        end
    end)

    f.searchBox = searchBox
    f.searchFrame = searchFrame

    -- Permitir arrastrar el frame desde la barra de título
    f:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            self:StartMoving()
        end
    end)
    f:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            self:StopMovingOrSizing()
        end
    end)
    f:SetScript("OnHide", function(self)
        self:StopMovingOrSizing()
    end)

    -- Crear sub-paneles
    CoA.Categories:CreatePanel(f)
    CoA.CodeEntry:Create(f)

    -- Conectar callback de categorías
    CoA.Categories.OnCategoryClick = function(categoryId)
        if categoryId then
            local entries = CoA.Database:GetByCategory(categoryId)
            CoA.CodeEntry:ShowList(entries, CoA.Database:GetCategoryDisplayName(categoryId))
        else
            local entries = CoA.Database:GetAll()
            CoA.CodeEntry:ShowList(entries, CoA:L("CATEGORY_ALL"))
        end
        CoA.currentCategory = categoryId
    end

    self.frame = f
    f:Show()
    f:Hide()

    -- Actualizar estadísticas
    C_Timer.After(2, function()
        if CoA.Categories and CoA.Categories.UpdateStats then
            CoA.Categories:UpdateStats()
        end
    end)
end

-- ============================================================
-- Mostrar/Ocultar
-- ============================================================
function MF:Toggle()
    if not self.frame then self:Initialize() end
    if self.frame:IsShown() then
        self.frame:Hide()
        CoA.isMainFrameOpen = false
    else
        self.frame:Show()
        CoA.isMainFrameOpen = true
    end
end

function MF:Show()
    if not self.frame then self:Initialize() end
    self.frame:Show()
    CoA.isMainFrameOpen = true

    -- Actualizar estadísticas inmediatamente al mostrar
    if CoA.Categories and CoA.Categories.UpdateStats then
        CoA.Categories:UpdateStats()
    end
end

function MF:Hide()
    if self.frame then self.frame:Hide() end
    CoA.isMainFrameOpen = false
end

function MF:OpenSearch()
    if not self.frame then self:Initialize() end
    self:Show()
    if self.frame.searchBox then
        self.frame.searchBox:SetFocus()
    end
end

-- ============================================================
-- Hacer una búsqueda
-- ============================================================
function MF:DoSearch(query)
    if not query or query == "" then return end

    self:Show()
    local results = CoA.Search:Search(query)
    CoA.Search:AddToHistory(query)

    if results and #results > 0 then
        CoA.CodeEntry:ShowList(results, string.format("Resultados: '%s' (%d)", query, #results))
    else
        CoA.CodeEntry:ShowList({}, string.format("Sin resultados para '%s'", query))
    end
end

-- ============================================================
-- Abrir una entrada específica
-- ============================================================
function MF:OpenEntry(id)
    if not id then return end
    local entry = CoA.Database:GetEntry(id)
    if entry then
        self:Show()
        CoA.CodeEntry:ShowEntry(entry)
    else
        -- Intentar búsqueda difusa
        local results = CoA.Search:QuickSearch(id, 5)
        if results and #results > 0 then
            self:Show()
            CoA.CodeEntry:ShowList(results, "Quizás quisiste decir: '" .. id .. "'")
        end
    end
end
