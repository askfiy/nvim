-- https://github.com/Mofiqul/vscode.nvim

local options = require("core.options")

local M = {}

function M.before() end

function M.load()
    -- mode
    vim.g.vscode_style = "dark"
    -- vim.g.vscode_style = "light"
    -- transparent background
    vim.g.vscode_transparent = options.transparent_background
    -- Enable italic comment
    vim.g.vscode_italic_comment = 0
    -- Disable nvim-tree background color
    vim.g.vscode_disable_nvimtree_bg = true
end

function M.after()
    vim.cmd([[colorscheme vscode]])
    -- custom theme highlighting
    require("configure.theme.vscode.highlights-" .. vim.g.vscode_style).execute()
end

return M
