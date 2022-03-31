-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/SmiteshP/nvim-gps

local gps = require("nvim-gps")

gps.setup()

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

-- require persisted.nvim
local function get_persisting()
    if vim.g.persisting then
        return " "
    elseif vim.g.persisting == false then
        return " "
    end
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
                {"mode", cond = hide_component},
                {"filetype", cond = show_component}
            },
            lualine_b = {
                {"branch", cond = hide_component},
                {"diff", cond = hide_component},
                {"diagnostics", cond = hide_component}
            },
            lualine_c = {
                {"filename", cond = hide_component},
                {gps.get_location, cond = gps.is_available}
            },
            lualine_x = {
                {"encoding", cond = hide_component},
                {"fileformat", cond = hide_component},
                {"filetype", cond = hide_component}
            },
            lualine_y = {
                {get_persisting, cond = hide_component},
                {"progress", cond = hide_component}
            },
            lualine_z = {
                {"location", cond = hide_component}
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {"filename"},
            lualine_x = {"location"},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {}
    }
)
