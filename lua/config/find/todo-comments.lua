-- https://github.com/folke/todo-comments.nvim

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons("tag_level", true)

local M = {
    requires = {
        "todo-comments",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.todo_comments.setup({
        keywords = {
            -- alt = alias
            NOTE = { icon = icons.Note, color = "#96CDFB" },
            TODO = { icon = icons.Todo, color = "#B5E8E0" },
            PERF = { icon = icons.Pref, color = "#F8BD96" },
            WARN = { icon = icons.Warn, color = "#FAE3B0" },
            HACK = { icon = icons.Hack, color = "#DDB6F2" },
            FIX = {
                icon = icons.Fixme,
                color = "#DDB6F2",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>fd",
            rhs = function()
                require("telescope").extensions["todo-comments"].todo()
            end,
            options = { silent = true },
            description = "Find todo tag in the current workspace",
        },
    })
end

return M
