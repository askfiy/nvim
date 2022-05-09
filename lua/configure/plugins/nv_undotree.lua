-- https://github.com/mbbill/undotree

local path = require("utils.api.path")
local mapping = require("core.mapping")

local M = {
	undotree_dir = path.join(vim.fn.stdpath("cache"), "undotree"),
}

function M.entrance()
	M.register_global_key()
	if vim.fn.has("persistent_undo") then
		local target_path = vim.fn.expand(M.undotree_dir)
		if not vim.fn.isdirectory(target_path) then
			vim.fn.mkdir(target_path, "p", 0700)
		end
		vim.o.undodir = target_path
		vim.o.undofile = true
	end
end

function M.register_global_key()
	mapping.register("buffer_mappings", {
		{
			mode = { "n" },
			lhs = "<leader>3",
			rhs = ":UndotreeToggle<cr>",
			options = { silent = true },
			description = "Open Undo Explorer",
		},
	})
end

return M
