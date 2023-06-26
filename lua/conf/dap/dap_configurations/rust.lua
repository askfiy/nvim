---@diagnostic disable: redundant-parameter

-- https://github.com/Microsoft/vscode-cpptools
local api = require("utils.api")

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
        rust = {
            {
                name = "Rust debug",
                type = "cppdbg",
                request = "launch",
                program = function()
                    local project_root_dir = vim.fn.expand("%:p:h:h")
                    local execute_file_name = vim.fn.expand("%:p:h:h:t")
                    local execute_path = api.path.join(project_root_dir, "target", "debug", execute_file_name)
                    vim.fn.jobstart("cargo build")
                    return execute_path
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = true,
            },
        },
    },
}
