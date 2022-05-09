-- https://github.com/catppuccin/nvim

local options = require("core.options")

local M = {}

function M.before() end

function M.load()
	local ok, m = pcall(require, "catppuccin")
	if not ok then
		return
	end

	M.catppuccin = m
	M.catppuccin.setup({
		transparent_background = options.transparent_background,
		term_colors = false,
		styles = {
			comments = "NONE",
			functions = "NONE",
			keywords = "NONE",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			-- enable plugins
			cmp = true,
			treesitter = true,
			bufferline = true,
			gitsigns = true,
			telescope = true,
			which_key = true,
			notify = true,
			hop = true,
			ts_rainbow = true,
			-- diable plugins
			lsp_trouble = false,
			lsp_saga = false,
			gitgutter = false,
			dashboard = false,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = false,
			markdown = false,
			lightspeed = false,
			telekasten = false,
			symbols_outline = false,
			-- enable plugins
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "NONE",
					hints = "NONE",
					warnings = "NONE",
					information = "NONE",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			nvimtree = {
				enabled = true,
				show_root = false,
				transparent_panel = options.transparent_background,
			},
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			-- disable plugins
			neotree = {
				enabled = false,
				show_root = false,
				transparent_panel = false,
			},
		},
	})
end

function M.after()
	vim.cmd([[colorscheme catppuccin]])
	-- custom theme highlighting
	require("configure.theme.catppuccin.highlights").execute()
end

return M
