local api = require("utils.api")
local public = require("utils.public")

local M = {
    filetype_match_rule = {
        c = "(.+%.c):(%d+):(%d+)",
        go = "(.+%.go):(%d+):(%d+)",
        cpp = "(.+%.cpp):(%d+):(%d+)",
        rust = " *%-*>? ?(.+.%rs):(%d+):(%d+)",
        python = '.*"(.+%.py)".*line (%d+).*',
        lua = "l?u?a?:? ?(.+%.lua):(%d+)",
    },
}

function M.gf_goto_err_file(term)
    api.map.register({
        mode = { "n" },
        lhs = "gf",
        rhs = function()
            for _, opts in ipairs(public.get_all_window_buffer_filetype()) do
                if vim.tbl_contains(vim.tbl_keys(M.filetype_match_rule), opts.buffer_filetype) then
                    local rule = M.filetype_match_rule[opts.buffer_filetype]
                    local line = vim.api.nvim_get_current_line()
                    local filepath, row, col = line:match(rule)
                    if filepath then
                        vim.cmd(":wincmd k")
                        vim.cmd("e " .. filepath)
                        vim.api.nvim_win_set_cursor(0, { tonumber(row or 0), tonumber(col or 0) })
                    else
                        vim.api.nvim_echo({ { "Can't goto err line", "WarningMsg" } }, false, {})
                    end
                    break
                end
            end
        end,
        options = { silent = true, buffer = term.bufnr },
        description = "quick go to err file",
    })
end

return M
