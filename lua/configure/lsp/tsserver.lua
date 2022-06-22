-- https://github.com/theia-ide/typescript-language-server

local util = require("lspconfig.util")

local root_files = {
    "tsconfig.json",
    "package.json",
    "jsconfig.json",
    ".git",
}

return {
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname) or vim.fn.getcwd()
    end,
    init_options = {
        hostInfo = "neovim",
    },
}
