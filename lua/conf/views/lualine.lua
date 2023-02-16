-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
    },
}

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
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                { "mode" },
            },
            lualine_b = {
                "branch",
                { "diff", source = diff_source },
                "diagnostics",
            },
            lualine_c = {
                "filename",
            },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
            },
            lualine_y = {
                "progress",
            },
            lualine_z = { "location" },
        },
    })
end

function M.after() end

return M
