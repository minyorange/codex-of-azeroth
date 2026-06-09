CodexOfAzeroth = CodexOfAzeroth or {}
local CoA = CodexOfAzeroth

local Class = {}
Class.__index = Class

function Class:new(...)
    local obj = setmetatable({}, self)
    if obj:constructor then
        obj:constructor(...)
    end
    return obj
end

function Class:extend()
    local subclass = Class:new()
    subclass.__index = subclass
    setmetatable(subclass, { __index = self })
    return subclass
end

CoA.Class = Class
