-- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {
    requires = {
        "indent_blankline",
    },
}

function M.before()
    vim.g.indent_blankline_filetype_exclude = {
        "NvimTree",
        "aerial",
        "undotree",
        "spectre_panel",
        "dbui",
        "toggleterm",
        "notify",
        "startuptime",
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
    M.indent_blankline.setup({
        show_current_context_start = false,
        show_current_context = true,
        show_end_of_line = true,
    })
end

function M.after() end

return M
