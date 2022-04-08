-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap download the debugger manually
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local utils = require("utils")

local dap = require("dap")

utils.hi.set("debugger", {fg = "red"})

-- set breakpoint style
vim.fn.sign_define("DapBreakpoint", {text = "⚫", texthl = "debugger", linehl = "", numhl = ""})

-- load debugger configuration
local dap_config = {
    python = require("configure.dap.python"),
    go = require("configure.dap.go")
}

-- apply debugger configuration
for dap_name, dap_options in pairs(dap_config) do
    dap.adapters[dap_name] = dap_options.adapters
    dap.configurations[dap_name] = dap_options.configurations
end

dap.close_all = function()
    vim.cmd("lua require'dap'.close()")
    vim.cmd("lua require'dap.repl'.close()")
    vim.cmd("lua require'dapui'.close()")
    vim.cmd("DapVirtualTextForceRefresh")
end
