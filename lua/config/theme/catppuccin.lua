-- https://github.com/catppuccin/nvim

local options = require("core.options")

local M = {
    requires = {
        "catppuccin",
    },
}

function M.before() end

function M.load()
    M.catppuccin.setup({
        transparent_background = options.transparent,
        term_colors = false,
        styles = {
            comments = "NONE",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            -- Enable plugins
            cmp = true,
            treesitter = true,
            bufferline = true,
            gitsigns = true,
            which_key = true,
            hop = true,
            ts_rainbow = true,
            telescope = true,
            notify = true,
            -- Diable plugins
            lsp_trouble = false,
            lsp_saga = false,
            gitgutter = false,
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            markdown = false,
            lightspeed = false,
            telekasten = false,
            symbols_outline = false,
            -- Enable plugins
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "NONE",
                    hints = "NONE",
                    warnings = "NONE",
                    information = "NONE",
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline",
                },
            },
            nvimtree = {
                enabled = true,
                show_root = false,
                transparent_panel = options.transparent,
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            -- Disable plugins
            neotree = {
                enabled = false,
                show_root = false,
                transparent_panel = false,
            },
        },
    })

    vim.cmd([[colorscheme catppuccin]])
end

function M.after()
    require("config.theme.highlights.catppuccin").execute()
end

return M
