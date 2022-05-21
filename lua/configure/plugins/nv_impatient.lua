-- https://github.com/lewis6991/impatient.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "impatient")
    if not ok then
        return
    end

    M.impatient = m
end

function M.after() end

return M
