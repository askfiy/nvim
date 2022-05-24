local path = {}

--[[
Join paths together.
Example:
  utils.path.join("/foo", "bar")
  => "/foo/bar"
]]
path.join = function(...)
    return table.concat(vim.tbl_flatten({ ... }), "/")
end

--[[
Check if a path exists.
Example:
    utils.path.is_exists("/foo/bar")
    => true
]]
path.is_exists = function(p)
    return vim.fn.filereadable(p) == 1
end

return path
