local str = {}

--  Capitalize the first letter of a string.
--  Example:
--      utils.string.title("foo")
--      => "Foo"
str.title = function(s)
    return (s:gsub("(%a)([%w_']*)", function(f, r)
        return f:upper() .. r:lower()
    end))
end

return str
