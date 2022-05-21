-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    single_file_support = true,
    filetypes = { "json", "jsonc" },
    cmd = { "vscode-json-language-server", "--stdio" },
    init_options = {
        provideFormatter = true,
    },
    root_dir = util.find_git_ancestor,
}

return M
