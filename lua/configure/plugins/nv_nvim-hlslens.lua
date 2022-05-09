-- https://github.com/kevinhwang91/nvim-hlslens

local mapping = require("core.mapping")

local M = {}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "hlslens")
	if not ok then
		return
	end

	M.hlslens = m
	M.hlslens.setup({
		calm_down = true,
		nearest_only = false,
	})
end

function M.after() end

function M.register_global_key()
	mapping.register({
		{
			mode = { "n" },
			lhs = "n",
			rhs = function()
				vim.cmd("normal! " .. vim.v.count1 .. "n")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Skip to next search result",
		},
		{
			mode = { "n" },
			lhs = "N",
			rhs = function()
				vim.cmd("normal! " .. vim.v.count1 .. "N")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Jump to previous search result",
		},
		{
			mode = { "n" },
			lhs = "*",
			rhs = function()
				vim.cmd("normal! *")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Jump to the next word at the current cursor",
		},

		{
			mode = { "n" },
			lhs = "#",
			rhs = function()
				vim.cmd("normal! #")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Jump to the prev word at the current cursor",
		},
		{
			mode = { "n" },
			lhs = "g*",
			rhs = function()
				vim.cmd("normal! *")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Jump to the next word at the current cursor (forbidden range)",
		},
		{
			mode = { "n" },
			lhs = "g#",
			rhs = function()
				vim.cmd("normal! #")
				require("hlslens").start()
			end,
			options = { silent = true },
			description = "Jump to the prev word at the current cursor (forbidden range)",
		},
	})
end

return M
