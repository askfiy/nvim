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
-- Requires curl and unzip
--    ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh

local mapping = require("core.mapping")

local lspkind = require("lspkind")

local cmp = require("cmp")

local kind_priority = {
    ["Snippet"] = 25,
    ["Module"] = 24,
    ["Keyword"] = 23,
    ["Variable"] = 22,
    ["Text"] = 21,
    ["Class"] = 20,
    ["Function"] = 19,
    ["Field"] = 18,
    ["Method"] = 17,
    ["Property"] = 16,
    ["Constant"] = 15,
    ["Enum"] = 14,
    ["EnumMember"] = 13,
    ["Event"] = 12,
    ["Operator"] = 11,
    ["Reference"] = 10,
    ["Struct"] = 9,
    ["File"] = 8,
    ["Folder"] = 7,
    ["Color"] = 6,
    ["Constructor"] = 5,
    ["Interface"] = 4,
    ["TypeParameter"] = 3,
    ["Unit"] = 2,
    ["Value"] = 1
}

---@diagnostic disable-next-line: unused-local
local kind_compare = function(entry1, entry2)
    local entry1_kind = cmp.lsp.CompletionItemKind[entry1:get_kind()]
    local entry2_kind = cmp.lsp.CompletionItemKind[entry2:get_kind()]

    local kind_priority1 = kind_priority[entry1_kind] or 0
    local kind_priority2 = kind_priority[entry2_kind] or 0

    -- desc
    return kind_priority2 < kind_priority1
end

local under_compare = function(entry1, entry2)
    local _, entry1_under = entry1.completion_item.label:find "^_+"
    local _, entry2_under = entry2.completion_item.label:find "^_+"
    entry1_under = entry1_under or 0
    entry2_under = entry2_under or 0
    -- _ completions at the beginning come later
    return entry1_under < entry2_under
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
            [mapping.plugin.nvim_cmp.confirm] = cmp.mapping(cmp.mapping.confirm(), {"i", "s", "c"}),
            [mapping.plugin.nvim_cmp.prev_item] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "s", "c"}),
            [mapping.plugin.nvim_cmp.next_item] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "s", "c"}),
            [mapping.plugin.nvim_cmp.prev_scroll] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "s", "c"}),
            [mapping.plugin.nvim_cmp.next_scroll] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "s", "c"}),
            [mapping.plugin.nvim_cmp.next_item_or_confirm] = cmp.mapping(
                cmp.mapping.confirm({select = true}),
                {"i", "s", "c"}
            ),
            [mapping.plugin.nvim_cmp.prev_5_item] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        ---@diagnostic disable-next-line: unused-local
                        for i = 1, 5, 1 do
                            cmp.select_prev_item({behavior = cmp.SelectBehavior.Select})
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
                            cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                        end
                    else
                        fallback()
                    end
                end,
                {"i", "s", "c"}
            ),
            [mapping.plugin.nvim_cmp.toggle_complete] = cmp.mapping(
                function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end,
                {"i", "s", "c"}
            )
        },
        sorting = {
            priority_weight = 2,
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                cmp.config.compare.length,
                under_compare,
                cmp.config.compare.recently_used,
                cmp.config.compare.locality,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.order
                -- kind_compare
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

vim.api.nvim_create_autocmd(
    {"TextChangedI"},
    {
        pattern = {"*"},
        callback = function()
            local cmp_config = require("cmp.config")
            if vim.fn["vsnip#available"](-1) == 1 or vim.fn["vsnip#available"](1) == 1 or vim.b.visual_multi then
                cmp_config.global.completion.autocomplete = false
            else
                cmp_config.global.completion.autocomplete = {"TextChanged"}
            end
        end
    }
)
