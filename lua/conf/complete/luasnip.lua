-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/rafamadriz/friendly-snippets

local api = require("utils.api")
local options = require("core.options")

local M = {
    requires = {
        "luasnip",
        "luasnip.loaders",
        "luasnip.loaders.from_vscode",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.luasnip.setup({
        history = true,
        region_check_events = "InsertEnter",
        delete_check_events = "TextChanged,InsertLeave",
        update_events = "TextChanged,TextChangedI,InsertLeave",
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
    })

    M.luasnip_loaders_from_vscode.lazy_load({
        paths = {
            api.path.join(options.global_config_directory, "snippets"),
            api.path.join(options.storage_directory, "friendly-snippets"),
        },
    })
end

function M.after()
    M.luasnip.filetype_extend("javascript", { "typescript" })
    M.luasnip.filetype_extend("typescript", { "javascript" })
    M.luasnip.filetype_extend("vue", { "javascript", "typescript" })
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "i", "s" },
            lhs = "<tab>",
            rhs = function()
                return vim.api.nvim_eval("luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<tab>'")
            end,
            options = { silent = true, expr = true },
            description = "Jump to the next fragment placeholder",
        },
        {
            mode = { "i", "s" },
            lhs = "<s-tab>",
            rhs = function()
                return vim.api.nvim_eval("luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<s-tab>'")
            end,
            options = { silent = true, expr = true },
            description = "Jump to the prev fragment placeholder",
        },
    })
end

return M
