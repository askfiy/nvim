-- https://github.com/akinsho/bufferline.nvim

require("bufferline").setup(
    {
        options = {
            -- diagnostics source
            diagnostics = "nvim_lsp",
            -- built-in icons
            -- indicator_icon = " ",
            indicator_icon = "▎",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            -- split style："slant" | "thick" | "thin"
            separator_style = "thin",
            -- show diagnostics icons
            ---@diagnostic disable-next-line: unused-local
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local c = ""
                if diagnostics_dict.error then
                    c = c .. " " .. diagnostics_dict.error
                elseif diagnostics_dict.warning then
                    c = c .. " " .. diagnostics_dict.warning
                elseif diagnostics_dict.info then
                    c = c .. " " .. diagnostics_dict.info
                elseif diagnostics_dict.hint then
                    c = c .. " " .. diagnostics_dict.hint
                end
                return c
            end,
            -- The left side yields the position of the NvimTree
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                },
                {
                    filetype = "undotree",
                    text = "History Explorer",
                    highlight = "Directory",
                    text_align = "left"
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    highlight = "Directory",
                    text_align = "left"
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "Directory",
                    text_align = "left"
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "Directory",
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
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            buffer_selected = {
                gui = "NONE",
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
            -- indicator
            indicator_selected = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- modify
            modified = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            modified_visible = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            modified_selected = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- diagnotics
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
                -- guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_diagnostic = {
                -- guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guifg = {attribute = "fg", highlight = "Normal"},
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
                -- guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_diagnostic = {
                -- guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guifg = {attribute = "fg", highlight = "Normal"},
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
                -- guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_diagnostic = {
                -- guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guifg = {attribute = "fg", highlight = "Normal"},
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
                -- guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_diagnostic = {
                -- guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guifg = {attribute = "fg", highlight = "Normal"},
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
