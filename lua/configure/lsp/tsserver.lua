-- https://github.com/theia-ide/typescript-language-server

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern("tsconfig.json")(fname)
            or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
            or vim.fn.getcwd()
    end,
    init_options = {
        hostInfo = "neovim",
    },
}

return M
