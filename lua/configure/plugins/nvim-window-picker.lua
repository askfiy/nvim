-- https://github.com/s1n7ax/nvim-window-picker

local api = require("utils.api")

local window_picker = require("window-picker")

window_picker.setup(
    {
        selection_chars = "ASDFJKL;WEIOU",
        autoselect_one = false,
        include_current_win = true,
        filter_rules = {
            -- filter using buffer options

            bo = {
                filetype = {
                    "NvimTree",
                    "aerial",
                    "undotree",
                    "spectre_panel",
                    "dbui",
                    "packer",
                    "notify",
                    "startuptime",
                    "lsp-installer"
                },
                buftype = {}
            },
            wo = {},
            file_path_contains = {},
            file_name_contains = {}
        },
        current_win_hl_color = api.hi.get("BufferLineBuffer", "bg"),
        other_win_hl_color = api.hi.get("BufferLineFill", "bg")
    }
)
-- if you have include_current_win == true, then current_win_hl_color will
-- be highlighted using this background color
window_picker.goto_window = function()
    local target_win_id = window_picker.pick_window()
    vim.fn.win_gotoid(target_win_id)
end
