-- https://github.com/mfussenegger/nvim-dap

local api = require("utils.api")

local M = {
    requires = {
        "dap",
    },
    adapter_configurations_dir_path = api.path.join("conf", "dap", "dap_configurations"),
}

function M.before()
    M.register_key()
end

function M.load()
    -- join full path
    local require_files_table = M.get_importable_subfiles(M.adapter_configurations_dir_path)

    ---@diagnostic disable-next-line: param-type-mismatch
    for _, require_file in ipairs(require_files_table) do
        local dap_config = require(require_file)
        M.dap.adapters = vim.tbl_deep_extend("force", M.dap.adapters, dap_config.adapters or {})
        M.dap.configurations = vim.tbl_deep_extend("force", M.dap.configurations, dap_config.configurations or {})
    end
end

function M.after() end

function M.get_importable_subfiles(dir)
    local files_table = api.path.listdir_by_filetype(api.path.join(vim.fn.stdpath("config"), "lua", dir), "lua")

    ---@diagnostic disable-next-line: param-type-mismatch
    for index, file_path in ipairs(files_table) do
        files_table[index] = string.format("%s/%s", dir, vim.fn.fnamemodify(file_path, ":t:r"))
    end

    return files_table
end

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
