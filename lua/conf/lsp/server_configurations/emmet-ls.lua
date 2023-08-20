-- https://github.com/aca/emmet-ls

local util = require("lspconfig.util")

return {
    cmd = { "emmet-ls", "--stdio" },
    filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
    },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
}
