CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local MinimapButton = CoA.Class:extend()

function MinimapButton:constructor()
    self.frame = nil
end

function MinimapButton:Initialize()
    if self.frame then return end

    local btn = CreateFrame("Button", "CoA_MinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(8)

    local radius = Minimap:GetWidth() and Minimap:GetWidth() * 0.6 or 80
    local angle = math.rad(180)
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    btn:SetPoint("CENTER", Minimap, "CENTER", x, y)

    local icon = btn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    btn.icon = icon

    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetSize(52, 52)
    border:SetPoint("TOPLEFT", btn, "TOPLEFT", -10, 10)
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    btn.border = border

    btn:SetScript("OnEnter", function()
        GameTooltip:SetOwner(btn, "ANCHOR_LEFT")
        GameTooltip:AddLine(CoA:L("ADDON_NAME"), 1, 0.85, 0.4)
        GameTooltip:AddLine(CoA:L("TOOLTIP_HAS_ENTRY"), 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    btn:SetScript("OnClick", function()
        if CoA.MainFrame and CoA.MainFrame.Toggle then
            CoA.MainFrame:Toggle()
        end
    end)

    btn:SetMovable(true)
    btn:EnableMouse(true)
    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function() btn:StartMoving() end)
    btn:SetScript("OnDragStop", function()
        btn:StopMovingOrSizing()
        self:_SnapToMinimap(btn)
    end)

    btn:SetScript("OnMouseDown", function()
        btn.icon:SetPoint("CENTER", btn, "CENTER", -1, -1)
    end)
    btn:SetScript("OnMouseUp", function()
        btn.icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
    end)

    self.frame = btn
    btn:Show()
end

function MinimapButton:_SnapToMinimap(btn)
    local mx, my = Minimap:GetCenter()
    local bx, by = btn:GetCenter()
    local angle = math.atan2(by - my, bx - mx)
    local radius = Minimap:GetWidth() and Minimap:GetWidth() * 0.6 or 80
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    btn:ClearAllPoints()
    btn:SetPoint("CENTER", Minimap, "CENTER", x, y)
end

function MinimapButton:Show()
    if self.frame then self.frame:Show() end
end

function MinimapButton:Hide()
    if self.frame then self.frame:Hide() end
end

CoA.MinimapBtn = MinimapButton:new()
