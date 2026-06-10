CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local Sidebar = CoA.Class:extend()

function Sidebar:constructor(parent)
    self.parent = parent
    self.frame = nil
    self.buttons = {}
    self.statsLabel = nil
    self.activeCategory = nil
    self.onCategoryClick = nil
end

function Sidebar:Create()
    if self.frame then return self.frame end

    local frame = CreateFrame("Frame", "CoA_Sidebar", self.parent, "BackdropTemplate")
    frame:SetSize(200, 480)
    frame:SetPoint("TOPLEFT", self.parent, "TOPLEFT", 8, -70)
    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 24,
        insets   = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(unpack(CoA.Colors.PANEL_BG))
    frame:SetBackdropBorderColor(0.35, 0.3, 0.15, 1)

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", frame, "TOP", 0, -10)
    title:SetText(CoA:L("CATEGORY_NAVIGATION"))
    title:SetTextColor(0.7, 0.7, 0.7)

    local categories = {
        { id = "npcs",      icon = "Interface\\Icons\\INV_Misc_Head_Orc_01" },
        { id = "locations", icon = "Interface\\Icons\\INV_Misc_Map_01" },
        { id = "factions",  icon = "Interface\\Icons\\INV_BannerPVP_02" },
        { id = "events",    icon = "Interface\\Icons\\INV_Scroll_03" },
        { id = "concepts",  icon = "Interface\\Icons\\INV_Misc_Book_09" },
    }

    local yOffset = -40
    self.buttons = {}

    for _, cat in ipairs(categories) do
        local btn = self:_CreateButton(frame, cat, yOffset)
        self.buttons[cat.id] = btn
        yOffset = yOffset - 44
    end

    self.allButton = self:_CreateAllButton(frame, yOffset - 8)
    yOffset = yOffset - 50

    local separator = frame:CreateTexture(nil, "OVERLAY")
    separator:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    separator:SetSize(170, 1)
    separator:SetPoint("TOP", frame, "TOP", 0, yOffset)
    separator:SetVertexColor(0.4, 0.35, 0.2, 0.8)

    local stats = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    stats:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    stats:SetText(CoA:L("STATS_LOADING"))
    self.statsLabel = stats

    self.frame = frame
    return frame
end

function Sidebar:_CreateButton(parent, cat, yOffset)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(180, 36)
    btn:SetPoint("TOP", parent, "TOP", 0, yOffset)

    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(24, 24)
    icon:SetPoint("LEFT", btn, "LEFT", 8, 0)
    icon:SetTexture(cat.icon)

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", icon, "RIGHT", 8, 0)
    text:SetText(CoA.Database:GetCategoryDisplayName(cat.id))
    text:SetTextColor(0.9, 0.9, 0.9)

    local highlight = btn:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    highlight:SetBlendMode("ADD")
    highlight:SetAlpha(0.3)
    highlight:SetPoint("TOPLEFT", btn, "TOPLEFT", -2, 2)
    highlight:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 2, -2)

    local activeTex = btn:CreateTexture(nil, "BACKGROUND")
    activeTex:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    activeTex:SetVertexColor(0.3, 0.25, 0.1, 0.6)
    activeTex:SetPoint("TOPLEFT", btn, "TOPLEFT", -2, 2)
    activeTex:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 2, -2)
    activeTex:Hide()
    btn.activeTex = activeTex

    btn:SetScript("OnClick", function()
        if self.onCategoryClick then
            self:SetActive(cat.id)
            self.onCategoryClick(cat.id)
        end
    end)

    btn.catId = cat.id
    return btn
end

function Sidebar:_CreateAllButton(parent, yOffset)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(180, 28)
    btn:SetPoint("TOP", parent, "TOP", 0, yOffset)

    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    text:SetPoint("LEFT", btn, "LEFT", 12, 0)
    text:SetText(CoA:L("CATEGORY_ALL"))
    text:SetTextColor(0.8, 0.8, 0.8)

    local activeTex = btn:CreateTexture(nil, "BACKGROUND")
    activeTex:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
    activeTex:SetVertexColor(0.3, 0.25, 0.1, 0.6)
    activeTex:SetPoint("TOPLEFT", btn, "TOPLEFT", -2, 2)
    activeTex:SetPoint("BOTTOMRIGHT", btn, "BOTTOMRIGHT", 2, -2)
    activeTex:Hide()
    btn.activeTex = activeTex

    btn:SetScript("OnClick", function()
        if self.onCategoryClick then
            self:SetActive(nil)
            self.onCategoryClick(nil)
        end
    end)

    return btn
end

function Sidebar:SetActive(categoryId)
    self.activeCategory = categoryId
    for id, btn in pairs(self.buttons) do
        if btn.activeTex then
            if id == categoryId then
                btn.activeTex:Show()
            else
                btn.activeTex:Hide()
            end
        end
    end
    if self.allButton and self.allButton.activeTex then
        if categoryId == nil then
            self.allButton.activeTex:Show()
        else
            self.allButton.activeTex:Hide()
        end
    end
end

function Sidebar:UpdateStats()
    if not self.statsLabel then return end
    if not CoA.LoreData then return end
    local stats = CoA.LoreData:GetStats()
    if stats and stats.total then
        self.statsLabel:SetText(string.format(CoA:L("STATS_ENTRIES"), stats.total))
    end
end

CoA.Sidebar = Sidebar
