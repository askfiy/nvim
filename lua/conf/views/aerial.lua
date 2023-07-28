-- https://github.com/stevearc/aerial.nvim

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons_group("lsp_kind", false)

local M = {
    requires = {
        "aerial",
    },
}

function M.before() end

function M.load()
    M.aerial.setup({
        icons = icons,
        show_guides = true,
        backends = { "lsp", "treesitter", "markdown" },
        update_events = "TextChanged,InsertLeave",
        ---@diagnostic disable-next-line: unused-local
        on_attach = function(bufnr)
            M.register_key()
        end,
        layout = {
            min_width = 30,
            max_width = { 40, 0.2 },
        },
        lsp = {
            diagnostics_trigger_update = false,
            update_when_errors = true,
            update_delay = 300,
        },
        guides = {
            mid_item = "├─",
            last_item = "└─",
            nested_top = "│ ",
            whitespace = "  ",
        },
        filter_kind = {
            "Module",
            "Struct",
            "Interface",
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Method",
        },
    })
end
function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>2",
            rhs = "<cmd>AerialToggle! right<cr>",
            options = { silent = true },
            description = "Open Outilne Explorer",
        },
        {
            mode = { "n" },
            lhs = "{",
            rhs = "<cmd>AerialPrev<cr>",
            options = { silent = true },
            description = "Move Preview Aerial Node",
        },
        {
            mode = { "n" },
            lhs = "}",
            rhs = "<cmd>AerialNext<cr>",
            options = { silent = true },
            description = "Move Next Aerial Node",
        },
    })
end

return M
