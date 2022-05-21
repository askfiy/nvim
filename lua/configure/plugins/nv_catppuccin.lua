-- https://github.com/catppuccin/nvim

local options = require("core.options")

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "catppuccin")
    if not ok then
        return
    end

    M.catppuccin = m
    M.catppuccin.setup({
        -- Whether the background is transparent
        transparent_background = options.transparent_background,
        -- Whether to follow terminal color
        term_colors = false,
        -- Set the style of treesitter
        styles = {
            comments = "NONE",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
        },
        -- Integration with other plugins
        integrations = {
            -- Enable plugins
            cmp = true,
            treesitter = true,
            bufferline = true,
            gitsigns = true,
            telescope = true,
            which_key = true,
            notify = true,
            hop = true,
            ts_rainbow = true,
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
                transparent_panel = options.transparent_background,
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
end

function M.after()
    vim.cmd([[colorscheme catppuccin]])
    -- Apply custom theme highlighting
    require("configure.theme.catppuccin.highlights").execute()
end

return M
