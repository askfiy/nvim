-- https://github.com/norcalli/nvim-colorizer.lua

local M = {
    requires = {
        "colorizer",
    },
}

function M.before() end

function M.load()
    M.colorizer.setup()
end

function M.after()
    vim.cmd("ColorizerReloadAllBuffers")
end

return M
