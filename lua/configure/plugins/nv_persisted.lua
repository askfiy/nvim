-- https://github.com/olimorris/persisted.nvim

local path = require("utils.api.path")
local mapping = require("core.mapping")

local M = {
	filter_buf_types = {
		"translate",
		"undotree",
		"dbui",
		"dbout",
		"dev",
		"query",
		"spectre",
		"DAP",
		"toggleterm",
		"NvimTree",
		"startuptime",
	},
}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "persisted")
	if not ok then
		return
	end

	require("telescope").load_extension("persisted")
	M.persisted = m
	M.persisted.setup({
		save_dir = path.join(vim.fn.stdpath("cache"), "sessions"),
		command = "VimLeavePre",
		autosave = true,
	})
end

function M.after()
	-- FIX: fixed behavior
	vim.api.nvim_create_user_command("SessionFilterLoad", function()
		vim.cmd("silent! SessionLoad")
		local bufs = vim.api.nvim_list_bufs()
		local wins = vim.api.nvim_list_wins()
		for _, buf_id in ipairs(bufs) do
			local buf_name = vim.api.nvim_buf_get_name(buf_id)
			if buf_name ~= "" then
				for _, name in ipairs(M.filter_buf_types) do
					if buf_name:find(name) then
						vim.api.nvim_buf_delete(buf_id, { force = true })
						break
					end
				end
			else
				vim.api.nvim_buf_delete(buf_id, { force = true })
			end
		end
		if #wins == 1 then
			local lines = tonumber(vim.fn.system("tput lines"))
			vim.api.nvim_win_set_height(wins[1], lines * 2)
		end
	end, {})
end

function M.register_global_key()
	mapping.register({
		{
			mode = { "n" },
			lhs = "<leader>sl",
			rhs = "<cmd>SessionFilterLoad<cr>",
			options = { silent = true },
			description = "Load session",
		},
		{
			mode = { "n" },
			lhs = "<leader>ss",
			rhs = "<cmd>SessionSave<cr>",
			options = { silent = true },
			description = "Save session",
		},
		{
			mode = { "n" },
			lhs = "<leader>sd",
			rhs = "<cmd>SessionDelete<cr>",
			options = { silent = true },
			description = "Delete session",
		},
		{
			mode = { "n" },
			lhs = "<leader>fs",
			rhs = function()
				require("telescope").extensions.persisted.persisted()
			end,
			options = {silent = true},
			description = "Find all session"
		},
	})
end

return M
