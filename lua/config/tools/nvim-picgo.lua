-- https://github.com/askfiy/nvim-picgo

local api = require("utils.api")

local M = {
    requires = {
        "nvim-picgo",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_picgo.setup()
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
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
