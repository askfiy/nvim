local path = {}

path.join = function(...)
    -- Join paths together.
    -- Example:
    --   utils.path.join("/foo", "bar")
    --   => "/foo/bar"
    return table.concat(vim.tbl_flatten { ... }, '/')
end

path.is_exists = function(p)
    -- Check if a path exists.
    -- Example:
    --     utils.path.is_exists("/foo/bar")
    --     => true
    return vim.fn.filereadable(p) == 1
end

return path
