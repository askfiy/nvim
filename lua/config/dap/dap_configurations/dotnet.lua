-- yay -S netcoredbg

return {
    adapters = {
        coreclr = {
            type = "executable",
            command = "netcoredbg",
            args = { "--interpreter=vscode" },
        },
    },
    configurations = {
        cs = {
            type = "coreclr",
            name = "launch-netcoredbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end,
        },
    },
}
