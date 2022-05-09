-- https://github.com/jbyuki/venn.nvim

local mapping = require("core.mapping")

local M = {
	notify = nil,
	buffer_mappings = nil,
}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "venn")
	if not ok then
		return
	end

	M.venn = m
end

function M.after()
	M.wrapper_command()
end

function M.open_venn_notify()
	---@diagnostic disable-next-line: missing-parameter
	vim.notify.dismiss()
	M.notify = vim.notify("Venn enabled", "info", {
		title = "Venn",
		keep = function()
			return vim.b.venn_enabled
		end,
		render = "minimal",
	})
end

function M.close_venn_notify()
	vim.notify("Venn disabled", "info", {
		title = "Venn",
		render = "minimal",
	})
end
function M.wrapper_command()
	M.venn.toggle_venn_mode = function()
		local venn_enable = vim.b.venn_enabled
		if not venn_enable then
			vim.b.venn_enabled = true
			vim.wo.virtualedit = "all"
			if not M.buffer_mappings then
				M.buffer_mappings = vim.deepcopy(mapping.buffer_mappings)
			end
			M.register_buffer_key(0)
			M.open_venn_notify()
		else
			vim.b.venn_enabled = false
			vim.wo.virtualedit = ""
			vim.cmd([[mapclear <buffer>]])
			mapping.register("buffer_mappings", M.buffer_mappings)
			M.close_venn_notify()
		end
	end
end

function M.register_global_key()
	mapping.register("global_mappings", {
		{
			mode = { "n" },
			lhs = "<leader>5",
			rhs = function()
				require("venn").toggle_venn_mode()
			end,
			options = { silent = true },
			description = "Open Venn Mode",
		},
	})
end

function M.register_buffer_key(bufnr)
	mapping.register("buffer_mappings", {
		{
			mode = { "n" },
			lhs = "<c-j>",
			rhs = "<c-v>j:VBox<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw line to down",
		},
		{
			mode = { "n" },
			lhs = "<c-k>",
			rhs = "<c-v>k:VBox<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw line to up",
		},
		{
			mode = { "n" },
			lhs = "<c-l>",
			rhs = "<c-v>l:VBox<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw line to left",
		},
		{
			mode = { "n" },
			lhs = "<c-h>",
			rhs = "<c-v>h:VBox<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw line to right",
		},
		{
			mode = { "v" },
			lhs = "b",
			rhs = ":VBox<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw hollow box",
		},
		{
			mode = { "v" },
			lhs = "f",
			rhs = ":VFill<cr>",
			options = { silent = true, buffer = bufnr },
			description = "Draw solid box",
		},
	})
end

return M
