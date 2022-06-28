-- https://github.com/mfussenegger/nvim-dap

local api = require("utils.api")

local M = {
    safe_requires = {
        { "dap" },
    },
    dap_root_directory = api.path.join(vim.fn.stdpath("config"), "lua", "configure", "dap"),
}

function M.before()
    M.register_key()
end

function M.load()
    ---@diagnostic disable-next-line: missing-parameter
    local file_list = vim.fn.globpath(M.dap_root_directory, "*.lua", false, true)

    for _, file in ipairs(file_list) do
        local dap_config = require("configure.dap." .. vim.fn.fnamemodify(file, ":t:r"))
        M.dap.adapters = vim.tbl_deep_extend("force", M.dap.adapters, dap_config.adapters)
        M.dap.configurations = vim.tbl_deep_extend("force", M.dap.configurations, dap_config.configurations)
    end

end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>db",
            rhs = function()
                require("dap").toggle_breakpoint()
            end,
            options = { silent = true },
            description = "Mark or delete breakpoints",
        },
        {
            mode = { "n" },
            lhs = "<leader>dc",
            rhs = function()
                require("dap").clear_breakpoints()
            end,
            options = { silent = true },
            description = "Clear breakpoints in the current buffer",
        },
        {
            mode = { "n" },
            lhs = "<F5>",
            rhs = function()
                require("dap").continue()
            end,
            options = { silent = true },
            description = "Enable debugging or jump to the next breakpoint",
        },
        {
            mode = { "n" },
            lhs = "<F6>",
            rhs = function()
                require("dap").step_into()
            end,
            options = { silent = true },
            description = "Step into",
        },
        {
            mode = { "n" },
            lhs = "<F7>",
            rhs = function()
                ---@diagnostic disable-next-line: missing-parameter
                require("dap").step_over()
            end,
            options = { silent = true },
            description = "Step over",
        },
        {
            mode = { "n" },
            lhs = "<F8>",
            rhs = function()
                require("dap").step_out()
            end,
            options = { silent = true },
            description = "Step out",
        },
        {
            mode = { "n" },
            lhs = "<F9>",
            rhs = function()
                require("dap").run_last()
            end,
            options = { silent = true },
            description = "Rerun debug",
        },
        {
            mode = { "n" },
            lhs = "<F10>",
            rhs = function()
                require("dap").terminate()
            end,
            options = { silent = true },
            description = "Close debug",
        },
    })
end

return M
