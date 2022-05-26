vim.g.mapleader = " "

local mapping = {}

mapping.register = function(group_keymap)
    for _, key_map in pairs(group_keymap) do
        key_map.options.desc = key_map.description
        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
    end
end

mapping.register({
    {
        mode = { "n" },
        lhs = "<leader><esc>",
        rhs = ":qa!<cr>",
        options = { silent = true },
        description = "Escape Neovim",
    },
    {
        mode = { "i" },
        lhs = "jj",
        rhs = "<esc>",
        options = { silent = true },
        description = "Escape editor insert mode",
    },
    {
        mode = { "t" },
        lhs = "<esc>",
        rhs = "<c-\\><c-n>",
        options = { silent = true },
        description = "Escape terminal insert mode",
    },
    {
        mode = { "n" },
        lhs = "<esc>",
        rhs = ":noh<cr>",
        options = { silent = true },
        description = "Clear search highlight",
    },
    {
        mode = { "n" },
        lhs = "<c-u>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k")
        end,
        options = { silent = true },
        description = "Move 1/4 screen up",
    },
    {
        mode = { "n" },
        lhs = "<c-d>",
        rhs = function()
            vim.cmd("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j")
        end,
        options = { silent = true },
        description = "Move 1/4 screen down",
    },
    {
        mode = { "n" },
        lhs = "<m-k>",
        rhs = "<c-w>-",
        options = { silent = true },
        description = "Reduce horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-j>",
        rhs = "<c-w>+",
        options = { silent = true },
        description = "Increase horizontal split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-h>",
        rhs = "<c-w><",
        options = { silent = true },
        description = "Reduce vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<m-l>",
        rhs = "<c-w>>",
        options = { silent = true },
        description = "Increase vertical split screen size",
    },
    {
        mode = { "n" },
        lhs = "<leader>cs",
        rhs = ":set spell!<cr>",
        options = { silent = true },
        description = "Enable or disable spell checking",
    },
    {
        mode = { "c" },
        lhs = "<m-p>",
        rhs = "<up>",
        options = {},
        description = "Look up history",
    },
    {
        mode = { "c" },
        lhs = "<m-n>",
        rhs = "<down>",
        options = {},
        description = "Look down history",
    },
    {
        mode = { "n", "v" },
        lhs = "k",
        rhs = function()
            return vim.v.count > 0 and "k" or "gk"
        end,
        options = { silent = true, expr = true },
        description = "Move up one line",
    },
    {
        mode = { "n", "v" },
        lhs = "j",
        rhs = function()
            return vim.v.count > 0 and "j" or "gj"
        end,
        options = { silent = true, expr = true },
        description = "Move down one line",
    },
    {
        mode = { "n", "v" },
        lhs = "H",
        rhs = function()
            return vim.v.count > 0 and "^" or "g^"
        end,
        options = { silent = true, expr = true },
        description = "Move to the first character at the beginning of the line",
    },
    {
        mode = { "n", "v" },
        lhs = "L",
        rhs = function()
            return vim.v.count > 0 and "$" or "g$"
        end,
        options = { silent = true, expr = true },
        description = "Move to the last character at the end of the line",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-w>",
        rhs = "<c-right>",
        options = {},
        description = "Jump to next word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-b>",
        rhs = "<c-left>",
        options = {},
        description = "Jump to previous word in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-k>",
        rhs = "<up>",
        options = {},
        description = "Move cursor up in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-j>",
        rhs = "<down>",
        options = {},
        description = "Move cursor down in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-h>",
        rhs = "<left>",
        options = {},
        description = "Move cursor left in insert mode",
    },
    {
        mode = { "i", "c", "t" },
        lhs = "<m-l>",
        rhs = "<right>",
        options = {},
        description = "Move cursor right in insert mode",
    },
})

return mapping
