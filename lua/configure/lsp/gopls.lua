-- https://github.com/golang/tools/tree/master/gopls

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
		end,
	},
	options = {
		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
