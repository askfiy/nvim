local path = {}

-- return the concatenated path
function path.join(...)
    return table.concat(vim.tbl_flatten({ ... }), "/")
end

-- return whether the path exists
function path.exists(p)
    return vim.fn.filereadable(p) == 1
end

return path
