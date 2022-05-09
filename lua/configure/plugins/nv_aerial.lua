-- https://github.com/stevearc/aerial.nvim

local icons = require("utils.icons")
local options = require("core.options")
local mapping = require("core.mapping")

local M = {
	aerial_icons = {},
}

function M.before()
	for kind, icon in pairs(icons[options.icons_style]) do
		M.aerial_icons[kind] = icon:sub(1, #icon - 1)
	end
end

function M.load()
	local ok, m = pcall(require, "aerial")
	if not ok then
		return
	end

	M.aerial = m
	M.aerial.setup({
		min_width = 30,
		-- backends = { "lsp", "treesitter", "markdown" },
		backends = { "treesitter", "markdown" },
		-- show all icons
		filter_kind = false,
		-- auto use lspkind-nvim or nvim-web-devicons
		icons = M.aerial_icons,
		-- Show box drawing characters for the tree hierarchy
		show_guides = true,
		-- Customize the characters used when show_guides = true
		guides = {
			-- When the child item has a sibling below it
			mid_item = "├─",
			-- When the child item is the last in the list
			last_item = "└─",
			-- When there are nested child guides to the right
			nested_top = "│ ",
			-- Raw indentation
			whitespace = "  ",
		},
		update_events = "TextChanged,InsertLeave",
		on_attach = function(bufnr)
			M.register_buffer_key(bufnr)
		end,
	})
end

function M.after() end

function M.register_buffer_key(bufnr)
	mapping.register("buffer_mappings", {
		{
			mode = { "n" },
			lhs = "<leader>2",
			rhs = "<cmd>AerialToggle! right<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Open Outilne Explorer",
		},
		{

			mode = { "n" },
			lhs = "{",
			rhs = "<cmd>AerialPrev<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Move item up",
		},
		{

			mode = { "n" },
			lhs = "}",
			rhs = "<cmd>AerialNext<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Move item down",
		},
		{

			mode = { "n" },
			lhs = "[[",
			rhs = "<cmd>AerialPrevUp<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Move up one level",
		},
		{

			mode = { "n" },
			lhs = "]]",
			rhs = "<cmd>AerialNextUp<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Move down one level",
		},
	})
end

return M
