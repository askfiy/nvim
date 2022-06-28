-- https://github.com/norcalli/nvim-colorizer.lua

local M = {
    safe_requires = {
        { "colorizer" },
    },
}

function M.before() end

function M.load()

    local opts = {
        css = true,
    }

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
