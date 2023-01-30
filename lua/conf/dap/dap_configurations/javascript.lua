-- npm i -g vscode-js-debug

return {
    adapters = {
        --[[
        Already set by nvim-dap-vscode-js
        ]]
    },
    configurations = {
        javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
                outFiles = { "${workspaceFolder}/dist/**/*.js" },
                runtimeExecutable = "node",
                skipFiles = { "<node_internals>/**", "node_modules/**" },
                resolveSourceMapLocations = {
                    "${workspaceFolder}/dist/**/*.js",
                    "${workspaceFolder}/**",
                    "!**/node_modules/**",
                },
            },
        },
    },
}
