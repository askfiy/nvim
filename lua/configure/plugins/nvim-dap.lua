-- https://github.com/mfussenegger/nvim-dap

-- WARN: dap download the debugger manually
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local api = require("utils.api")

local dap = require("dap")

api.hi.set("debugger", {fg = "red"})

-- set breakpoint style
-- vim.fn.sign_define("DapBreakpoint", {text = "⚫", texthl = "debugger", linehl = "", numhl = ""})

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
