-- https://github.com/tailwindlabs/tailwindcss-intellisense

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end

M.lsp_config = {
    cmd = { "tailwindcss-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern("tailwind.config.js", "tailwind.config.ts")(fname)
            or util.root_pattern("postcss.config.js", "postcss.config.ts")(fname)
            or util.find_package_json_ancestor(fname)
            or util.find_node_modules_ancestor(fname)
            or util.find_git_ancestor(fname)
            or vim.fn.getcwd()
    end,
}

return M
