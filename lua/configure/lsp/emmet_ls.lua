-- https://github.com/aca/emmet-ls

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
}

return M
