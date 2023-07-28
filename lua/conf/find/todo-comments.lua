-- https://github.com/folke/todo-comments.nvim

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons_group("tag_level", true)

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
            NOTE = { icon = icons.Note, color = "#D9D9D9" },
            TODO = { icon = icons.Todo, color = "#D9D9D9" },
            PERF = { icon = icons.Pref, color = "#CCA700" },
            WARN = { icon = icons.Warn, color = "#CCA700" },
            ERROR = { icon = icons.Warn, color = "#F14C4C" },
            HACK = {
                icon = icons.Hack,
                color = "#DDB6F2",
                alt = { "DEP" },
            },
            FIX = {
                icon = icons.Fixme,
                color = "#DDB6F2",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            TEST = {
                icon = icons.Test,
                color = "#73C991",
                alt = { "TESTING", "PASSED", "FAILED" },
            },
        },
        gui_style = {
            fg = "NONE",
            bg = "NONE",
            gui = "NONE",
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
