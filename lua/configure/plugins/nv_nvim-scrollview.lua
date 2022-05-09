-- https://github.com/dstein64/nvim-scrollview

local M = {}

function M.before() end

function M.load()
	local ok, m = pcall(require, "scrollview")
	if not ok then
		return
	end

	M.scrollview = m
	M.scrollview.setup({
		excluded_filetypes = { "NvimTree", "aerial", "undotree", "dbui", "spectre_panel" },
		-- only show in current window
		current_only = true,
		-- Transparency
		winblend = 0,
		base = "right",
		-- offset
		column = 1,
		character = "",
	})
end

function M.after()
	-- highlighting: ScrollView
end

return M
