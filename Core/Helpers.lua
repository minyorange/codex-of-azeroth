CodexOfAzeroth = CodexOfAzeroth or {}

if not string.trim then
    function string.trim(str)
        if not str then return "" end
        return tostring(str):match("^%s*(.-)%s*$")
    end
end

if not string.starts then
    function string.starts(str, prefix)
        return str:sub(1, #prefix) == prefix
    end
end

if not string.ends then
    function string.ends(str, suffix)
        return suffix == "" or str:sub(-#suffix) == suffix
    end
end
