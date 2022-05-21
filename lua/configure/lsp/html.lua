-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    filetypes = { "html" },
    single_file_support = true,
    cmd = { "vscode-html-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern("package.json", ".git")(fname)
    end,
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
}

return M
