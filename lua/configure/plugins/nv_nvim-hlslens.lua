-- https://github.com/kevinhwang91/nvim-hlslens

local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "hlslens")
    if not ok then
        return
    end

    M.hlslens = m
    M.hlslens.setup({
        -- Automatically clear search results
        calm_down = true,
        -- Set to the nearest match to add a shot
        nearest_only = true,
    })
end

function M.after() end

function M.register_global_key()
    mapping.register({
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
