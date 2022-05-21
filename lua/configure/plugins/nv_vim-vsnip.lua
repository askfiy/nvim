-- https://github.com/L3MON4D3/LuaSnip

local options = require("core.options")
local mapping = require("core.mapping")

local M = {}

function M.entrance()
    M.register_global_key()
    vim.g.vsnip_snippet_dir = options.code_snippets_directory
    vim.g.vsnip_filetypes = {
        javascript = { "typescript" },
        typescript = { "javascript" },
        vue = { "javascript", "typescript" },
    }
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "i", "s" },
            lhs = "<tab>",
            rhs = "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'",
            options = { silent = true, expr = true },
            description = "Jump to the next fragment placeholder",
        },
        {
            mode = { "i", "s" },
            lhs = "<s-tab>",
            rhs = "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'",
            options = { silent = true, expr = true },
            description = "Jump to the prev fragment placeholder",
        },
    })
end

return M
