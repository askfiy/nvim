-- https://github.com/iamcco/vim-language-server

local util = require("lspconfig.util")

local M = {}

M.private_attach_callbackfn = function(client, bufnr) end

M.lsp_config = {
    filetypes = { "vim" },
    single_file_support = true,
    cmd = { "vim-language-server", "--stdio" },
    root_dir = util.find_git_ancestor,
    init_options = {
        isNeovim = true,
        iskeyword = "@,48-57,_,192-255,-#",
        vimruntime = "",
        runtimepath = "",
        diagnostic = { enable = true },
        indexes = {
            runtimepath = true,
            gap = 100,
            count = 3,
            projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
        },
        suggest = { fromVimruntime = true, fromRuntimepath = true },
    },
}

return M
