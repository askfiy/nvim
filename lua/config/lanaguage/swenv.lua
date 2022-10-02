-- https://github.com/AckslD/swenv.nvim
local api = require("utils.api")

local M = {
    requires = {
        "swenv",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.swenv.setup({
        ---@diagnostic disable-next-line: missing-parameter
        venvs_path = vim.fn.expand("~/.virtualenvs"),
        post_set_venv = function()
            vim.cmd([[LspRestart]])
            vim.diagnostic.reset()
        end,
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>fv",
            rhs = function()
                require("swenv.api").pick_venv()
            end,
            options = { silent = true },
            description = "Select Python Virtual Environment",
        },
    })
end

return M
