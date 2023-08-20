-- https://github.com/mads-hartmann/bash-language-server

local util = require("lspconfig.util")

return {
    filetypes = { "sh", "zsh" },
    single_file_support = true,
    cmd = { "bash-language-server", "start" },
    root_dir = util.find_git_ancestor,
}
