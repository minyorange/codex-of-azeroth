-- ============================================================
-- Codex of Azeroth :: CodeEntry UI
-- ============================================================
-- Vista de una entrada individual del Códice.
-- ============================================================

CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

CoA.CodeEntry = {}
local CodeEntry = CoA.CodeEntry

-- Crear el frame
function CodeEntry:Create(parent)
    if self.frame then return self.frame end

    local frame = CreateFrame("Frame", "CoA_CodeEntry", parent, "BackdropTemplate")
    frame:SetSize(550, 500)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 210, 0)

    frame:SetBackdrop({
        bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 16,
        insets   = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    frame:SetBackdropColor(0.05, 0.05, 0.1, 0.9)
    frame:SetBackdropBorderColor(0.3, 0.3, 0.4, 1)

    -- ScrollFrame
    local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
    scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 10)

    local content = CreateFrame("Frame", nil, scroll)
    content:SetSize(500, 1)
    scroll:SetScrollChild(content)

    -- Título
    local title = content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", content, "TOPLEFT", 10, 0)
    title:SetWidth(480)
    title:SetJustifyH("LEFT")
    self.title = title

    -- Subtítulo (título del personaje)
    local subtitle = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
    subtitle:SetTextColor(0.7, 0.7, 0.7)
    self.subtitle = subtitle

    -- Resumen
    local summaryLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    summaryLabel:SetPoint("TOPLEFT", subtitle, "BOTTOMLEFT", 0, -10)
    summaryLabel:SetText(CoA:L("ENTRY_SUMMARY"))
    summaryLabel:SetTextColor(1, 0.85, 0.4)

    local summary = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    summary:SetPoint("TOPLEFT", summaryLabel, "BOTTOMLEFT", 0, -2)
    summary:SetWidth(480)
    summary:SetJustifyH("LEFT")
    summary:SetTextColor(0.9, 0.9, 0.9)
    self.summary = summary

    -- Descripción
    local descLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    descLabel:SetPoint("TOPLEFT", summary, "BOTTOMLEFT", 0, -10)
    descLabel:SetText(CoA:L("ENTRY_DESCRIPTION"))
    descLabel:SetTextColor(1, 0.85, 0.4)

    local desc = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    desc:SetPoint("TOPLEFT", descLabel, "BOTTOMLEFT", 0, -2)
    desc:SetWidth(480)
    desc:SetJustifyH("LEFT")
    desc:SetTextColor(0.9, 0.9, 0.9)
    desc:SetSpacing(2)
    self.description = desc

    -- Faction/Race/Location (en una sola línea)
    local info = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    info:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -10)
    info:SetWidth(480)
    info:SetJustifyH("LEFT")
    info:SetTextColor(0.7, 0.7, 0.7)
    self.info = info

    -- Tags
    local tagsLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    tagsLabel:SetPoint("TOPLEFT", info, "BOTTOMLEFT", 0, -10)
    tagsLabel:SetText(CoA:L("ENTRY_TAGS"))
    tagsLabel:SetTextColor(1, 0.85, 0.4)

    local tags = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    tags:SetPoint("TOPLEFT", tagsLabel, "BOTTOMLEFT", 0, -2)
    tags:SetWidth(480)
    tags:SetJustifyH("LEFT")
    tags:SetTextColor(0.7, 0.8, 1)
    self.tags = tags

    -- Expansiones
    local expLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    expLabel:SetPoint("TOPLEFT", tags, "BOTTOMLEFT", 0, -10)
    expLabel:SetText(CoA:L("ENTRY_EXPANSIONS"))
    expLabel:SetTextColor(1, 0.85, 0.4)

    local exp = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    exp:SetPoint("TOPLEFT", expLabel, "BOTTOMLEFT", 0, -2)
    exp:SetWidth(480)
    exp:SetJustifyH("LEFT")
    exp:SetTextColor(0.8, 1, 0.8)
    self.expansions = exp

    -- Relacionados
    local relLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    relLabel:SetPoint("TOPLEFT", exp, "BOTTOMLEFT", 0, -10)
    relLabel:SetText(CoA:L("ENTRY_RELATED"))
    relLabel:SetTextColor(1, 0.85, 0.4)

    local rel = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    rel:SetPoint("TOPLEFT", relLabel, "BOTTOMLEFT", 0, -2)
    rel:SetWidth(480)
    rel:SetJustifyH("LEFT")
    rel:SetTextColor(0.9, 0.9, 0.9)
    self.related = rel

    -- Fuentes
    local srcLabel = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    srcLabel:SetPoint("TOPLEFT", rel, "BOTTOMLEFT", 0, -10)
    srcLabel:SetText(CoA:L("ENTRY_SOURCES"))
    srcLabel:SetTextColor(1, 0.85, 0.4)

    local src = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    src:SetPoint("TOPLEFT", srcLabel, "BOTTOMLEFT", 0, -2)
    src:SetWidth(480)
    src:SetJustifyH("LEFT")
    src:SetTextColor(0.7, 0.7, 0.7)
    self.sources = src

    -- Mensaje de bienvenida por defecto
    self.welcomeMsg = content:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    self.welcomeMsg:SetPoint("CENTER", content, "CENTER", 0, 0)
    self.welcomeMsg:SetText(CoA:L("WELCOME_MESSAGE"))
    self.welcomeMsg:SetTextColor(0.8, 0.8, 0.8)

    self.frame = frame
    self.content = content
    self.scroll = scroll
    return frame
end

-- Mostrar una entrada
function CodeEntry:ShowEntry(entry)
    if not entry or not self.frame then return end

    -- Ocultar mensaje de bienvenida
    if self.welcomeMsg then self.welcomeMsg:Hide() end

    -- Llenar campos
    self.title:SetText(entry.name or "?")
    self.subtitle:SetText(entry.title or "")

    self.summary:SetText(entry.summary or "")
    self.description:SetText(entry.description or entry.summary or "")

    local infoParts = {}
    if entry.faction then table.insert(infoParts, "|cffaaaaaaFacción:|r " .. entry.faction) end
    if entry.race then table.insert(infoParts, "|cffaaaaaaRaza:|r " .. entry.race) end
    if entry.location then table.insert(infoParts, "|cffaaaaaaUbicación:|r " .. entry.location) end
    self.info:SetText(table.concat(infoParts, "  •  "))

    if entry.tags and #entry.tags > 0 then
        self.tags:SetText(table.concat(entry.tags, ", "))
    else
        self.tags:SetText("-")
    end

    if entry.expansions and #entry.expansions > 0 then
        self.expansions:SetText(table.concat(entry.expansions, " → "))
    else
        self.expansions:SetText("-")
    end

    if entry.related and #entry.related > 0 then
        self.related:SetText(table.concat(entry.related, ", "))
    else
        self.related:SetText("-")
    end

    if entry.sources and #entry.sources > 0 then
        local sourcesText = ""
        for i, src in ipairs(entry.sources) do
            sourcesText = sourcesText .. "• " .. src
            if i < #entry.sources then sourcesText = sourcesText .. "\n" end
        end
        self.sources:SetText(sourcesText)
    else
        self.sources:SetText("-")
    end

    -- Reset scroll
    if self.scroll then
        self.scroll:SetVerticalScroll(0)
    end

    self.currentEntry = entry
    self.frame:Show()
end

-- Mostrar mensaje de bienvenida
function CodeEntry:ShowWelcome()
    if not self.frame then return end
    if self.welcomeMsg then
        self.welcomeMsg:Show()
    end
    self.title:SetText("")
    self.subtitle:SetText("")
    self.summary:SetText("")
    self.description:SetText("")
    self.info:SetText("")
    self.tags:SetText("")
    self.expansions:SetText("")
    self.related:SetText("")
    self.sources:SetText("")
end

-- Mostrar lista de entradas (modo búsqueda/listado)
function CodeEntry:ShowList(entries, listTitle)
    if not self.frame then return end
    if self.welcomeMsg then self.welcomeMsg:Hide() end

    self.title:SetText(listTitle or "Resultados")
    self.subtitle:SetText(string.format("%d entradas", #(entries or {})))

    self.summary:SetText("")
    self.description:SetText("")

    local lines = {}
    for _, e in ipairs(entries or {}) do
        table.insert(lines, "• |cffffffff" .. (e.name or "?") .. "|r")
        if e.summary then
            table.insert(lines, "    " .. e.summary)
        end
        table.insert(lines, " ")
    end
    self.info:SetText(table.concat(lines, "\n"))
    self.tags:SetText("")
    self.expansions:SetText("")
    self.related:SetText("")
    self.sources:SetText("")

    if self.scroll then
        self.scroll:SetVerticalScroll(0)
    end
end
