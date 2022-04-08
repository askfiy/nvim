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

local lspkind_comparator = function(conf)
    local lsp_types = require("cmp.types").lsp

    return function(entry1, entry2)
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0

        if priority1 == priority2 then
            return nil
        end
        return priority2 < priority1
    end
end

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label < entry2.completion_item.label
end

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
                lspkind_comparator(
                    {
                        kind_priority = {
                            Snippet = 25,
                            Keyword = 24,
                            Variable = 23,
                            Text = 22,
                            Module = 21,
                            Class = 20,
                            Function = 19,
                            Field = 18,
                            Method = 17,
                            Property = 16,
                            Constant = 15,
                            Enum = 14,
                            EnumMember = 13,
                            Event = 12,
                            Operator = 11,
                            Reference = 10,
                            Struct = 9,
                            File = 8,
                            Folder = 7,
                            Color = 6,
                            Constructor = 5,
                            Interface = 4,
                            TypeParameter = 3,
                            Unit = 2,
                            Value = 1
                        }
                    }
                ),
                label_comparator
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
