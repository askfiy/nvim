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
    })
end

function M.after() end

return M
