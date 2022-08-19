-- https://github.com/dstein64/nvim-scrollview

local M = {
    requires = {
        "scrollview",
    },
}

function M.before() end

function M.load()
    M.scrollview.setup({
        excluded_filetypes = {
            "NvimTree",
            "aerial",
            "undotree",
            "spectre_panel",
            "dbui",
            "lsp-installer",
        },
        -- only show in current window
        current_only = true,
        -- transparency
        winblend = 0,
        -- offset
        base = "right",
        column = 1,
        character = "",
    })
end

function M.after() end

return M
