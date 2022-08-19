-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local root_files = {
    "package.json",
    ".git",
}

return {
    single_file_support = true,
    filetypes = { "css", "scss", "less" },
    cmd = { "vscode-css-language-server", "--stdio" },
    root_dir = util.root_pattern(unpack(root_files)),
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}
