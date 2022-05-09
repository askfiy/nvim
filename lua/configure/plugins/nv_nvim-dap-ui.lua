-- https://github.com/rcarriga/nvim-dap-ui

local mapping = require("core.mapping")

local M = {}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "dapui")
	if not ok then
		return
	end

	M.dap = require("dap")
	M.dapui = m
	M.dapui.setup({
		sidebar = {
			-- dapui windows on the right
			position = "right",
		},
	})
end

function M.after()
	-- automatically start dapui when debugging starts
	M.dap.listeners.after.event_initialized["dapui_config"] = function()
		---@diagnostic disable-next-line: missing-parameter
		M.dapui.open()
	end
	M.dap.listeners.before.event_terminated["dapui_config"] = function()
		---@diagnostic disable-next-line: missing-parameter
		M.dapui.close()
		M.dap.repl.close()
	end
	M.dap.listeners.before.event_exited["dapui_config"] = function()
		---@diagnostic disable-next-line: missing-parameter
		M.dapui.close()
		M.dap.repl.close()
	end
end

function M.register_global_key()
	mapping.register({
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
				---@diagnostic disable-next-line: missing-parameter
				require("dapui").eval()
			end,
			options = { silent = true },
			description = "Execute debug expressions",
		},
	})
end

return M
