-- https://github.com/catppuccin/nvim

local options = require("core.options")
local utils = require("utils")

local catppuccin = require("catppuccin")

catppuccin.setup(
    {
        transparent_background = options.transparency_background,
        term_colors = false,
        styles = {
            comments = "italic",
            functions = "italic",
            keywords = "italic",
            strings = "NONE",
            variables = "italic"
        },
        integrations = {
            cmp = true,
            lsp_saga = true,
            telescope = true,
            treesitter = true,
            gitsigns = true,
            which_key = true,
            bufferline = true,
            ts_rainbow = true,
            markdown = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "italic",
                    hints = "italic",
                    warnings = "italic",
                    information = "italic"
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline"
                }
            },
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false
            },
            nvimtree = {
                enabled = true,
                show_root = false,
                transparent_panel = options.transparency_background
            },
            lsp_trouble = false,
            gitgutter = false,
            neotree = {
                enabled = false,
                show_root = false,
                transparent_panel = false
            },
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            lightspeed = false,
            hop = true,
            notify = true,
            telekasten = false,
            symbols_outline = false
        }
    }
)

catppuccin.after_loading = function()
    local colors = require("catppuccin.api.colors").get_colors()
    -- lsp_signature and translate
    if options.transparency_background then
        utils.hi.set("NormalFloat", {bg = "NONE"})
    else
        utils.hi.set("NormalFloat", {bg = colors.black2})
        utils.hi.set("FloatBorder", {bg = colors.black2})
    end

    -- fidget
    utils.hi.set("FidgetTitle", {fg = colors.blue, gui = "bold"})
    utils.hi.set("FidgetTask", {fg = colors.blue})
    --  bufferline
    utils.hi.set("Directory", {fg = colors.blue, gui = "bold"})
    -- lspsaga
    utils.hi.set("LspSagaRenameBorder", {fg = colors.blue})
    utils.hi.set("LspSagaHoverBorder", {fg = colors.blue})
    utils.hi.set("LspSagaDocTruncateLine", {fg = colors.blue})
    utils.hi.set("LspSagaDiagnosticBorder", {fg = colors.blue})
    utils.hi.set("LspSagaDiagnosticTruncateLine", {fg = colors.blue})
    -- telescope
    utils.hi.set("TelescopeBorder", {fg = colors.blue})
    -- utils.hi.set("TelescopeSelection", {bg = colors.green, fg = colors.black0, gui = "NONE"})
    utils.hi.set("TelescopeMatching", {fg = colors.blue, gui = "bold"})
    -- cmp match
    utils.hi.set("CmpItemAbbrMatch", {fg = colors.blue, bg = "NONE"})
    utils.hi.set("CmpItemAbbrMatchFuzzy", {bg = "NONE", fg = colors.blue})
    -- cmp selection
    utils.hi.set("PmenuSel", {bg = colors.green, fg = colors.black0, gui = "NONE"})
    -- indent_blankline
    utils.hi.set("IndentBlanklineContextChar", {fg = colors.blue})
    utils.hi.set("IndentBlanklineChar", {fg = colors.black4})
end

vim.cmd([[colorscheme catppuccin]])
