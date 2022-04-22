-- https://github.com/akinsho/toggleterm.nvim

local toggleterm = require("toggleterm")
local mapping = require("core.mapping")

toggleterm.setup(
    {
        start_in_insert = false,
        shade_terminals = true,
        shading_factor = 1,
        size = function(term)
            if term.direction == "horizontal" then
                return 8
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.25
            end
        end,
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)

-- new term
local terminal = require("toggleterm.terminal").Terminal

local function open_expand()
    -- enter insert mode
    vim.cmd("startinsert")
    -- unmap esc
    vim.keymap.del({"t"}, mapping.plugin.toggleterm.exit_insert)
end

local function close_expand()
    vim.keymap.set({"t"}, mapping.plugin.toggleterm.exit_insert, "<c-\\><c-n>", {noremap = true, silent = true})
end

-- create vertical term
local vertical_term =
    terminal:new(
    {
        direction = "vertical"
    }
)

-- create float term
local float_term =
    terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            open_expand()
            vim.keymap.set(
                {"t"},
                mapping.plugin.toggleterm.float_exit_insert,
                "<c-\\><c-n><cmd>close<cr>",
                {noremap = true, silent = true, buffer = term.bufnr}
            )
        end,
        on_close = close_expand
    }
)

-- create lazy git term
local lazy_git =
    terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            open_expand()
            -- q in lazygit is quit
            vim.keymap.set(
                {"i"},
                mapping.plugin.toggleterm.lazy_git_exit_insert,
                "<cmd>close<cr>",
                {noremap = true, silent = true, buffer = term.bufnr}
            )
        end,
        on_close = close_expand
    }
)

-- define new method
toggleterm.vertical_toggle = function()
    vertical_term:toggle()
end

toggleterm.float_toggle = function()
    float_term:toggle()
end

toggleterm.lazygit_toggle = function()
    lazy_git:toggle()
end

toggleterm.term_toggle = function()
    vim.cmd("exe v:count.'ToggleTerm'")
end

toggleterm.toggle_all_term = function()
    vim.cmd("ToggleTermToggleAll")
end
