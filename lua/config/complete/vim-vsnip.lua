-- https://github.com/hrsh7th/vim-vsnip

local api = require("utils.api")
local options = require("core.options")

local M = {}

M._viml = true

function M.before()
    M.register_key()
end

function M.load()
    vim.g.vsnip_snippet_dir = options.snippets_directory
    vim.g.vsnip_filetypes = {
        javascript = { "typescript" },
        typescript = { "javascript" },
        vue = { "javascript", "typescript" },
    }
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
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
            -- TODO: Mapping modification
            rhs = function()
                return vim.fn["vsnip#jumpable"](-1) and "<Plug>(vsnip-jump-prev)" or "<s-tab>"
            end,
            options = { silent = true, expr = true },
            description = "Jump to the prev fragment placeholder",
        },
    })
end

return M
