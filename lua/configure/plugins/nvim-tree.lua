-- https://github.com/kyazdani42/nvim-tree.lua

local icons = require("utils.icons")

-- add a backslash / after the directory
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_icons = {
    default = " ",
    symlink = " ",
    git = {
        unstaged = "",
        staged = "",
        unmerged = "",
        renamed = "凜",
        untracked = "",
        deleted = "",
        ignored = ""
    },
    folder = {
        -- arrow_open = "╰─▸",
        -- arrow_closed = "├─▸",
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}

require("nvim-tree").setup(
    {
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = icons.diagnostics.hint,
                info = icons.diagnostics.info,
                warning = icons.diagnostics.warning,
                error = icons.diagnostics.error
            }
        }
    }
)

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*"},
        callback = function()
            if vim.fn.winnr("$") == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
                vim.cmd("quit")
            end
        end
    }
)
