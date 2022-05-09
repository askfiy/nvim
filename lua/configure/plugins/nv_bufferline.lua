-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/famiu/bufdelete.nvim

local icons = require("utils.icons")
local mapping = require("core.mapping")

local M = {}

function M.before() end

function M.load()
	local ok, m = pcall(require, "bufferline")
	if not ok then
		return
	end

	M.bufferline = m
	M.bufferline.setup({
		options = {
			numbers = "ordinal",
			indicator_icon = "▎",
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",
			-- diagnostics source
			diagnostics = "nvim_lsp",
			-- split style："slant" | "thick" | "thin" | { "|", "|" }
			separator_style = "thin",
			---@diagnostic disable-next-line: unused-local
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local c = ""
				if diagnostics_dict.error then
					c = c .. icons.diagnostics.Error .. diagnostics_dict.error
				elseif diagnostics_dict.warning then
					c = c .. icons.diagnostics.Warn .. diagnostics_dict.warning
				elseif diagnostics_dict.info then
					c = c .. icons.diagnostics.Info .. diagnostics_dict.info
				elseif diagnostics_dict.hint then
					c = c .. icons.diagnostics.Hint .. diagnostics_dict.hint
				end
				return c
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "center",
				},
				{
					filetype = "aerial",
					text = "Outline Explorer",
					highlight = "Directory",
					text_align = "center",
				},
				{
					filetype = "undotree",
					text = "Undo Explorer",
					highlight = "Directory",
					text_align = "center",
				},
				{
					filetype = "dbui",
					text = "Database Explorer",
					highlight = "Directory",
					text_align = "center",
				},
				{
					filetype = "spectre_panel",
					text = "Project Blurry Search",
					highlight = "Directory",
					text_align = "center",
				},
			},
		},
	})
end

function M.after()
	mapping.register("global_mappings", {
		{
			mode = { "n" },
			lhs = "<c-q>",
			rhs = "<cmd>Bdelete!<cr>",
			options = { silent = true },
			description = "Close current buffer",
		},
		{
			mode = { "n" },
			lhs = "<c-h>",
			rhs = "<cmd>BufferLineCyclePrev<cr>",
			options = { silent = true },
			description = "Go to left buffer",
		},
		{
			mode = { "n" },
			lhs = "<c-l>",
			rhs = "<cmd>BufferLineCycleNext<cr>",
			options = { silent = true },
			description = "Go to right buffer",
		},
		{
			mode = { "n" },
			lhs = "<c-e>",
			rhs = "<cmd>BufferLineMovePrev<cr>",
			options = { silent = true },
			description = "Move current buffer to left",
		},
		{
			mode = { "n" },
			lhs = "<c-y>",
			rhs = "<cmd>BufferLineMoveNext<cr>",
			options = { silent = true },
			description = "Move current buffer to right",
		},
		{
			mode = { "n" },
			lhs = "<leader>bh",
			rhs = "<cmd>BufferLineCloseLeft<cr>",
			options = { silent = true },
			description = "Close all left buffers",
		},
		{
			mode = { "n" },
			lhs = "<leader>bl",
			rhs = "<cmd>BufferLineCloseRight<cr>",
			options = { silent = true },
			description = "Close all right buffers",
		},
		{
			mode = { "n" },
			lhs = "<leader>bo",
			rhs = function()
				vim.cmd("BufferLineCloseLeft")
				vim.cmd("BufferLineCloseRight")
			end,
			options = { silent = true },
			description = "Close all other buffers",
		},
		{
			mode = { "n" },
			lhs = "<leader>ba",
			rhs = function()
				vim.cmd("BufferLineCloseLeft")
				vim.cmd("BufferLineCloseRight")
				vim.cmd("Bdelete!")
			end,
			options = { silent = true },
			description = "Close all buffers",
		},
		{
			mode = { "n" },
			lhs = "<leader>bt",
			rhs = "<cmd>BufferLinePick<cr>",
			options = { silent = true },
			description = "Go to buffer *",
		},
		{
			mode = { "n" },
			lhs = "<leader>bs",
			rhs = "<cmd>BufferLineSortByExtension<cr>",
			options = { silent = true },
			description = "Buffers sort (by extension)",
		},
		{
			mode = { "n" },
			lhs = "<leader>b1",
			rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
			options = { silent = true },
			description = "Go to buffer 1",
		},
		{
			mode = { "n" },
			lhs = "<leader>b2",
			rhs = "<cmd>BufferLineGoToBuffer 2<cr>",
			options = { silent = true },
			description = "Go to buffer 2",
		},
		{
			mode = { "n" },
			lhs = "<leader>b3",
			rhs = "<cmd>BufferLineGoToBuffer 3<cr>",
			options = { silent = true },
			description = "Go to buffer 3",
		},
		{
			mode = { "n" },
			lhs = "<leader>b4",
			rhs = "<cmd>BufferLineGoToBuffer 4<cr>",
			options = { silent = true },
			description = "Go to buffer 4",
		},
		{
			mode = { "n" },
			lhs = "<leader>b5",
			rhs = "<cmd>BufferLineGoToBuffer 5<cr>",
			options = { silent = true },
			description = "Go to buffer 5",
		},
		{
			mode = { "n" },
			lhs = "<leader>b6",
			rhs = "<cmd>BufferLineGoToBuffer 6<cr>",
			options = { silent = true },
			description = "Go to buffer 6",
		},
		{
			mode = { "n" },
			lhs = "<leader>b7",
			rhs = "<cmd>BufferLineGoToBuffer 7<cr>",
			options = { silent = true },
			description = "Go to buffer 7",
		},
		{
			mode = { "n" },
			lhs = "<leader>b8",
			rhs = "<cmd>BufferLineGoToBuffer 8<cr>",
			options = { silent = true },
			description = "Go to buffer 8",
		},
		{
			mode = { "n" },
			lhs = "<leader>b9",
			rhs = "<cmd>BufferLineGoToBuffer 9<cr>",
			options = { silent = true },
			description = "Go to buffer 9",
		},
	})
end

return M
