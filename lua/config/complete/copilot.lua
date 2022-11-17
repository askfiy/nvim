-- https://github.com/github/copilot.vim

local api = require("utils.api")

local M = {}

M._viml = true

function M.before()
    M.register_key()
end

function M.load()
    vim.g.copilot_no_tab_map = true
    -- -- FIX: https://github.com/mfussenegger/nvim-dap/issues/562
    vim.api.nvim_set_var("copilot_filetypes", {
        ["dap-repl"] = false,
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({

        {
            mode = { "i" },
            lhs = "<c-l>",
            rhs = "copilot#Accept('')",
            -- FIX: add force options : https://github.com/community/community/discussions/29817
            options = { silent = true, expr = true, force = true },
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
