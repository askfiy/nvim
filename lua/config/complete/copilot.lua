-- https://github.com/github/copilot.vim

local api = require("utils.api")

local M = {}

M._viml = true

function M.before()
    M.register_key()
end

function M.load()
    vim.g.copilot_no_tab_map = true
    -- FIX: https://github.com/mfussenegger/nvim-dap/issues/562
    vim.g.copilot_filetypes = {
        ["dap-repl"] = false,
    }
    vim.pretty_print("run ...")
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
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
