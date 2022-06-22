-- https://github.com/hrsh7th/vscode-langservers-extracted

local util = require("lspconfig.util")

local root_files = {
    "package.json",
    ".git",
}

return {
    filetypes = { "html" },
    single_file_support = true,
    cmd = { "vscode-html-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname)
    end,
    settings = {},
    init_options = {
        provideFormatter = true,
        embeddedLanguages = { css = true, javascript = true },
        configurationSection = { "html", "css", "javascript" },
    },
}
