-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local M = {
    requires = {
        "Comment",
        "ts_context_commentstring.integrations.comment_nvim",
    },
}

function M.before() end

function M.load()
    M.comment.setup({
        opleader = {
            line = "gc",
            block = "gb",
        },
        toggler = {
            line = "gcc",
            block = "gcb",
        },
        extra = {
            above = "gck",
            below = "gcj",
            eol = "gca",
        },
        pre_hook = M.ts_context_commentstring_integrations_comment_nvim.create_pre_hook(),
    })
end

function M.after() end

return M
