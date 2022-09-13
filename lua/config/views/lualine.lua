-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
    },
}

function M.before() end

function M.load()
    M.lualine.setup({
        options = {
            icons_enabled = true,
            theme = "starlight",
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
            lualine_a = { "mode" },
            lualine_b = { "branch", },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
    })
end

function M.after() end

return M
