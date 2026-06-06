-- ============================================================
-- Codex of Azeroth :: Categories UI
-- ============================================================
-- Sidebar de navegación con las categorías del Códice.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.Categories = {}
local Categories = CoA.Categories

-- Estructura de categorías
Categories.list = {
    { id = "npcs",      icon = "Interface\\Icons\\INV_Misc_QuestionMark" },
    { id = "locations", icon = "Interface\\Icons\\INV_Misc_Map_01" },
    { id = "factions",  icon = "Interface\\Icons\\INV_Bannerpvp_02" },
    { id = "events",    icon = "Interface\\Icons\\INV_Scroll_03" },
    { id = "concepts",  icon = "Interface\\Icons\\INV_Misc_Book_09" },
}

-- Crear el panel de categorías
function Categories:CreatePanel(parent)
    if self.frame then return self.frame end

    local L = CoA.Locale or {}
    local frame = CreateFrame("Frame", "CoA_CategoriesPanel", parent, "BackdropTemplate")
    frame:SetSize(200, 500)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, 0)

    -- Backdrop
    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets   = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(0.05, 0.05, 0.1, 0.9)
    frame:SetBackdropBorderColor(0.3, 0.3, 0.4, 1)

    -- Título
    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", frame, "TOP", 0, -10)
    title:SetText(CoA:L("ADDON_NAME"))
    title:SetTextColor(1, 0.85, 0.4)

    -- Subtítulo
    local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subtitle:SetPoint("TOP", title, "BOTTOM", 0, -4)
    subtitle:SetText("|cffaaaaaaNavegación|r")

    -- Lista de botones
    local yOffset = -50
    self.buttons = {}

    for i, cat in ipairs(self.list) do
        local btn = CreateFrame("Button", nil, frame, "BackdropTemplate")
        btn:SetSize(180, 32)
        btn:SetPoint("TOP", frame, "TOP", 0, yOffset)

        btn:SetBackdrop({
            bgFile   = "Interface\\Buttons\\UI-Panel-Button-Up",
            edgeFile = "Interface\\Buttons\\UI-Panel-Button-Border",
            edgeSize = 8,
            insets   = { left = 2, right = 2, top = 2, bottom = 2 },
        })

        -- Icono
        local icon = btn:CreateTexture(nil, "ARTWORK")
        icon:SetSize(20, 20)
        icon:SetPoint("LEFT", btn, "LEFT", 8, 0)
        icon:SetTexture(cat.icon)

        -- Texto
        local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("LEFT", icon, "RIGHT", 6, 0)
        text:SetText(CoA.Database:GetCategoryDisplayName(cat.id))

        -- Eventos de click
        btn:SetScript("OnClick", function(self)
            if CoA.Categories.OnCategoryClick then
                CoA.Categories:OnCategoryClick(cat.id)
            end
        end)

        btn:SetScript("OnEnter", function(self)
            self:SetBackdropColor(0.2, 0.2, 0.3, 0.8)
        end)
        btn:SetScript("OnLeave", function(self)
            self:SetBackdropColor(0, 0, 0, 0)
        end)

        self.buttons[cat.id] = btn
        yOffset = yOffset - 38
    end

    -- Botón "Todas las entradas"
    local allBtn = CreateFrame("Button", nil, frame, "BackdropTemplate")
    allBtn:SetSize(180, 28)
    allBtn:SetPoint("TOP", frame, "TOP", 0, yOffset - 10)
    allBtn:SetBackdrop({
        bgFile   = "Interface\\Buttons\\UI-Panel-Button-Up",
        edgeFile = "Interface\\Buttons\\UI-Panel-Button-Border",
        edgeSize = 8,
    })
    local allText = allBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    allText:SetPoint("CENTER", allBtn, "CENTER")
    allText:SetText(CoA:L("CATEGORY_ALL"))
    allBtn:SetScript("OnClick", function()
        if CoA.Categories.OnCategoryClick then
            CoA.Categories:OnCategoryClick(nil)
        end
    end)
    allBtn:SetScript("OnEnter", function(self) self:SetBackdropColor(0.2, 0.2, 0.3, 0.8) end)
    allBtn:SetScript("OnLeave", function(self) self:SetBackdropColor(0, 0, 0, 0) end)

    -- Footer con estadísticas
    yOffset = yOffset - 50
    local stats = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    stats:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    stats:SetTextColor(0.7, 0.7, 0.7)
    stats:SetText("|cffaaaaaaCargando...|r")
    self.statsLabel = stats

    self.frame = frame
    return frame
end

-- Actualizar estadísticas
function Categories:UpdateStats()
    if not self.statsLabel then return end
    if not CoA.LoreData then return end
    local stats = CoA.LoreData:GetStats()
    if stats and stats.total then
        self.statsLabel:SetText(string.format(
            "|cffaaaaaa%d entradas en el Códice|r",
            stats.total
        ))
    end
end
