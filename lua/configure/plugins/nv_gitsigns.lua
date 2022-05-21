-- https://github.com/lewis6991/gitsigns.nvim

local mapping = require("core.mapping")

local M = {
    -- default add and change text: │
    add_symbol = "+",
    change_symbol = "~",
    delete_symbol = "-",
    topdelte_symbol = "‾",
    changedelete_symbol = "_",
}

function M.before() end

function M.load()
    local ok, m = pcall(require, "gitsigns")
    if not ok then
        return
    end

    M.gitsigns = m
    M.gitsigns.setup({
        on_attach = function(bufnr)
            M.register_buffer_key(bufnr)
        end,
        signs = {
            add = { hl = "GitSignsAdd", text = M.add_symbol, numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = {
                hl = "GitSignsChange",
                text = M.change_symbol,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            delete = {
                hl = "GitSignsDelete",
                text = M.delete_symbol,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            topdelete = {
                hl = "GitSignsDelete",
                text = M.topdelte_symbol,
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = M.changedelete_symbol,
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 100,
                ignore_whitespace = false,
            },
            preview_config = {
                -- Options passed to nvim_open_win
                border = "rounded",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        },
    })
end

function M.after() end

function M.register_buffer_key(bufnr)
    mapping.register({
        {
            mode = { "n" },
            lhs = "[c",
            rhs = "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'",
            options = { silent = true, expr = true, buffer = bufnr },
            description = "Jump to the prev hunk",
        },
        {
            mode = { "n" },
            lhs = "]c",
            rhs = "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'",
            options = { silent = true, expr = true, buffer = bufnr },
            description = "Jump to the next hunk",
        },
        {
            mode = { "n" },
            lhs = "<leader>gl",
            rhs = "<cmd>Gitsigns toggle_current_line_blame<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Toggle current line blame",
        },
        {
            mode = { "n" },
            lhs = "<leader>gh",
            rhs = "<cmd>lua require'gitsigns'.preview_hunk()<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Preview current hunk",
        },
        {
            mode = { "n" },
            lhs = "<leader>gH",
            rhs = "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Show current block blame",
        },
        {
            mode = { "n" },
            lhs = "<leader>gd",
            rhs = "<cmd>Gitsigns diffthis<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Open deff view",
        },
        {
            mode = { "n" },
            lhs = "<leader>gD",
            rhs = "<cmd>Gitsigns toggle_deleted<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Show deleted lines",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>gr",
            rhs = "<cmd>Gitsigns reset_hunk<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Reset current hunk",
        },
        {
            mode = { "n" },
            lhs = "<leader>gR",
            rhs = "<cmd>Gitsigns reset_buffer<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Reset current buffer",
        },
    })
end

return M
