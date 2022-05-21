-- https://github.com/kristijanhusak/vim-carbon-now-sh

local mapping = require("core.mapping")

local M = {}

function M.entrance()
    M.register_global_key()
end

function M.register_global_key()
    mapping.register({
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
