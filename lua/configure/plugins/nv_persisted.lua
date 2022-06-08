-- https://github.com/olimorris/persisted.nvim

local path = require("utils.api.path")
local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "persisted")
    if not ok then
        return
    end

    M.persisted = m
    M.persisted.setup({
        save_dir = path.join(vim.fn.stdpath("cache"), "sessions"),
        use_git_branche = true,
        command = "VimLeavePre",
        autosave = true,
    })
end

function M.after() end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>sl",
            rhs = "<cmd>silent! SessionLoad<cr>",
            options = { silent = true },
            description = "Load session",
        },
        {
            mode = { "n" },
            lhs = "<leader>ss",
            rhs = function()
                vim.cmd("silent! SessionSave")
                print("Session saved successfully")
            end,
            options = { silent = true },
            description = "Save session",
        },
        {
            mode = { "n" },
            lhs = "<leader>sd",
            rhs = function()
                local ok, _ = pcall(vim.cmd, "SessionDelete")
                if ok then
                    print("Session deleted successfully")
                else
                    print("Session deleted failed, file has been deleted")
                end
            end,
            options = { silent = true },
            description = "Delete session",
        },
    })
end

return M
