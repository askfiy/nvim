-- https://github.com/NvChad/nvim-colorizer.lua

local M = {
    requires = {
        "colorizer",
    },
}

function M.before() end

function M.load()
    M.colorizer.setup({
        filetypes = { "*" },
        user_default_options = {
            css = true,
            -- foreground, background,  virtualtext
            mode = "background",
            virtualtext = "■■■",
        },
    })
end

function M.after() end

return M
