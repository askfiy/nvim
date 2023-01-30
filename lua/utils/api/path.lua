---@diagnostic disable: param-type-mismatch

local M = {}

function M.join(...)
    return table.concat(vim.tbl_flatten({ ... }), "/")
end

function M.exists(p)
    return vim.fn.filereadable(p) == 1
end

function M.listdir(p)
    return vim.fn.globpath(p, "*", false, true)
end

function M.listdir_by_filetype(p, filetype)
    return vim.fn.globpath(p, string.format("*.%s", filetype), false, true)
end

return M
