-- https://github.com/kyazdani42/nvim-tree.lua

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons("diagnostic", true)

local M = {
    requires = {
        "nvim-tree",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.nvim_tree.setup({
        disable_netrw = false,
        hijack_netrw = false,
        hijack_cursor = true,
        update_cwd = true,
        ignore_ft_on_setup = { "dashboard" },
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            side = "left",
            width = 30,
            hide_root_folder = false,
            signcolumn = "yes",
            mappings = {
                list = {
                    { key = "?", action = "toggle_help" },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = icons.Hint,
                info = icons.Info,
                warning = icons.Warn,
                error = icons.Error,
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

function M.after()
    -- FIX: https://github.com/kyazdani42/nvim-tree.lua/issues/1502
    local utils = require("nvim-tree.utils")

    ---@diagnostic disable-next-line: unused-local
    local function notify_level(level)
        return function(msg)
            vim.schedule(function()
                vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
            end)
        end
    end

    utils.notify.warn = notify_level(vim.log.levels.WARN)
    utils.notify.error = notify_level(vim.log.levels.ERROR)
    utils.notify.info = notify_level(vim.log.levels.INFO)
    utils.notify.debug = notify_level(vim.log.levels.DEBUG)
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>1",
            rhs = function()
                public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeToggle")
            end,
            options = { silent = true },
            description = "Open File Explorer",
        },
        {
            mode = { "n" },
            lhs = "<leader>fc",
            rhs = function()
                public.toggle_sidebar("NvimTree")
                vim.cmd("NvimTreeFindFile")
            end,
            options = { silent = true },
            description = "Find the current file and open it in file explorer",
        },
    })
end

return M
