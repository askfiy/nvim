-- https://github.com/RRethy/vim-illuminate

local M = {}

function M.entrance()
	vim.g.Illuminate_ftblacklist = {
		"NvimTree",
		"aerial",
		"undotree",
		"spectre_panel",
		"dbui",
		"toggleterm",
		"packer",
		"help",
		"notify",
		"startuptime",
		"lsp-installer",
	}
end

return M
