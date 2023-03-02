---@diagnostic disable: unused-local

-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
        "visual_studio_code",
    },
}

---@diagnostic disable-next-line: unused-function
local function diff_source()
    -- require gitsigns
    ---@diagnostic disable-next-line: undefined-field
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

function M.before() end

function M.load()
    M.lualine.setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
            refresh = {
                statusline = 1000,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = M.visual_studio_code.get_lualine_sections(),
    })
end

function M.after() end

return M
