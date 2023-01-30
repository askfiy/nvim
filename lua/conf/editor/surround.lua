-- https://github.com/tpope/vim-repeat
-- https://github.com/ur4ltz/surround.nvim

local M = {
    requires = {
        "surround",
    },
}

function M.before() end

function M.load()
    M.surround.setup({
        mappings_style = "surround",
        space_on_closing_char = true,
    })
end

function M.after() end

return M
