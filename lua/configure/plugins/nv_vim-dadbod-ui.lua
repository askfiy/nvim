-- https://github.com/kristijanhusak/vim-dadbod-ui

local api = require("utils.api")
local aux_public = require("utils.aux.public")
local options = require("core.options")

local M = {}

function M.before()
    M.register_key()
    vim.g.dbs = options.dbs
    vim.g.db_ui_winwidth = 30
    vim.g.db_ui_auto_execute_table_helpers = true
    vim.g.db_ui_execute_on_save = false
end

function M.load() end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>4",
            rhs = function()
                aux_public.toggle_sidebar("dbui")
                vim.cmd("DBUIToggle")
            end,
            options = { silent = true },
            description = "Open Database Explorer",
        },
    })
end

return M
