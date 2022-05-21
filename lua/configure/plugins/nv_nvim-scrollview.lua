-- https://github.com/dstein64/nvim-scrollview

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "scrollview")
    if not ok then
        return
    end

    M.scrollview = m
    M.scrollview.setup({
        -- Do not display scrollbars for the following file types
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
        -- Transparency
        winblend = 0,
        base = "right",
        -- offset
        column = 1,
        character = "",
    })
end

function M.after() end

return M
