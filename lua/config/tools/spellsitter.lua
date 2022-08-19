-- https://github.com/lewis6991/spellsitter.nvim

local M = {
    requires = {
        "spellsitter",
    },
}

function M.before() end

function M.load()
    M.spellsitter.setup()
end

function M.after() end

return M
