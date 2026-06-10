CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local MainFrame = CoA.Class:extend()

function MainFrame:constructor()
    self.frame = nil
    self.sidebar = nil
    self.entryView = nil
    self.searchBar = nil
end

function MainFrame:Initialize()
    if self.frame then return end

    local f = CreateFrame("Frame", "CoA_MainFrame", UIParent, "BackdropTemplate")
    f:SetSize(820, 580)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetMovable(true)
    f:EnableMouse(true)
    f:SetResizable(true)
    if f.SetMinResize then
        f:SetMinResize(700, 480)
    end
    if f.SetMaxResize then
        f:SetMaxResize(1400, 1000)
    end
    f:Hide()

    f:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        insets   = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    f:SetBackdropColor(unpack(CoA.Colors.TITLE_BG))
    f:SetBackdropBorderColor(unpack(CoA.Colors.BORDER))

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", f, "TOP", 0, -14)
    title:SetText(CoA:L("WINDOW_TITLE"))
    title:SetTextColor(1, 0.85, 0.4)
    f.title = title

    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -8, -8)
    close:SetScript("OnClick", function() self:Hide() end)

    f:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then f:StartMoving() end
    end)
    f:SetScript("OnMouseUp", function(_, button)
        if button == "LeftButton" then f:StopMovingOrSizing() end
    end)
    f:SetScript("OnHide", function() f:StopMovingOrSizing() end)
    f:SetScript("OnSizeChanged", function()
        self:_OnResize()
    end)

    local sidebar = CoA.Sidebar:new(f)
    sidebar:Create()
    sidebar.onCategoryClick = function(categoryId)
        if categoryId then
            local entries = CoA.Database:GetByCategory(categoryId)
            self.entryView:ShowList(entries, CoA.Database:GetCategoryDisplayName(categoryId))
        else
            self.entryView:ShowList(CoA.Database:GetAll(), CoA:L("CATEGORY_ALL"))
        end
        CoA.currentCategory = categoryId
    end
    self.sidebar = sidebar

    self.entryView = CoA.EntryView:new(f)
    self.entryView:Create()
    self.entryView:ShowWelcome()

    self.searchBar = CoA.SearchBar:new(f, function(query)
        self:DoSearch(query)
    end)
    self.searchBar:Create()
    self.searchBar:SetPoint("TOP", self.entryView.frame, "BOTTOM", 0, -4)
    self.searchBar:SetPoint("LEFT", self.entryView.frame, "LEFT", 0, 0)
    self.searchBar:SetPoint("RIGHT", self.entryView.frame, "RIGHT", 0, 0)

    self.frame = f

    C_Timer.After(2, function()
        if self.sidebar and self.sidebar.UpdateStats then
            self.sidebar:UpdateStats()
        end
    end)
end

function MainFrame:_OnResize()
    if not self.frame then return end
    local width = self.frame:GetWidth()
    local height = self.frame:GetHeight()

    if self.sidebar and self.sidebar.frame then
        local sh = math.max(200, height - 80)
        self.sidebar.frame:SetHeight(sh)
    end

    if self.entryView and self.entryView.frame then
        local ew = math.max(300, width - 230)
        local eh = math.max(200, height - 100)
        self.entryView.frame:SetSize(ew, eh)
    end

    if self.searchBar and self.searchBar.frame then
        if self.frame then
            local sw = math.max(200, width - 40)
            self.searchBar.frame:SetWidth(sw)
        end
    end
end

function MainFrame:Toggle()
    if not self.frame then self:Initialize() end
    if self.frame:IsShown() then
        self.frame:Hide()
        CoA.isMainFrameOpen = false
    else
        self.frame:Show()
        CoA.isMainFrameOpen = true
    end
end

function MainFrame:Show()
    if not self.frame then self:Initialize() end
    self.frame:Show()
    CoA.isMainFrameOpen = true

    if self.sidebar and self.sidebar.UpdateStats then
        self.sidebar:UpdateStats()
    end
end

function MainFrame:Hide()
    if self.frame then self.frame:Hide() end
    CoA.isMainFrameOpen = false
end

function MainFrame:OpenSearch()
    if not self.frame then self:Initialize() end
    self:Show()
    if self.searchBar then
        self.searchBar:Focus()
    end
end

function MainFrame:DoSearch(query)
    if not query or query == "" then return end

    self:Show()
    local results = CoA.Search:Search(query)
    CoA.Search:AddToHistory(query)

    if results and #results > 0 then
        self.entryView:ShowList(results, string.format(CoA:L("SEARCH_RESULTS_FOR"), query, #results))
    else
        self.entryView:ShowList({}, string.format(CoA:L("SEARCH_NO_RESULTS_FOR"), query))
    end
end

function MainFrame:OpenEntry(id)
    if not id then return end
    local entry = CoA.Database:GetEntry(id)
    if entry then
        self:Show()
        self.entryView:ShowEntry(entry)
    else
        local results = CoA.Search:QuickSearch(id, 5)
        if results and #results > 0 then
            self:Show()
            self.entryView:ShowList(results, string.format(CoA:L("SEARCH_DID_YOU_MEAN"), id))
        end
    end
end

CoA.MainFrame = MainFrame:new()
