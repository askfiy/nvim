-- https://github.com/windwp/nvim-autopairs

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-autopairs")
    if not ok then
        return
    end

    M.nvim_autopairs = m
    M.nvim_autopairs.setup()
end

function M.after() end

return M
