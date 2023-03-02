-- https://github.com/norcalli/nvim-colorizer.lua

local M = {
    requires = {
        "colorizer",
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
    vim.api.nvim_create_autocmd({ "CursorMovedI", "CursorMoved", "BufEnter", "BufNewFile" }, {
        command = "ColorizerReloadAllBuffers",
    })
end

return M
