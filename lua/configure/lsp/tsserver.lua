-- https://github.com/theia-ide/typescript-language-server

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
	},
	options = {
		cmd = { "typescript-language-server", "--stdio" },
		init_options = {
			hostInfo = "neovim",
		},
		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
