-- yay -S netcoredbg

local M = {}

M.names = {
    adapters = "coreclr",
    configurations = "cs",
}

M.adapters = {
    type = "executable",
    command = "netcoredbg",
    args = { "--interpreter=vscode" },
}

M.configurations = {
    type = "coreclr",
    name = "launch-netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
    end,
}

return M
