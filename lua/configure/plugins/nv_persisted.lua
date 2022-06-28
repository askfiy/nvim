-- https://github.com/olimorris/persisted.nvim

local api = require("utils.api")

local M = {
    safe_requires = {
        { "persisted" },
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.persisted.setup({
        save_dir = api.path.join(vim.fn.stdpath("cache"), "sessions"),
        use_git_branche = true,
        command = "VimLeavePre",
        autosave = true,
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
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
                vim.api.nvim_echo({ { "Session saved successfully", "MoreMsg" } }, true, {})
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
                    vim.api.nvim_echo({ { "Session deleted successfully", "MoreMsg" } }, true, {})
                else
                    vim.api.nvim_echo({ { "Session deleted failed", "ErrorMsg" } }, true, {})
                end
            end,
            options = { silent = true },
            description = "Delete session",
        },
    })
end

return M
