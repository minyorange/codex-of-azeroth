CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local ModelView = CoA.Class:extend()

function ModelView:constructor(parent)
    self.parent = parent
    self.frame = nil
    self.model = nil
    self._isDragging = false
    self._prevX = 0
end

function ModelView:Create()
    if self.frame then return self.frame end

    local frame = CreateFrame("Frame", nil, self.parent, "BackdropTemplate")
    frame:SetSize(560, 240)
    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets   = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(0, 0, 0, 0.85)
    frame:SetBackdropBorderColor(0.4, 0.35, 0.2, 1)

    local model = CreateFrame("PlayerModel", nil, frame)
    model:SetAllPoints(frame)
    model:SetPortraitZoom(1.2)
    model:SetPosition(0, 0, 0)
    model:SetRotation(0)
    model:SetAlpha(1)

    model:SetScript("OnMouseDown", function(_, button)
        if button == "LeftButton" then
            self._isDragging = true
            self._prevX = GetCursorPosition()
        end
    end)

    model:SetScript("OnMouseUp", function()
        self._isDragging = false
    end)

    model:SetScript("OnUpdate", function()
        if self._isDragging then
            local x = GetCursorPosition()
            local dx = (x - self._prevX) * 0.01
            model:SetRotation(model:GetRotation() + dx)
            self._prevX = x
        end
    end)

    frame.model = model
    self.frame = frame
    self.model = model
    return frame
end

function ModelView:ShowModel(displayId)
    if not self.model then return end
    if displayId and displayId > 0 then
        self.model:SetDisplayInfo(displayId)
        self.model:SetPortraitZoom(1.0)
        self.model:SetRotation(0)
        self.model:Show()
    end
end

function ModelView:ShowItemIcon(iconPath)
    if not self.model then return end
    self.model:Hide()
    if self._iconTexture then
        self._iconTexture:Hide()
    end
    if iconPath then
        if not self._iconTexture then
            self._iconTexture = self.frame:CreateTexture(nil, "ARTWORK")
            self._iconTexture:SetSize(80, 80)
            self._iconTexture:SetPoint("CENTER")
        end
        self._iconTexture:SetTexture(iconPath)
        self._iconTexture:Show()
    end
end

function ModelView:Clear()
    if self.model then
        self.model:Hide()
        self.model:ClearModel()
    end
    if self._iconTexture then
        self._iconTexture:Hide()
    end
end

CoA.ModelView = ModelView
