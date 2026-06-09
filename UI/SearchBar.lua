CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local SearchBar = CoA.Class:extend()

function SearchBar:constructor(parent, onSearchCallback)
    self.frame = nil
    self.editBox = nil
    self.onSearch = onSearchCallback
    self.parent = parent
end

function SearchBar:Create()
    if self.frame then return self.frame end

    local frame = CreateFrame("Frame", nil, self.parent, "BackdropTemplate")
    frame:SetSize(550, 30)
    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets   = { left = 2, right = 2, top = 2, bottom = 2 },
    })
    frame:SetBackdropColor(0, 0, 0, 0.5)

    local editBox = CreateFrame("EditBox", nil, frame)
    editBox:SetSize(520, 24)
    editBox:SetPoint("CENTER", frame, "CENTER", 0, 0)
    editBox:SetAutoFocus(false)
    editBox:SetFontObject("GameFontHighlight")
    editBox:SetTextColor(1, 1, 1)

    local placeholder = CoA:L("SEARCH_PLACEHOLDER")
    editBox:SetText(placeholder)
    editBox.hasPlaceholder = true

    editBox:SetScript("OnEditFocusGained", function(self)
        if self.hasPlaceholder then
            self:SetText("")
            self:SetTextColor(1, 1, 1)
            self.hasPlaceholder = false
        end
    end)

    editBox:SetScript("OnEditFocusLost", function(self)
        if self:GetText() == "" then
            self:SetText(placeholder)
            self:SetTextColor(0.6, 0.6, 0.6)
            self.hasPlaceholder = true
        end
    end)

    editBox:SetScript("OnEnterPressed", function(self)
        local query = self:GetText()
        if query and query ~= "" and not self.hasPlaceholder then
            if self._onSearch then
                self._onSearch(query)
            end
        end
    end)

    if self.onSearch then
        editBox._onSearch = self.onSearch
    end

    self.frame = frame
    self.editBox = editBox
    return frame
end

function SearchBar:SetOnSearch(callback)
    self.onSearch = callback
    if self.editBox then
        self.editBox._onSearch = callback
    end
end

function SearchBar:GetText()
    if not self.editBox then return "" end
    if self.editBox.hasPlaceholder then return "" end
    return self.editBox:GetText()
end

function SearchBar:Clear()
    if not self.editBox then return end
    self.editBox:SetText("")
    self.editBox.hasPlaceholder = false
end

function SearchBar:Focus()
    if self.editBox then
        self.editBox:SetFocus()
    end
end

function SearchBar:SetPoint(...)
    if self.frame then
        self.frame:SetPoint(...)
    end
end
