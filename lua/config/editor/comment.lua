-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local M = {
    requires = {
        "Comment",
        "Comment.utils",
    },
}

function M.before() end

function M.load()
    M.comment.setup({
        toggler = {
            line = "gcc",
            block = "gcb",
        },
        opleader = {
            line = "gc",
            block = "gb",
        },
        extra = {
            above = "gck",
            below = "gcj",
            eol = "gca",
        },
        pre_hook = function(ctx)
            -- FIX: Lua does not distinguish between line and block comments
            -- Caused by nvim-ts-context-commentstring
            if vim.bo.filetype == "lua" then
                return
            end

            local location = nil
            if ctx.ctype == M.comment_utils.ctype.block then
                location = require("ts_context_commentstring.utils").get_cursor_location()
            elseif ctx.cmotion == M.comment_utils.cmotion.v or ctx.cmotion == M.comment_utils.cmotion.V then
                location = require("ts_context_commentstring.utils").get_visual_start_location()
            end

            return require("ts_context_commentstring.internal").calculate_commentstring({
                key = ctx.ctype == M.comment_utils.ctype.line and "__default" or "__multiline",
                location = location,
            })
        end,
    })
end

function M.after() end

return M
