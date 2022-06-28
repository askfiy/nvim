-- https://github.com/kyazdani42/nvim-tree.lua

local api = require("utils.api")
local aux_public = require("utils.aux.public")

local M = {
    safe_requires = {
        { "nvim-tree", "nvim_tree" },
    },
    icons = api.get_icons("diagnostic", true),
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_tree.setup({
        -- disable netrw
        disable_netrw = false,
        -- hijack the netrw window
        hijack_netrw = false,
        -- keeps the cursor on the first letter of the filename when moving in the tree.
        hijack_cursor = true,
        -- refresh tree when changing root
        update_cwd = true,
        -- ignored file types
        ignore_ft_on_setup = { "dashboard" },
        -- auto-reload tree (bufenter event)
        reload_on_bufenter = true,
        -- update the focused file on `bufenter`, un-collapses the folders recursively
        -- until it finds the file.
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            side = "left",
            width = 30,
            hide_root_folder = false,
            signcolumn = "yes",
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = M.icons.Hint,
                info = M.icons.Info,
                warning = M.icons.Warn,
                error = M.icons.Error,
            },
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = true,
                restrict_above_cwd = false,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    enable = true,
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        filters = {
            dotfiles = false,
            custom = { "node_modules", "\\.cache", "__pycache__" },
            exclude = {},
        },
        renderer = {
            add_trailing = true,
            highlight_git = true,
            highlight_opened_files = "none",
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    git = {
                        unstaged = "",
                        staged = "",
                        unmerged = "",
                        renamed = "凜",
                        untracked = "",
                        deleted = "",
                        ignored = "",
                    },
                    folder = {
                        arrow_open = "",
                        arrow_closed = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                },
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            rhs = function()
                aux_public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeToggle")
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
        {
            mode = { "n" },
            lhs = "<leader>fc",
            rhs = function()
                aux_public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeFindFile")
            end,
            options = { silent = true },
            description = "Find the current file and open it in file explorer",
        },
    })
end

return M
