-- https://github.com/vuejs/vetur/tree/master/server

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr) end

M.lsp_config = {
    cmd = { "vls" },
    filetypes = { "vue" },
    root_dir = function(fname)
        return util.root_pattern("tsconfig.json")(fname)
            or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
            or vim.fn.getcwd()
    end,
    init_options = {
        config = {
            vetur = {
                completion = {
                    autoImport = true,
                    tagCasing = "kebab",
                    useScaffoldSnippets = true,
                },
                useWorkspaceDependencies = true,
                validation = {
                    script = true,
                    style = true,
                    template = true,
                },
            },
        },
    },
}

return M
