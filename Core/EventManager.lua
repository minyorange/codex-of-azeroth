CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local EventManager = CoA.Class:extend()

function EventManager:constructor()
    self.handlers = {}
    self.frame = CreateFrame("Frame", "CoA_EventFrame")
    self.frame:SetScript("OnEvent", function(_, event, ...)
        self:_dispatch(event, ...)
    end)
end

function EventManager:On(event, handler)
    if not self.handlers[event] then
        self.handlers[event] = {}
        self.frame:RegisterEvent(event)
    end
    table.insert(self.handlers[event], handler)
end

function EventManager:Off(event, handler)
    if not self.handlers[event] then return end
    for i, h in ipairs(self.handlers[event]) do
        if h == handler then
            table.remove(self.handlers[event], i)
            break
        end
    end
    if #self.handlers[event] == 0 then
        self.handlers[event] = nil
        self.frame:UnregisterEvent(event)
    end
end

function EventManager:_dispatch(event, ...)
    local handlers = self.handlers[event]
    if not handlers then return end
    for _, handler in ipairs(handlers) do
        local ok, err = pcall(handler, event, ...)
        if not ok then
            CoA:Print(CoA.ColorWrap(CoA.Colors.RED,
                "Error en evento " .. event .. ": " .. tostring(err)))
        end
    end
end

CoA.Events = EventManager:new()
