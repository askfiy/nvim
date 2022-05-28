-- https://github.com/akinsho/toggleterm.nvim

local mapping = require("core.mapping")

local M = {
    vertical_term = nil,
    floating_term = nil,
    lazygit_term = nil,
}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "toggleterm")
    if not ok then
        return
    end

    M.toggleterm = m
    M.terms = require("toggleterm.terminal").Terminal

    M.toggleterm.setup({
        start_in_insert = false,
        shade_terminals = true,
        shading_factor = 1,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.2
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.25
            end
        end,
        on_open = function()
            vim.wo.spell = false
        end,
        highlights = {
            Normal = {
                link = "Normal",
            },
            NormalFloat = {
                link = "NormalFloat",
            },
            FloatBorder = {
                link = "FloatBorder",
            },
        },
    })
end

function M.after()
    M.create_terminal()
    M.wrapper_command()
end

function M.create_terminal()
    -- create terminal
    M.vertical_term = M.terms:new({
        direction = "vertical",
    })

    M.floating_term = M.terms:new({
        hidden = true,
        count = 120,
        direction = "float",
        float_opts = {
            border = "double",
        },
        on_open = function(term)
            M.open_callback()
            vim.keymap.set({ "t" }, "<esc>", "<c-\\><c-n><cmd>close<cr>", { silent = true, buffer = term.bufnr })
        end,
        on_close = M.close_callback,
    })

    M.lazygit_term = M.terms:new({
        cmd = "lazygit",
        count = 130,
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double",
        },
        on_open = function(term)
            M.open_callback()
            vim.keymap.set({ "i" }, "q", "<cmd>close<cr>", { silent = true, buffer = term.bufnr })
        end,
        on_close = M.close_callback,
    })
end

function M.wrapper_command()
    -- define new method
    M.toggleterm.vertical_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.vertical_term:toggle()
    end

    M.toggleterm.float_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.floating_term:toggle()
    end

    M.toggleterm.lazygit_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.lazygit_term:toggle()
    end

    M.toggleterm.term_toggle = function()
        vim.cmd("exe v:count1.'ToggleTerm'")
    end

    M.toggleterm.toggle_all_term = function()
        vim.cmd("ToggleTermToggleAll")
    end
end

function M.open_callback()
    -- enter insert mode
    vim.cmd("startinsert")
    -- unmap esc
    vim.keymap.del({ "t" }, "<esc>")
end

function M.close_callback()
    vim.keymap.set({ "t" }, "<esc>", "<c-\\><c-n>", { silent = true })
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>tt",
            rhs = function()
                require("toggleterm").term_toggle()
            end,
            options = { silent = true },
            description = "Toggle bottom or vertical terminal",
        },
        {
            mode = { "n" },
            lhs = "<leader>tf",
            rhs = function()
                require("toggleterm").float_toggle()
            end,

            options = { silent = true },
            description = "Toggle floating terminal",
        },
        {
            mode = { "n" },
            lhs = "<leader>tv",
            rhs = function()
                require("toggleterm").vertical_toggle()
            end,
            options = { silent = true },
            description = "Toggle vertical terminal",
        },
        {
            mode = { "n" },
            lhs = "<leader>tg",
            rhs = function()
                require("toggleterm").lazygit_toggle()
            end,
            options = { silent = true },
            description = "Toggle lazygit terminal",
        },
        {
            mode = { "n" },
            lhs = "<leader>ta",
            rhs = function()
                require("toggleterm").toggle_all_term()
            end,
            options = { silent = true },
            description = "Toggle all terminal",
        },
    })
end

return M
