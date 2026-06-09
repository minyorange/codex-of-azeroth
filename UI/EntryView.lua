CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local EntryView = CoA.Class:extend()

function EntryView:constructor(parent)
    self.parent = parent
    self.frame = nil
    self.scroll = nil
    self.content = nil
    self.modelView = nil
    self.listButtons = {}
    self.fields = {}
    self.currentTab = "lore"
    self._currentEntry = nil
    self._listEntries = nil
    self._listTitle = nil
end

function EntryView:Create()
    if self.frame then return self.frame end

    local f = CreateFrame("Frame", "CoA_EntryView", self.parent)
    f:SetSize(540, 470)
    f:SetPoint("TOPLEFT", self.parent, "TOPLEFT", 220, -70)

    self.modelView = CoA.ModelView:new(f)
    self.modelView:Create()
    self.modelView.frame:SetPoint("TOP", f, "TOP", 0, 0)

    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", self.modelView.frame, "BOTTOMLEFT", 0, -10)
    title:SetWidth(520)
    title:SetJustifyH("LEFT")
    title:SetTextColor(1, 0.85, 0.4)
    self.fields.title = title

    local subtitle = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -2)
    subtitle:SetTextColor(0.7, 0.7, 0.7)
    self.fields.subtitle = subtitle

    local info = f:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    info:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -2)
    info:SetWidth(520)
    info:SetJustifyH("LEFT")
    info:SetTextColor(0.6, 0.7, 0.9)
    self.fields.info = info

    local tabs = self:_CreateTabs(f, info)
    self.fields.tabFrame = tabs

    local scroll = CreateFrame("ScrollFrame", nil, f, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", tabs, "BOTTOMLEFT", 0, 0)
    scroll:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -8, 8)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(500, 1)
    scroll:SetScrollChild(content)

    local tabContent = {}

    tabContent.summaryLabel = self:_CreateLabel(content, nil, CoA:L("ENTRY_SUMMARY"), 0)
    local summary = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    summary:SetPoint("TOPLEFT", tabContent.summaryLabel, "BOTTOMLEFT", 0, -2)
    summary:SetWidth(480)
    summary:SetJustifyH("LEFT")
    summary:SetTextColor(0.9, 0.9, 0.9)
    tabContent.summary = summary

    tabContent.descLabel = self:_CreateLabel(content, summary, CoA:L("ENTRY_DESCRIPTION"), -8)
    local desc = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    desc:SetPoint("TOPLEFT", tabContent.descLabel, "BOTTOMLEFT", 0, -2)
    desc:SetWidth(480)
    desc:SetJustifyH("LEFT")
    desc:SetTextColor(0.9, 0.9, 0.9)
    desc:SetSpacing(2)
    tabContent.description = desc

    local tags = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    tags:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -10)
    tags:SetWidth(480)
    tags:SetJustifyH("LEFT")
    tags:SetTextColor(0.7, 0.8, 1)
    tabContent.tags = tags

    tabContent.relLabel = self:_CreateLabel(content, tags, CoA:L("ENTRY_RELATED"), -8)
    local rel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rel:SetPoint("TOPLEFT", tabContent.relLabel, "BOTTOMLEFT", 0, -2)
    rel:SetWidth(480)
    rel:SetJustifyH("LEFT")
    rel:SetTextColor(0.9, 0.9, 0.9)
    tabContent.related = rel

    tabContent.srcLabel = self:_CreateLabel(content, rel, CoA:L("ENTRY_SOURCES"), -8)
    local src = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    src:SetPoint("TOPLEFT", tabContent.srcLabel, "BOTTOMLEFT", 0, -2)
    src:SetWidth(480)
    src:SetJustifyH("LEFT")
    src:SetTextColor(0.7, 0.7, 0.7)
    tabContent.sources = src

    self.tabContent = tabContent
    self.frame = f
    self.content = content
    self.scroll = scroll

    return f
end

function EntryView:_CreateTabs(parent, anchor)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(520, 24)
    frame:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -6)

    local tabs = {
        { id = "lore",  label = CoA:L("ENTRY_DESCRIPTION") },
        { id = "rel",   label = CoA:L("ENTRY_RELATED") },
        { id = "src",   label = CoA:L("ENTRY_SOURCES") },
    }

    local tabButtons = {}
    local xPos = 0

    for i, tab in ipairs(tabs) do
        local btn = CreateFrame("Button", nil, frame)
        btn:SetSize(100, 22)
        btn:SetPoint("LEFT", frame, "LEFT", xPos, 0)

        local bg = btn:CreateTexture(nil, "BACKGROUND")
        bg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
        bg:SetSize(100, 22)
        bg:SetPoint("CENTER")
        btn.bg = bg

        local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        text:SetPoint("CENTER", btn, "CENTER")
        text:SetText(tab.label)
        text:SetTextColor(0.7, 0.7, 0.7)
        btn.text = text

        local activeBg = btn:CreateTexture(nil, "BACKGROUND")
        activeBg:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
        activeBg:SetSize(100, 22)
        activeBg:SetPoint("CENTER")
        activeBg:Hide()
        btn.activeBg = activeBg

        btn:SetScript("OnClick", function()
            self:SetTab(tab.id)
        end)

        tabButtons[tab.id] = btn
        xPos = xPos + 105
    end

    frame.buttons = tabButtons
    frame:SetWidth(xPos)

    local separator = frame:CreateTexture(nil, "OVERLAY")
    separator:SetTexture("Interface\\Tooltips\\UI-Tooltip-Border")
    separator:SetSize(520, 1)
    separator:SetPoint("BOTTOM", frame, "BOTTOM", 0, 0)
    separator:SetVertexColor(0.4, 0.35, 0.2, 0.6)

    self.tabButtons = tabButtons
    return frame
end

function EntryView:SetTab(tabId)
    self.currentTab = tabId
    for id, btn in pairs(self.tabButtons) do
        if id == tabId then
            btn.activeBg:Show()
            btn.text:SetTextColor(1, 0.85, 0.4)
        else
            btn.activeBg:Hide()
            btn.text:SetTextColor(0.7, 0.7, 0.7)
        end
    end
    self:_UpdateTabContent()
end

function EntryView:_UpdateTabContent()
    local tc = self.tabContent
    tc.summaryLabel:Hide()
    tc.summary:Hide()
    tc.descLabel:Hide()
    tc.description:Hide()
    tc.tags:Hide()
    tc.relLabel:Hide()
    tc.related:Hide()
    tc.srcLabel:Hide()
    tc.sources:Hide()

    local entry = self._currentEntry
    if not entry then return end

    if self.currentTab == "lore" then
        tc.summaryLabel:Show()
        tc.summary:Show()
        tc.summary:SetText(entry.summary or "")
        tc.descLabel:Show()
        tc.description:Show()
        tc.description:SetText(entry.description or entry.summary or "")

        if entry.tags and #entry.tags > 0 then
            tc.tags:Show()
            tc.tags:SetText("|cff88c0ff" .. CoA:L("ENTRY_TAGS") .. ":|r " .. table.concat(entry.tags, ", "))
        end
    elseif self.currentTab == "rel" then
        tc.relLabel:Show()
        tc.related:Show()
        if entry.related and #entry.related > 0 then
            tc.related:SetText(table.concat(entry.related, "\n"))
        else
            tc.related:SetText("|cff777777-|r")
        end
    elseif self.currentTab == "src" then
        tc.srcLabel:Show()
        tc.sources:Show()
        if entry.sources and #entry.sources > 0 then
            local lines = {}
            for _, src in ipairs(entry.sources) do
                table.insert(lines, "• " .. src)
            end
            tc.sources:SetText(table.concat(lines, "\n"))
        else
            tc.sources:SetText("|cff777777-|r")
        end
    end

    local maxY = self.content:GetHeight()
    if self.scroll then
        self.scroll:SetVerticalScroll(0)
    end
end

function EntryView:GetListButton(index)
    if self.listButtons[index] then return self.listButtons[index] end
    local btn = CreateFrame("Button", nil, self.content, "BackdropTemplate")
    btn:SetSize(510, 44)
    btn:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets   = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    btn:SetBackdropColor(0.1, 0.1, 0.2, 0.5)
    btn:SetBackdropBorderColor(0.3, 0.3, 0.4, 0.8)

    local title = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", btn, "TOPLEFT", 10, -6)
    btn.title = title

    local summary = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    summary:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -2)
    summary:SetTextColor(0.7, 0.7, 0.7)
    summary:SetWidth(490)
    summary:SetJustifyH("LEFT")
    summary:SetMaxLines(1)
    btn.summary = summary

    btn:SetScript("OnEnter", function()
        btn:SetBackdropColor(unpack(CoA.Colors.HIGHLIGHT))
        btn:SetBackdropBorderColor(0.6, 0.6, 0.8, 1)
    end)
    btn:SetScript("OnLeave", function()
        btn:SetBackdropColor(0.1, 0.1, 0.2, 0.5)
        btn:SetBackdropBorderColor(0.3, 0.3, 0.4, 0.8)
    end)

    self.listButtons[index] = btn
    return btn
end

function EntryView:ShowEntry(entry)
    if not entry or not self.frame then return end
    self:_HideAllButtons()

    self._currentEntry = entry
    self.modelView.frame:Show()

    if entry.displayId and entry.displayId > 0 then
        self.modelView:ShowModel(entry.displayId)
    else
        self.modelView:ShowItemIcon(entry.icon or "INV_Misc_Book_09")
    end

    self.fields.title:SetText(entry.name or "?")
    self.fields.subtitle:SetText(entry.title or "")

    local infoParts = {}
    if entry.faction then table.insert(infoParts, CoA:L("FACTION_LABEL") .. " " .. entry.faction) end
    if entry.race then table.insert(infoParts, CoA:L("RACE_LABEL") .. " " .. entry.race) end
    if entry.location then table.insert(infoParts, CoA:L("LOCATION_LABEL") .. " " .. entry.location) end
    self.fields.info:SetText(#infoParts > 0 and table.concat(infoParts, "  •  ") or "")

    self:SetTab("lore")
    self.frame:Show()
end

function EntryView:ShowList(entries, listTitle)
    if not self.frame then return end
    self.modelView.frame:Hide()
    self.modelView:Clear()
    self._currentEntry = nil

    self.fields.title:SetText(listTitle or "Resultados")
    self.fields.subtitle:SetText(string.format(CoA:L("ENTRIES_COUNT"), #(entries or {})))
    self.fields.info:SetText("")

    local tc = self.tabContent
    tc.summaryLabel:Hide()
    tc.summary:Hide()
    tc.descLabel:Hide()
    tc.description:Hide()
    tc.tags:Hide()
    tc.relLabel:Hide()
    tc.related:Hide()
    tc.srcLabel:Hide()
    tc.sources:Hide()

    local yOffset = -50
    for i, entry in ipairs(entries or {}) do
        local btn = self:GetListButton(i)
        btn:SetPoint("TOPLEFT", self.content, "TOPLEFT", 0, yOffset)
        btn.title:SetText(entry.name or "?")
        btn.summary:SetText(entry.summary or "")
        btn:SetScript("OnClick", function()
            self:ShowEntry(entry)
        end)
        btn:Show()
        yOffset = yOffset - 48
    end

    for i = #(entries or {}) + 1, #self.listButtons do
        self.listButtons[i]:Hide()
    end

    self.content:SetHeight(math.abs(yOffset) + 20)
    self.scroll:SetVerticalScroll(0)
end

function EntryView:ShowWelcome()
    if not self.frame then return end
    self:_HideAllButtons()
    self.modelView.frame:Hide()
    self.modelView:Clear()
    self._currentEntry = nil

    self.fields.title:SetText("")
    self.fields.subtitle:SetText("")
    self.fields.info:SetText("")

    local tc = self.tabContent
    tc.summaryLabel:Hide()
    tc.summary:Hide()
    tc.descLabel:Hide()
    tc.description:Hide()
    tc.tags:Hide()
    tc.relLabel:Hide()
    tc.related:Hide()
    tc.srcLabel:Hide()
    tc.sources:Hide()

    self.fields.title:SetText(CoA:L("WELCOME_MESSAGE"))
    self.fields.title:SetTextColor(0.8, 0.8, 0.8)
end

function EntryView:_CreateLabel(parent, anchor, text, extraY)
    local yOff = extraY or 0
    local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    if anchor then
        label:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, yOff)
    end
    label:SetText(text)
    label:SetTextColor(1, 0.85, 0.4)
    return label
end

function EntryView:_HideAllButtons()
    for _, btn in ipairs(self.listButtons) do
        btn:Hide()
    end
end

CoA.EntryView = EntryView
