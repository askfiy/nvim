-- https://github.com/rcarriga/nvim-dap-ui

local api = require("utils.api")
local public = require("utils.public")

local M = {
    requires = {
        "dapui",
        "dap",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.dapui.setup({
        layouts = {
            {
                elements = {
                    -- elements can be strings or table with id and size keys.
                    "scopes",
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 30,
                position = "right",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 10,
                position = "bottom",
            },
        },
    })
end

function M.after()
    -- Automatically start dapui when debugging starts
    M.dap.listeners.after.event_initialized["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.dapui.open()
    end
    -- Automatically close dapui and repl windows when debugging is closed
    M.dap.listeners.before.event_terminated["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.dapui.close()
        M.dap.repl.close()
    end
    -- Automatically close dapui and repl windows when debugging is closed
    M.dap.listeners.before.event_exited["dapui_config"] = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.dapui.close()
        M.dap.repl.close()
    end
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>du",
            rhs = function()
                ---@diagnostic disable-next-line: missing-parameter
                require("dapui").toggle()
            end,
            options = { silent = true },
            description = "Toggle debug ui",
        },
        {
            mode = { "n" },
            lhs = "<leader>de",
            rhs = function()
                for _, opts in ipairs(public.get_all_window_buffer_filetype()) do
                    if opts.buf_ft == "dapui_hover" then
                        ---@diagnostic disable-next-line: missing-parameter
                        require("dapui").eval()
                        return
                    end
                end
                ---@diagnostic disable-next-line: missing-parameter
                require("dapui").eval(vim.fn.input("Enter debug expression: "))
            end,
            options = { silent = true },
            description = "Execute debug expressions",
        },
    })
end

return M
