-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/tzachar/cmp-tabnine
-- https://github.com/kristijanhusak/vim-dadbod-completion

-- FIX: Manually install Tabnine when there is an error in Tabnine
--    TabNine is not executable
-- Requires curl
--    ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh

local mapping = require("core.mapping")

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup(
    ---@diagnostic disable-next-line: redundant-parameter
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = cmp.config.sources(
            {
                {name = "vsnip"},
                {name = "nvim_lsp"},
                {name = "path"},
                {name = "buffer"},
                {name = "cmdline"},
                {name = "cmp_tabnine"},
                {name = "vim-dadbod-completion"}
            }
        ),
        formatting = {
            format = lspkind.cmp_format(
                {
                    with_text = true,
                    maxwidth = 50,
                    before = function(entry, vim_item)
                        vim_item.menu = "<" .. string.upper(entry.source.name) .. ">"
                        return vim_item
                    end
                }
            )
        },
        mapping = {
            -- You can add {behavior u003d cmp.SelectBehavior.Select} to mimic vscode's behavior
            -- When checked, content will not be automatically inserted
            -- select_prev_item({behavior = cmp.SelectBehavior.Select})
            [mapping.plugin.nvim_cmp.confirm] = cmp.mapping.confirm(),
            [mapping.plugin.nvim_cmp.prev_item] = cmp.mapping.select_prev_item(),
            [mapping.plugin.nvim_cmp.next_item] = cmp.mapping.select_next_item(),
            [mapping.plugin.nvim_cmp.prev_scroll] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
            [mapping.plugin.nvim_cmp.next_scroll] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
            [mapping.plugin.nvim_cmp.next_item_or_confirm] = cmp.mapping(
                cmp.mapping.confirm({select = true}),
                {"i", "s", "c"}
            ),
            [mapping.plugin.nvim_cmp.prev_5_item] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        ---@diagnostic disable-next-line: unused-local
                        for i = 1, 5, 1 do
                            cmp.select_prev_item()
                        end
                    else
                        fallback()
                    end
                end,
                {"i", "s", "c"}
            ),
            [mapping.plugin.nvim_cmp.next_5_item] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        ---@diagnostic disable-next-line: unused-local
                        for i = 1, 5, 1 do
                            cmp.select_next_item()
                        end
                    else
                        fallback()
                    end
                end,
                {"i", "s", "c"}
            ),
            [mapping.plugin.nvim_cmp.toggle_complete] = cmp.mapping(
                {
                    i = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end,
                    c = function()
                        if cmp.visible() then
                            cmp.abort()
                        else
                            cmp.complete()
                        end
                    end
                }
            )
        },
        sorting = {
            priority_weight = 2,
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.sort_text,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.recently_used,
                cmp.config.compare.kind,
                cmp.config.compare.length,
                cmp.config.compare.order
            }
        }
    }
)

cmp.setup.cmdline(
    "/",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    "?",
    {
        sources = {
            {name = "buffer"}
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {name = "path"}
            },
            {
                {name = "cmdline"}
            }
        )
    }
)

-- enabled = function()
--     -- if vim.fn["vsnip#available"](1) == 1 or vim.b.visual_multi then
--     if vim.b.visual_multi then
--         return false
--     end
--     return true
-- end,
-- vim.api.nvim_create_autocmd(
--     {"TextChanged", "TextChangedI", "TextChangedP"},
--     {
--         pattern = {"*"},
--         callback = function()
--             if not cmp.visible() then
--                 if vim.fn["vsnip#available"](1) == 1 or vim.b.visual_multi then
--                     require("cmp.config").set_onetime(
--                         {
--                             completion = {
--                                 autocomplete = false
--                             }
--                         }
--                     )
--                     print(vim.inspect(require("cmp.config").set_onetime()))
--                 else
--                     require("cmp.config").set_onetime(
--                         {
--                             completion = {
--                                 autocomplete = true
--                             }
--                         }
--                     )
--                 end
--             else
--             end
--         end
--     }
-- )
