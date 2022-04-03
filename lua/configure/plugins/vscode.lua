-- https://github.com/Mofiqul/vscode.nvim

local options = require("core.options")
local utils = require("utils")

require("bufferline").setup(
    {
        options = {
            -- diagnostics source
            diagnostics = "nvim_lsp",
            -- built-in icons
            indicator_icon = " ",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            -- split style："slant" | "thick" | "thin"
            -- separator_style = "thin",
            -- show diagnostics icons
            ---@diagnostic disable-next-line: unused-local
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local c = ""
                if diagnostics_dict.error then
                    c = c .. diagnostics_dict.error
                elseif diagnostics_dict.warning then
                    c = c .. diagnostics_dict.warning
                elseif diagnostics_dict.info then
                    c = c .. diagnostics_dict.info
                elseif diagnostics_dict.hint then
                    c = c .. diagnostics_dict.hint
                end
                return c
            end,
            -- The left side yields the position of the NvimTree
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left"
                },
                {
                    filetype = "undotree",
                    text = "History Explorer",
                    text_align = "left"
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    text_align = "left"
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    text_align = "left"
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    text_align = "center"
                }
            }
        },
        highlights = {
            fill = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLineNC"}
            },
            background = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            buffer_visible = {
                gui = "",
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            buffer_selected = {
                gui = "",
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            separator = {
                guifg = {attribute = "bg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            separator_selected = {
                guifg = {attribute = "fg", highlight = "Special"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            separator_visible = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLineNC"}
            },
            close_button = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            close_button_selected = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            close_button_visible = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            --
            diagnostic = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            diagnostic_visible = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            diagnostic_selected = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            -- hint
            hint = {
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_diagnostic = {
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_selected = {
                gui = "NONE"
            },
            hint_diagnostic_selected = {
                gui = "NONE"
            },
            -- info
            info = {
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_diagnostic = {
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_selected = {
                gui = "NONE"
            },
            info_diagnostic_selected = {
                gui = "NONE"
            },
            -- warning
            warning = {
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_diagnostic = {
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_selected = {
                gui = "NONE"
            },
            warning_diagnostic_selected = {
                gui = "NONE"
            },
            -- error
            error = {
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_diagnostic = {
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_selected = {
                gui = "NONE"
            },
            error_diagnostic_selected = {
                gui = "NONE"
            }
        }
    }
)

-- For dark theme
vim.g.vscode_style = "dark"
-- For light theme
-- vim.g.vscode_style = "light"
-- transparent background
vim.g.vscode_transparent = options.transparency_background
-- Enable italic comment
vim.g.vscode_italic_comment = 0
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = false
vim.cmd([[colorscheme vscode]])

local colors = require("vscode.colors").generate()

if vim.g.vscode_style == "dark" then
    local rainbow_level_1 = "#FFD700"
    local rainbow_level_2 = "#DA70BF"
    local rainbow_level_3 = "#87CEFA"

    local select_blue = "#094771"
    local border_blue = "#0A7ACA"

    -- vim-illuminate
    utils.hi.set("illuminatedWord", {bg = colors.vscSplitThumb})

    -- spell
    utils.hi.set("SpellBad", {fg = colors.vscGreen})
    utils.hi.set("SpellCap", {fg = colors.vscGreen})
    utils.hi.set("SpellRare", {fg = colors.vscGreen})
    utils.hi.set("SpellLocal", {fg = colors.vscGreen})

    -- fidget
    utils.hi.set("FidgetTitle", {fg = colors.vscFront})
    utils.hi.set("FidgetTask", {fg = colors.vscFront})

    -- lsp_signature and translate
    utils.hi.set("NormalFloat", {bg = colors.vscBack})
    utils.hi.set("FloatBorder", {fg = border_blue, bg = colors.vscBack})

    -- lspsaga
    utils.hi.set("LspFloatWinNormal", {bg = colors.vscBack})
    utils.hi.set("LspSagaRenameBorder", {fg = border_blue})
    utils.hi.set("LspSagaHoverBorder", {fg = border_blue})
    utils.hi.set("LspSagaDocTruncateLine", {fg = border_blue})
    utils.hi.set("LspSagaDiagnosticBorder", {fg = border_blue})
    utils.hi.set("LspSagaDiagnosticTruncateLine", {fg = border_blue})

    -- telescope
    utils.hi.set("TelescopeBorder", {fg = border_blue})
    utils.hi.set("TelescopePreviewBorder", {fg = border_blue})
    utils.hi.set("TelescopePromptBorder", {fg = border_blue})
    utils.hi.set("TelescopeResultsBorder", {fg = border_blue})

    -- cmp match
    utils.hi.set("CmpItemAbbrMatch", {fg = colors.vscMediumBlue, bg = "NONE"})
    utils.hi.set("CmpItemAbbrMatchFuzzy", {fg = colors.vscMediumBlue, bg = "NONE"})
    -- cmp selection
    utils.hi.set("PmenuSel", {bg = select_blue, fg = colors.vscFront, gui = "NONE"})

    -- indent_blankline
    utils.hi.set("IndentBlanklineContextChar", {fg = colors.vscLightBlue})
    utils.hi.set("IndentBlanklineContextStart", {fg = "NONE", gui = "underline"})

    -- ts_rainbow.lua
    utils.hi.set("rainbowcol1", {fg = rainbow_level_1})
    utils.hi.set("rainbowcol2", {fg = rainbow_level_2})
    utils.hi.set("rainbowcol3", {fg = rainbow_level_3})
    utils.hi.set("rainbowcol4", {fg = rainbow_level_1})
    utils.hi.set("rainbowcol5", {fg = rainbow_level_2})
    utils.hi.set("rainbowcol6", {fg = rainbow_level_3})
    utils.hi.set("rainbowcol7", {fg = rainbow_level_1})

    -- notify
    utils.hi.set("NotifyERRORBorder", {fg = colors.vscRed})
    utils.hi.set("NotifyERRORIcon", {fg = colors.vscRed})
    utils.hi.set("NotifyERRORTitle", {fg = colors.vscRed, gui = "italic"})
    utils.hi.set("NotifyWARNBorder", {fg = colors.vscYellow})
    utils.hi.set("NotifyWARNIcon", {fg = colors.vscYellow})
    utils.hi.set("NotifyWARNTitle", {fg = colors.vscYellow, gui = "italic"})
    utils.hi.set("NotifyINFOBorder", {fg = colors.vscMediumBlue})
    utils.hi.set("NotifyINFOIcon", {fg = colors.vscMediumBlue})
    utils.hi.set("NotifyINFOTitle", {fg = colors.vscMediumBlue, gui = "italic"})

    -- hop
    utils.hi.set("HopNextKey", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,underline"})
    utils.hi.set("HopNextKey1", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold"})
    utils.hi.set("HopNextKey2", {fg = rainbow_level_1, bg = colors.vscBack, gui = "bold,italic"})

    -- scrollbar
    utils.hi.set("ScrollbarHandle", {bg = colors.vscSplitThumb})
end
