-- https://github.com/vuejs/vetur/tree/master/server

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {

		root_dir = function()
			return vim.fn.getcwd()
		end,
	},
}
