-- https://github.com/valentjn/ltex-ls

local util = require("lspconfig.util")

return {
    cmd = { "ltex-ls" },
    single_file_support = true,
    filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
    root_dir = util.find_git_ancestor,
}
