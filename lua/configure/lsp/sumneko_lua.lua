-- https://github.com/sumneko/lua-language-server

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
			-- disable sumneko format
			client.resolved_capabilities.document_formatting = false
		end,
	},
	options = {
		-- cmd = { "lua-language-server", "--locale=zh-CN" },
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		log_level = 2,
		root_dir = function()
			return vim.fn.getcwd()
		end,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}
