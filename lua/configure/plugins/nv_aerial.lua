-- https://github.com/stevearc/aerial.nvim

local icons = require("utils.icons")
local options = require("core.options")
local mapping = require("core.mapping")

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "aerial")
    if not ok then
        return
    end

    M.aerial = m
    M.aerial.setup({
        -- Minimum width
        min_width = 30,
        -- Backend for rendering symbols
        backends = { "lsp", "treesitter", "markdown" },
        -- If set to False, show all icons, otherwise show already
        -- Defined icon
        -- filter_kind = false,
        filter_kind = {
            "Module",
            "Struct",
            "Interface",
            "Class",
            "Constructor",
            "Enum",
            "Function",
            "Method",
            -- customize
            "Property",
        },
        -- Icon to use
        icons = icons[options.icons_style],
        -- Show box drawing characters for the tree hierarchy
        show_guides = true,
        -- Event to update symbol tree
        update_events = "TextChanged,InsertLeave",
        -- Bind keys
        on_attach = function(bufnr)
            M.register_buffer_key(bufnr)
        end,
        -- Customize the characters used when show_guides = true
        guides = {
            -- When the child item has a sibling below it
            mid_item = "├─",
            -- When the child item is the last in the list
            last_item = "└─",
            -- When there are nested child guides to the right
            nested_top = "│ ",
            -- Raw indentation
            whitespace = "  ",
        },
        lsp = {
            -- Fetch document symbols when LSP diagnostics update.
            -- If false, will update on buffer changes.
            diagnostics_trigger_update = false,
            -- Set to false to not update the symbols when there are LSP errors
            update_when_errors = true,
            -- How long to wait (in ms) after a buffer change before updating
            -- Only used when diagnostics_trigger_update = false
            update_delay = 300,
        },
    })
end

function M.after() end

function M.register_buffer_key(bufnr)
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>2",
            rhs = "<cmd>AerialToggle! right<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Open Outilne Explorer",
        },
        {

            mode = { "n" },
            lhs = "{",
            rhs = "<cmd>AerialPrev<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Move item up",
        },
        {

            mode = { "n" },
            lhs = "}",
            rhs = "<cmd>AerialNext<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Move item down",
        },
        {

            mode = { "n" },
            lhs = "[[",
            rhs = "<cmd>AerialPrevUp<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Move up one level",
        },
        {

            mode = { "n" },
            lhs = "]]",
            rhs = "<cmd>AerialNextUp<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Move down one level",
        },
    })
end

return M
