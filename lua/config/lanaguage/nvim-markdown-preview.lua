-- https://github.com/davidgranstrom/nvim-markdown-preview

local M = {}

function M.before() end

function M.load()
    -- markdown preview theme：github solarized-light solarized-dark
    vim.g.nvim_markdown_preview_theme = "github"
    vim.g.nvim_markdown_preview_format = "markdown"
end

function M.after() end

return M
