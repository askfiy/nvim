-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

return {
    single_file_support = true,
    filetypes = { "json", "jsonc" },
    cmd = { "vscode-json-language-server", "--stdio" },
    init_options = {
        provideFormatter = true,
    },
    root_dir = util.find_git_ancestor,
}
