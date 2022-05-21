local str = {}

str.title = function(s)
    --  Capitalize the first letter of a string.
    --  Example:
    --      utils.string.title("foo")
    --      => "Foo"
    return (s:gsub("(%a)([%w_']*)", function(f, r)
        return f:upper() .. r:lower()
    end))
end

return str
