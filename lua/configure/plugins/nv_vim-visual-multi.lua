-- https://github.com/mg979/vim-visual-multi

local mapping = require("core.mapping")

local M = {}

function M.entrance()
	M.register_global_key()
	vim.g.VM_Extend_hl = "VM_Extend_hi"
	vim.g.VM_Cursor_hl = "VM_Cursor_hi"
	vim.g.VM_Mono_hl = "VM_Mono_hi"
	vim.g.VM_Insert_hl = "VM_Insert_hi"
	vim.g.VM_default_mappings = 0
end

function M.register_global_key()
	mapping.register("global_mappings", {
		{
			mode = { "n" },
			lhs = "<tab>",
			rhs = ":call b:VM_Selection.Global.change_mode(1)<cr>",
			options = { silent = true },
			description = "Toggle between normal and visual mode",
		},
		{
			mode = { "n" },
			lhs = "<c-p>",
			rhs = ":call vm#commands#skip(1)<cr>",
			options = { silent = true },
			description = "Delete the current selection",
		},
		{
			mode = { "n" },
			lhs = "<c-n>",
			rhs = ":call vm#commands#ctrln(v:count1)<cr>",
			options = { silent = true },
			description = "Select down",
		},
		{
			mode = { "n" },
			lhs = "<c-s>",
			rhs = ":call vm#commands#skip(0)<cr>",
			options = { silent = true },
			description = "Skip selection",
		},
		{
			mode = { "n" },
			lhs = "<m-p>",
			rhs = ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
			options = { silent = true },
			description = "Create cursor down",
		},
		{
			mode = { "n" },
			lhs = "<m-n>",
			rhs = ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
			options = { silent = true },
			description = "Create cursor up",
		},
	})
end

return M
