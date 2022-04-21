-- https://github.com/catppuccin/nvim

local options = require("core.options")
local api = require("utils.api")

local catppuccin = require("catppuccin")
local colors = require("catppuccin.api.colors").get_colors()

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
                    errors = "NONE",
                    hints = "NONE",
                    warnings = "NONE",
                    information = "NONE"
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

vim.cmd([[colorscheme catppuccin]])

-- lsp_signature and translate
if options.transparency_background then
    api.hi.set("NormalFloat", {bg = "NONE"})
    -- hop background
    api.hi.set("HopNextKey", {bg = "NONE"})
    api.hi.set("HopNextKey1", {bg = "NONE"})
    api.hi.set("HopNextKey2", {bg = "NONE"})
    api.hi.set("HopUnmatched", {bg = "NONE"})
else
    api.hi.set("NormalFloat", {bg = colors.black2})
    api.hi.set("FloatBorder", {bg = colors.black2})
end

--  bufferline
api.hi.set("BufferDirectory", {fg = colors.blue, gui = "bold"})
api.hi.set("BufferIndicator", {fg = colors.black4})

-- scrollbar
api.hi.set("ScrollbarHandle", {bg = colors.black4})

-- vim visual multi
api.hi.set("VM_mode1", {fg = colors.black2, bg = colors.mauve})
api.hi.set("VM_mode2", {fg = colors.black2, bg = colors.blue})

-- fidget
api.hi.set("FidgetTitle", {fg = colors.blue, gui = "bold"})
api.hi.set("FidgetTask", {fg = colors.blue})

-- lspsaga
api.hi.set("LspFloatWinNormal", {bg = colors.black2})
api.hi.set("LspSagaRenameBorder", {fg = colors.blue})
api.hi.set("LspSagaHoverBorder", {fg = colors.blue})
api.hi.set("LspSagaDocTruncateLine", {fg = colors.blue})
api.hi.set("LspSagaDiagnosticBorder", {fg = colors.blue})
api.hi.set("LspSagaDiagnosticTruncateLine", {fg = colors.blue})

-- telescope
api.hi.set("TelescopeBorder", {fg = colors.blue})
api.hi.set("TelescopeMatching", {fg = colors.blue, gui = "bold"})

-- cmp selection
api.hi.set("PmenuSel", {bg = colors.green, fg = colors.black0, gui = "NONE"})

-- cmp match
api.hi.set("CmpItemAbbrMatch", {fg = colors.blue, bg = "NONE"})
api.hi.set("CmpItemAbbrMatchFuzzy", {bg = "NONE", fg = colors.blue})

-- indent_blankline
api.hi.set("IndentBlanklineContextChar", {fg = colors.blue})
api.hi.set("IndentBlanklineChar", {fg = colors.black4})
