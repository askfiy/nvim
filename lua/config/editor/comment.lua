-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local M = {
    requires = {
        "Comment",
        "Comment.utils",
        "ts_context_commentstring.utils",
        "ts_context_commentstring.internal",
    },
    valid_filtype = {
        "typescriptreact",
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
        pre_hook = function(ctx)
            -- FIX: Lua does not distinguish between line and block comments
            if vim.tbl_contains(M.valid_filtype, vim.bo.filetype) then
                -- Determine whether to use linewise or blockwise commentstring
                local type = ctx.ctype == M.comment_utils.ctype.linewise and "__default" or "__multiline"

                -- Determine the location where to calculate commentstring from
                local location = nil
                if ctx.cTSConstructortype == M.comment_utils.ctype.blockwise then
                    location = M.ts_context_commentstring_utils.get_cursor_location()
                elseif ctx.cmotion == M.comment_utils.cmotion.v or ctx.cmotion == M.comment_utils.cmotion.V then
                    location = M.ts_context_commentstring_utils.get_visual_start_location()
                end

                return M.ts_context_commentstring_internal.calculate_commentstring({
                    key = type,
                    location = location,
                })
            end
        end,
    })
end

function M.after() end

return M
