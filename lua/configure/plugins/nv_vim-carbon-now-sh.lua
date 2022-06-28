-- https://github.com/kristijanhusak/vim-carbon-now-sh

local api = require("utils.api")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load() end

function M.after() end

function M.register_global_key()
    api.map.bulk_register({
        {
            mode = { "v" },
            lhs = "<leader>ci",
            rhs = ":CarbonNowSh<cr>",
            options = { silent = true },
            description = "Code screenshot",
        },
        {
            mode = { "n" },
            lhs = "<leader>ci",
            rhs = "ggVG:CarbonNowSh<cr>",
            options = { silent = true },
            description = "Code screenshot",
        },
    })
end

return M
