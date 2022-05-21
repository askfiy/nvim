-- https://github.com/AckslD/nvim-neoclip.lua

local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "neoclip")
    if not ok then
        return
    end

    M.nvim_neoclip = m
    M.nvim_neoclip.setup({
        -- preview = false,
        -- content_spec_column = true,
        history = 1000,
        enable_persistent_history = true,
        continuous_sync = true,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        keys = {
            telescope = {
                i = {
                    select = "<nop>",
                    paste = "<cr>",
                    paste_behind = "<nop>",
                    replay = "<nop>",
                    delete = "<c-d>",
                    custom = {},
                },
                n = {
                    select = "<nop>",
                    paste = "<cr>",
                    paste_behind = "<nop>",
                    replay = "<nop>",
                    delete = "dd",
                    custom = {},
                },
            },
        },
        -- Filter blank lines
        filter = function(data)
            return not M.all(data.event.regcontents, M.is_whitespace)
        end,
    })
end

function M.after() end

function M.all(tbl, check)
    for _, entry in ipairs(tbl) do
        if not check(entry) then
            return false
        end
    end
    return true
end

function M.is_whitespace(line)
    return vim.fn.match(line, [[^\s*$]]) ~= -1
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>fy",
            rhs = function()
                require("telescope").extensions.neoclip.default()
            end,
            options = { silent = true },
            description = "Find Clipboard History",
        },
        {
            mode = { "n" },
            lhs = "<leader>cy",
            rhs = function()
                require("neoclip").clear_history()
            end,
            options = { silent = true },
            description = "Clear Clipboard History",
        },
    })
end

return M
