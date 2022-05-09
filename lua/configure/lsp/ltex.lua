-- https://github.com/valentjn/ltex-ls

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {
		cmd = { "ltex-ls" },
		filetype = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
