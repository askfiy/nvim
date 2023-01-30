-- https://github.com/kevinhwang91/nvim-hlslens

local api = require("utils.api")

local M = {
    requires = {
        "hlslens",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.hlslens.setup({
        -- automatically clear search results
        calm_down = true,
        -- set to the nearest match to add a shot
        nearest_only = true,
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "n",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "n")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Skip to next search result",
        },
        {
            mode = { "n" },
            lhs = "N",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "N")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Jump to previous search result",
        },
        {
            mode = { "n" },
            lhs = "*",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "*")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Jump to the next word at the current cursor",
        },

        {
            mode = { "n" },
            lhs = "#",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "#")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Jump to the prev word at the current cursor",
        },
        {
            mode = { "n" },
            lhs = "g*",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "g*")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Jump to the next word at the current cursor (forbidden range)",
        },
        {
            mode = { "n" },
            lhs = "g#",
            rhs = function()
                pcall(vim.cmd, "normal! " .. vim.v.count1 .. "g#")
                require("hlslens").start()
            end,
            options = { silent = true },
            description = "Jump to the prev word at the current cursor (forbidden range)",
        },
    })
end

return M
