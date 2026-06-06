-- ============================================================
-- Codex of Azeroth :: MinimapButton
-- ============================================================
-- Botón flotante en el minimapa que abre/cierra el Códice.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.MinimapBtn = {}
local MB = CoA.MinimapBtn

function MB:Initialize()
    if self.button then return end

    local btn = CreateFrame("Button", "CoA_MinimapButton", Minimap)
    btn:SetSize(32, 32)
    btn:SetFrameStrata("MEDIUM")
    btn:SetFrameLevel(8)

    -- Posición inicial: norte del minimapa
    local angle = math.rad(180)  -- 180 = oeste, 0 = este
    local radius = 80
    local x = math.cos(angle) * radius
    local y = math.sin(angle) * radius
    btn:SetPoint("CENTER", Minimap, "CENTER", x, y)

    -- Icono
    local icon = btn:CreateTexture(nil, "BACKGROUND")
    icon:SetSize(20, 20)
    icon:SetPoint("CENTER", btn, "CENTER", 0, 0)
    icon:SetTexture("Interface\\Icons\\INV_Misc_Book_09")
    btn.icon = icon

    -- Borde circular
    local border = btn:CreateTexture(nil, "OVERLAY")
    border:SetSize(52, 52)
    border:SetPoint("TOPLEFT", btn, "TOPLEFT", -10, 10)
    border:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
    btn.border = border

    -- Tooltip
    btn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_LEFT")
        GameTooltip:AddLine(CoA:L("ADDON_NAME"), 1, 0.85, 0.4)
        GameTooltip:AddLine("|cffaaaaaaClick para abrir/cerrar|r", 0.7, 0.7, 0.7)
        GameTooltip:Show()
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    -- Click
    btn:SetScript("OnClick", function(self, button)
        if CoA.MainFrame and CoA.MainFrame.Toggle then
            CoA.MainFrame:Toggle()
        end
    end)

    -- Dragging
    btn:SetMovable(true)
    btn:EnableMouse(true)
    btn:RegisterForDrag("LeftButton")
    btn:SetScript("OnDragStart", function(self)
        self:StartMoving()
    end)
    btn:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()

        -- Limitar al perímetro del minimapa
        local mx, my = Minimap:GetCenter()
        local bx, by = self:GetCenter()
        local angle = math.atan2(by - my, bx - mx)
        local radius = 80
        local x = math.cos(angle) * radius
        local y = math.sin(angle) * radius
        self:ClearAllPoints()
        self:SetPoint("CENTER", Minimap, "CENTER", x, y)
    end)

    -- Hover
    btn:SetScript("OnMouseDown", function(self) self.icon:SetPoint("CENTER", self, "CENTER", -1, -1) end)
    btn:SetScript("OnMouseUp", function(self) self.icon:SetPoint("CENTER", self, "CENTER", 0, 0) end)

    self.button = btn
    self:Show()
end

function MB:Show()
    if self.button then self.button:Show() end
end

function MB:Hide()
    if self.button then self.button:Hide() end
end
