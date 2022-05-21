-- https://github.com/tpope/vim-repeat
-- https://github.com/ur4ltz/surround.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "surround")
    if not ok then
        return
    end

    M.surround = m
    M.surround.setup({
        mappings_style = "surround",
        space_on_closing_char = true,
    })
end

function M.after() end

return M
