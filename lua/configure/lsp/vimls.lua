-- https://github.com/iamcco/vim-language-server

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {
		cmd = { "vim-language-server", "--stdio" },
		filetypes = { "vim" },
	},
}
