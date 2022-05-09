-- https://github.com/kristijanhusak/vim-dadbod-ui

local options = require("core.options")
local mapping = require("core.mapping")

local M = {}

function M.entrance()
	M.register_global_key()

	vim.g.dbs = options.database_config
	-- width
	vim.g.db_ui_winwidth = 30
	-- automatically execute built-in statements
	vim.g.db_ui_auto_execute_table_helpers = true
	-- do not automatically query when saving
	vim.g.db_ui_execute_on_save = false
end

function M.register_global_key()
	mapping.register("global_mappings", {
		{
			mode = { "n" },
			lhs = "<leader>4",
			rhs = ":DBUIToggle<cr>",
			options = { silent = true },
			description = "Open Database Explorer",
		},
	})
end

return M
