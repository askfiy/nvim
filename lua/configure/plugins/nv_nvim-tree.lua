-- https://github.com/kyazdani42/nvim-tree.lua

local aux = require("utils.api.aux")
local icons = require("utils.icons")
local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "nvim-tree")
    if not ok then
        return
    end

    M.nvim_tree = m
    M.nvim_tree.setup({
        -- Disable netrw
        disable_netrw = false,
        -- Hijack the netrw window
        hijack_netrw = false,
        -- Keeps the cursor on the first letter of the filename when moving in the tree.
        hijack_cursor = true,
        -- Refresh tree when changing root
        update_cwd = true,
        -- Ignored file types
        ignore_ft_on_setup = { "dashboard" },
        -- Auto-reload tree (BufEnter event)
        reload_on_bufenter = true,
        -- Update the focused file on `BufEnter`, un-collapses the folders recursively
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
                hint = icons.diagnostics.Hint,
                info = icons.diagnostics.Info,
                warning = icons.diagnostics.Warn,
                error = icons.diagnostics.Error,
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

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            -- rhs = "<cmd>NvimTreeToggle<cr>",
            rhs = function()
                aux.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeToggle")
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
        {
            mode = { "n" },
            lhs = "<leader>fc",
            rhs = "<cmd>NvimTreeFindFile<cr>",
            options = { silent = true },
            description = "Find the current file and open it in file explorer",
        },
    })
end

return M
