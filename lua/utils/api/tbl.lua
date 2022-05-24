local tbl = {}

--  Fuzzy find if a list contains a value
--  Example:
--      utils.tbl.list_blurry_contains({'abc', 'def', 'ghi'}, 'de')
--      => true
function tbl.list_blurry_contains(t, v)
    for _, value in ipairs(t) do
        if value:find(v) then
            return true
        end
    end
    return false
end

return tbl
