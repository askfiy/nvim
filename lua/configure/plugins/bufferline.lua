-- https://github.com/akinsho/bufferline.nvim

local icons = require("utils.icons")

-- file types not shown in bufferline
local filter_bufname = {
    "translate",
    "repl",
    "query",
    "dev",
    "dbout"
}

require("bufferline").setup(
    {
        options = {
            -- diagnostics source
            diagnostics = "nvim_lsp",
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
                    c = c .. icons.diagnostics.error .. diagnostics_dict.error
                elseif diagnostics_dict.warning then
                    c = c .. icons.diagnostics.warning .. diagnostics_dict.warning
                elseif diagnostics_dict.info then
                    c = c .. icons.diagnostics.info .. diagnostics_dict.info
                elseif diagnostics_dict.hint then
                    c = c .. icons.diagnostics.hint .. diagnostics_dict.hint
                end
                return c
            end,
            custom_filter = function(buf_number, _)
                local buf_name = vim.fn.bufname(buf_number)
                for _, name in ipairs(filter_bufname) do
                    if buf_name:find(name) then
                        return false
                    end
                end
                return true
            end,
            -- The left side yields the position of the NvimTree
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "undotree",
                    text = "History Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "BufferDirectory",
                    text_align = "left"
                },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "BufferDirectory",
                    text_align = "center"
                }
            }
        },
        highlights = {
            -- xxx_        : The focus is not on the buffer, and the buffer is not selected
            -- xxx_visible : The focus is not on the buffer, but the buffer is selected
            -- xxx_selected: The buffer is selected, and the focus is on the buffer
            fill = {
                guifg = {attribute = "fg", highlight = "Normal"},
                guibg = {attribute = "bg", highlight = "StatusLineNC"}
            },
            background = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
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
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
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
            -- split small vertical line on the left
            indicator_selected = {
                guifg = {attribute = "fg", highlight = "BufferIndicator"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- How to distinguish styles after opening a file with the same name
            duplicate = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            },
            duplicate_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            duplicate_visible = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- the small dot when it is not saved
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
                -- If you want to keep the diagnostic color when switching other windows, use the following comment configuration
                -- guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            hint_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            hint_diagnostic = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            hint_diagnostic_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            hint_diagnostic_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticHint"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- info
            info = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            info_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            info_diagnostic = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            info_diagnostic_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            info_diagnostic_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticInfo"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- warning
            warning = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            warning_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            warning_diagnostic = {
                -- guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            warning_diagnostic_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            warning_diagnostic_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticWarn"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- error
            error = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            error_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            error_diagnostic = {
                guifg = {attribute = "fg", highlight = "StatusLineNC"},
                guibg = {attribute = "bg", highlight = "StatusLine"},
                guisp = {attribute = "bg", highlight = "StatusLine"}
            },
            error_diagnostic_selected = {
                gui = "NONE",
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            error_diagnostic_visible = {
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "Normal"}
            },
            -- character number to go to buffer
            pick = {
                guifg = {attribute = "fg", highlight = "DiagnosticError"},
                guibg = {attribute = "bg", highlight = "StatusLine"}
            }
        }
    }
)
