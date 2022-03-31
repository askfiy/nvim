-- https://github.com/davidgranstrom/nvim-markdown-preview

-- WARN: nvim-markdown-preview manually install dependencies: pandoc and live-server
-- install pandoc via apt or yay install live-server globally via npm
-- yay -S pandoc
-- npm install -g live-server
-- Subsequent use :MarkdownPreview to open the preview

-- markdown theme：github solarized-light solarized-dark
vim.g.nvim_markdown_preview_theme = "github"
vim.g.nvim_markdown_preview_format = "markdown"
