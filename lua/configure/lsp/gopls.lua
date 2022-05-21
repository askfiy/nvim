-- https://github.com/golang/tools/tree/master/gopls

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    cmd = { "gopls" },
    single_file_support = true,
    filetypes = { "go", "gomod", "gotmpl" },
    root_dir = function(fname)
        return util.root_pattern("go.work")(fname) or util.root_pattern("go.mod", ".git")(fname)
    end,
}

return M
