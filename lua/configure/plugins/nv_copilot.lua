-- https://github.com/github/copilot.vim

local mapping = require("core.mapping")

local M = {}

function M.entrance()
    M.register_global_key()
    -- Disable default tab completion
    vim.g.copilot_no_tab_map = true
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "i" },
            lhs = "<c-l>",
            rhs = "copilot#Accept('')",
            options = { silent = true, expr = true },
            description = "Suggestions for using copilot",
        },
        {
            mode = { "n" },
            lhs = "<leader>cp",
            rhs = ":Copilot panel<cr>",
            options = { silent = true },
            description = "Open copilot panel",
        },
    })
end

return M
