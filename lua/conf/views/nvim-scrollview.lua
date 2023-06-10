-- https://github.com/dstein64/nvim-scrollview

local M = {
    requires = {
        "scrollview",
    },
}

function M.before() end

function M.load()
    M.scrollview.setup({
        -- only show in current window
        current_only = true,
        -- transparency
        winblend = 0,
        -- offset
        base = "right",
        column = 1,
        character = "",
        excluded_filetypes = {
            "NvimTree",
            "aerial",
            "undotree",
            "dbui",
            "spectre_panel",
        },
        -- disable all sign icon
        signs_on_startup = {},
    })
end

function M.after() end

return M
