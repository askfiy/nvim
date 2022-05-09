-- yay -S netcoredbg

return {
	names = {
		adapters = "coreclr",
		configurations = "cs",
	},
	adapters = {
		type = "executable",
		command = "netcoredbg",
		args = { "--interpreter=vscode" },
	},
	configurations = {
		type = "coreclr",
		name = "launch-netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}
