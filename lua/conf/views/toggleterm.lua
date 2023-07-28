-- https://github.com/akinsho/toggleterm.nvim

local api = require("utils.api")
local public = require("utils.public")
local options = require("core.options")
local aid_toggleterm = require("utils.aid.toggleterm")

local M = {
    requires = {
        "toggleterm",
    },
}

M.terminals = {
    vert = nil,
    float = nil,
    lazygit = nil,
}

function M.before()
    M.register_key()
end

function M.load()
    M.terms = require("toggleterm.terminal").Terminal

    M.toggleterm.setup({
        start_in_insert = false,
        shade_terminals = true,
        shading_factor = 1,
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.25
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.25
            end
        end,
        on_open = function(term)
            vim.wo.spell = false

            api.map.register({
                mode = { "t" },
                lhs = "<esc>",
                rhs = "<c-\\><c-n>",
                options = { silent = true, buffer = term.bufnr },
                description = "Escape terminal insert mode",
            })

            aid_toggleterm.gf_goto_err_file(term)
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
    M.terminals.vert = M.terms:new({
        direction = "vertical",
    })

    M.terminals.float = M.terms:new({
        hidden = true,
        count = 120,
        direction = "float",
        float_opts = {
            border = options.float_border and "double" or "none",
        },
        on_open = function(term)
            M.open_callback()
            api.map.register({
                mode = { "t" },
                lhs = "<esc>",
                rhs = "<c-\\><c-n><cmd>close<cr>",
                options = { silent = true, buffer = term.bufnr },
                description = "Escape float terminal",
            })
        end,
    })

    M.terminals.lazygit = M.terms:new({
        cmd = "lazygit",
        count = 130,
        hidden = true,
        direction = "float",
        float_opts = {
            border = options.float_border and "double" or "none",
        },
        on_open = function(term)
            M.open_callback()
            api.map.register({
                mode = { "i" },
                lhs = "q",
                rhs = "<cmd>close<cr>",
                options = { silent = true, buffer = term.bufnr },
                description = "Escape lazygit terminal",
            })
        end,
    })
end

function M.wrapper_command()
    -- define new method
    M.toggleterm.vertical_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.terminals.vert:toggle()
    end

    M.toggleterm.float_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.terminals.float:toggle()
    end

    M.toggleterm.lazygit_toggle = function()
        ---@diagnostic disable-next-line: missing-parameter
        M.terminals.lazygit:toggle()
    end

    M.toggleterm.term_toggle = function()
        -- FIX: https://github.com/akinsho/toggleterm.nvim/issues/97#issuecomment-1160323635
        local count = vim.api.nvim_eval("v:count1")
        public.terminal_offset_run_command(("exe %d.'ToggleTerm'"):format(count))
    end

    M.toggleterm.toggle_all_term = function()
        public.terminal_offset_run_command("ToggleTermToggleAll")
    end
end

function M.open_callback()
    vim.cmd("startinsert")
    -- api.map.unregister({ "t" }, "<esc>")
end

function M.register_key()
    api.map.bulk_register({
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
