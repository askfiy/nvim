-- https://github.com/mfussenegger/nvim-dap

-- dap download the debugger manually
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

local mapping = require("core.mapping")

local M = {
	dubug_adapter_config = {
		go = require("configure.dap.go"),
		python = require("configure.dap.python"),
		dotnet = require("configure.dap.dotnet"),
	},
}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "dap")
	if not ok then
		return
	end

	M.dap = m
end

function M.after()
	for _, dap_options in pairs(M.dubug_adapter_config) do
		local adapter_name = dap_options.names.adapters
		local configurations_name = dap_options.names.configurations

		M.dap.adapters[adapter_name] = dap_options.adapters
		M.dap.configurations[configurations_name] = dap_options.configurations
	end
end

function M.register_global_key()
	mapping.register({
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
