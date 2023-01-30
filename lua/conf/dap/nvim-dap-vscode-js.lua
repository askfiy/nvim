-- https://github.com/mxsdev/nvim-dap-vscode-js

local api = require("utils.api")
local options = require("core.options")

local M = {
    requires = {
        "dap-vscode-js",
    },
}

function M.before() end

function M.load()
    M.dap_vscode_js.setup({
        node = "node",
        -- load js-debug-adapter from mason
        debugger_path = api.path.join(options.mason_install_directory, "packages", "js-debug-adapter"),
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    })
end

function M.after() end

return M
