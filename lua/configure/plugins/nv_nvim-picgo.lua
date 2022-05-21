-- https://github.com/askfiy/nvim-picgo

local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "nvim-picgo")
    if not ok then
        return
    end

    M.nvim_picgo = m
    M.nvim_picgo.setup()
end

function M.after() end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>uc",
            rhs = function()
                require("nvim-picgo").upload_clipboard()
            end,
            options = { silent = true },
            description = "Upload image from clipboard",
        },
        {
            mode = { "n" },
            lhs = "<leader>uf",
            rhs = function()
                require("nvim-picgo").upload_imagefile()
            end,
            options = { silent = true },
            description = "Upload image from disk file",
        },
    })
end

return M
