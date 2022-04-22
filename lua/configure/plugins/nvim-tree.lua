-- https://github.com/kyazdani42/nvim-tree.lua

local icons = require("utils.icons")

-- add a backslash / after the directory
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_icons = {
    default = icons.nvim_tree.default_icon,
    symlink = icons.nvim_tree.symlink_file,
    git = {
        unstaged = icons.nvim_tree.git_unstaged,
        staged = icons.nvim_tree.git_staged,
        unmerged = icons.nvim_tree.git_unmerged,
        renamed = icons.nvim_tree.git_renamed,
        untracked = icons.nvim_tree.git_untracked,
        deleted = icons.nvim_tree.git_deleted,
        ignored = icons.nvim_tree.git_ignored
    },
    folder = {
        -- arrow_open = "╰─▸",
        -- arrow_closed = "├─▸",
        arrow_open = icons.nvim_tree.folder_arrow_open,
        arrow_closed = icons.nvim_tree.folder_arrow_closed,
        default = icons.nvim_tree.folder_default,
        open = icons.nvim_tree.folder_open,
        empty = icons.nvim_tree.folder_empty,
        empty_open = icons.nvim_tree.folder_empty_open,
        symlink = icons.nvim_tree.folder_symlink,
        symlink_open = icons.nvim_tree.folder_symlink_open
    }
}

require("nvim-tree").setup(
    {
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            auto_resize = true
        },
        actions = {
            change_dir = {
                enable = true,
                global = true
            }
        },
        diagnostics = {
            enable = true,
            icons = {
                hint = icons.diagnostics.hint,
                info = icons.diagnostics.info,
                warning = icons.diagnostics.warning,
                error = icons.diagnostics.error
            }
        },
        git = {
            enable = true,
            ignore = true,
            timeout = 500
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
