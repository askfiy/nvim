-- https://github.com/lewis6991/spellsitter.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "spellsitter")
    if not ok then
        return
    end

    M.spellsitter = m
    M.spellsitter.setup()
end

function M.after() end

return M
