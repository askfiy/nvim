-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    single_file_support = true,
    filetypes = { "css", "scss", "less" },
    cmd = { "vscode-css-language-server", "--stdio" },
    root_dir = util.root_pattern("package.json", ".git"),
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}

return M
