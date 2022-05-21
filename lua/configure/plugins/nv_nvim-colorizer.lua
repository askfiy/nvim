-- https://github.com/norcalli/nvim-colorizer.lua

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "colorizer")
    if not ok then
        return
    end

    local opts = {
        css = true,
    }

    M.colorizer = m
    M.colorizer.setup({
        "*",
        css = opts,
        javascript = opts,
        typescript = opts,
        vue = opts,
    })
end

function M.after()
    vim.cmd("ColorizerReloadAllBuffers")
end

return M
