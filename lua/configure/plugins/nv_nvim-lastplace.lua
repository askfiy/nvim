-- https://github.com/ethanholz/nvim-lastplace

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-lastplace")
    if not ok then
        return
    end

    M.nvim_lastplace = m
    M.nvim_lastplace.setup({
        -- Ignored file types
        ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        -- Ignore buffer types
        ignore_buftype = { "quickfix", "nofile", "help" },
        -- Open fold
        open_folds = true,
    })
end

function M.after() end

return M
