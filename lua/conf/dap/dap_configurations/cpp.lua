---@diagnostic disable: redundant-parameter

-- https://github.com/Microsoft/vscode-cpptools

return {
    adapters = {
        cppdbg = {
            id = "cppdbg",
            type = "executable",
            -- Linux
            command = "OpenDebugAD7",
        },
    },
    configurations = {
        cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    local source_path = vim.fn.expand("%:p")
                    local execute_path = vim.fn.expand("%:p:r")
                    local command = ("gcc -fdiagnostics-color=always -g %s -o %s"):format(source_path, execute_path)
                    vim.fn.system(command)
                    return execute_path
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
        },
    },
}
