-- https://github.com/kyazdani42/nvim-tree.lua

local icons = require("utils.icons")
local mapping = require("core.mapping")

local M = {}

function M.before()
	M.register_global_key()

	vim.g.nvim_tree_add_trailing = 1

	vim.g.nvim_tree_icons = {
		default = " ",
		symlink = " ",
		git = {
			unstaged = "",
			staged = "",
			unmerged = "",
			renamed = "凜",
			untracked = "",
			deleted = "",
			ignored = "",
		},
		folder = {
			-- arrow_open = "╰─▸",
			-- arrow_closed = "├─▸",
			arrow_open = "",
			arrow_closed = "",
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = "",
		},
	}
end

function M.load()
	local ok, m = pcall(require, "nvim-tree")
	if not ok then
		return
	end

	M.nvim_tree = m
	M.nvim_tree.setup({
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = icons.diagnostics.Hint,
				info = icons.diagnostics.Info,
				warning = icons.diagnostics.Warn,
				error = icons.diagnostics.Error,
			},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = true,
				restrict_above_cwd = false,
			},
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
	})
end

function M.after() end

function M.register_global_key()
	mapping.register({
		{
			mode = { "n" },
			lhs = "<leader>1",
			rhs = "<cmd>NvimTreeToggle<cr>",
			options = { silent = true },
			description = "Open File Explorer",
		},
		{
			mode = { "n" },
			lhs = "<leader>fc",
			rhs = "<cmd>NvimTreeFindFile<cr>",
			options = { silent = true },
			description = "Find the current file and open it in file explorer",
		},
	})
end

return M
