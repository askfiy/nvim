-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {}

function M.before()
    -- Disable indent in file type
    vim.g.indent_blankline_filetype_exclude = {
        "NvimTree",
        "aerial",
        "undotree",
        "spectre_panel",
        "dbui",
        "toggleterm",
        "notify",
        "packer",
        "lsp-installer",
        "help",
        "terminal",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "",
    }
end

function M.load()
    local ok, m = pcall(require, "indent_blankline")
    if not ok then
        return
    end

    M.indent_blankline = m
    M.indent_blankline.setup({
        -- Show the start of the current region
        show_current_context_start = false,
        -- Show current area
        show_current_context = true,
        -- Show the ending symbol
        show_end_of_line = true,
    })
end

function M.after() end

return M
