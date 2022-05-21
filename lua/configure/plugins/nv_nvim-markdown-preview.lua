-- https://github.com/davidgranstrom/nvim-markdown-preview

local M = {}

function M.entrance()
    -- Markdown preview theme：github solarized-light solarized-dark
    vim.g.nvim_markdown_preview_theme = "github"
    vim.g.nvim_markdown_preview_format = "markdown"
end

return M
