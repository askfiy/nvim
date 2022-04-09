-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/SmiteshP/nvim-gps

local icons = require("utils.icons")

local gps = require("nvim-gps")

gps.setup()

local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ""
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
        end
        return str
    end
end

local function hide_component()
    local filetype_table = {
        "NvimTree",
        "aerial",
        "dbui"
    }
    local filetype = vim.bo.filetype
    for _, ft in ipairs(filetype_table) do
        if filetype == ft then
            return false
        end
    end
    return true
end

local function show_component()
    return not hide_component()
end

require("lualine").setup(
    {
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = {left = "", right = ""},
            section_separators = {left = "", right = ""},
            disabled_filetypes = {},
            always_divide_middle = true
        },
        sections = {
            lualine_a = {
                {
                    "fileformat",
                    symbols = {
                        unix = " ", -- e712
                        dos = " ", -- e70f
                        mac = " " -- e711
                    },
                    cond = hide_component,
                    fmt = trunc(12, 0, nil, true)
                },
                {
                    "mode",
                    cond = hide_component,
                    fmt = trunc(22, 0, nil, true)
                },
                {
                    "filetype",
                    cond = show_component,
                    fmt = trunc(12, 0, nil, true)
                }
            },
            lualine_b = {
                {
                    "branch",
                    cond = hide_component,
                    fmt = trunc(70, 0, nil, true)
                },
                {
                    "diff",
                    cond = hide_component,
                    fmt = trunc(85, 0, nil, true)
                },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.error,
                        warn = icons.diagnostics.warning,
                        info = icons.diagnostics.info,
                        hint = icons.diagnostics.hint
                    },
                    cond = hide_component,
                    fmt = trunc(90, 0, nil, true)
                }
            },
            lualine_c = {
                {
                    "filename",
                    cond = hide_component,
                    fmt = trunc(37, 0, nil, true)
                },
                {
                    gps.get_location,
                    cond = gps.is_available,
                    fmt = trunc(120, 0, nil, true)
                }
            },
            lualine_x = {
                {
                    "filetype",
                    cond = hide_component,
                    fmt = trunc(42, 0, nil, true)
                }
            },
            lualine_y = {
                {
                    "encoding",
                    cond = hide_component,
                    fmt = trunc(52, 0, nil, true)
                }
            },
            lualine_z = {
                {
                    "location",
                    cond = hide_component,
                    fmt = trunc(61, 0, nil, true)
                },
                {
                    "progress",
                    cond = hide_component,
                    fmt = trunc(12, 0, nil, true)
                }
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                {
                    "filename",
                    fmt = trunc(10, 0, nil, true)
                }
            },
            lualine_x = {
                {
                    "location",
                    fmt = trunc(20, 0, nil, true)
                }
            },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {}
    }
)
