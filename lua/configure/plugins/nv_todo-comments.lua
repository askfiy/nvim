-- https://github.com/folke/todo-comments.nvim

local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "todo-comments")
    if not ok then
        return
    end

    M.todo_comments = m
    M.todo_comments.setup({
        keywords = {
            -- alt = alias
            FIX = {
                icon = " ",
                color = "#DC2626",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            TODO = { icon = " ", color = "#10B981" },
            HACK = { icon = " ", color = "#7C3AED" },
            WARN = { icon = " ", color = "#FBBF24", alt = { "WARNING" } },
            NOTE = { icon = " ", color = "#2563EB", alt = { "INFO" } },
            PERF = { icon = " ", color = "#FC9868", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        },
    })
end

function M.after()
    -- FIX: Exception error for q:
    local hl = require("todo-comments.highlight")

    local highlight_win = hl.highlight_win
    hl.highlight_win = function(win, force)
        pcall(highlight_win, win, force)
    end
end

function M.register_global_key()
    mapping.register({
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
