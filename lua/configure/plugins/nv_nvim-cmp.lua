-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
-- https://github.com/hrsh7th/cmp-vsnip
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/rafamadriz/friendly-snippets
-- https://github.com/tzachar/cmp-tabnine
-- https://github.com/kristijanhusak/vim-dadbod-completion

-- WARN: Manually install Tabnine when there is an error in Tabnine
--    TabNine is not executable
-- Requires curl and unzip
--    ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh

local icons = require("utils.icons")
local options = require("core.options")

local M = {
    -- Priority when sorting by kind (disabled by default)
    kind_priority = {
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
        ["Value"] = 1,
    },
}

function M.before() end

function M.load()
    local ok, m = pcall(require, "cmp")
    if not ok then
        return
    end

    M.cmp = m
    M.cmp.setup({
        -- Fragment plugin used
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        -- Define completion source
        sources = M.cmp.config.sources({
            { name = "vsnip" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "cmdline" },
            { name = "cmp_tabnine" },
            { name = "vim-dadbod-completion" },
        }),
        -- define the appearance of the completion menu
        window = {
            completion = M.cmp.config.window.bordered({
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            }),
            documentation = M.cmp.config.window.bordered({
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            }),
        },
        -- Define buttons
        -- • i: Valid in insert mode
        -- • s: Valid in select mode
        -- • c: Effective in command mode
        -- If you don't want to auto-complete when selecting, then fill in the following content in the item selection
        -- { behavior = M.cmp.SelectBehavior.Select }
        mapping = {
            ["<cr>"] = M.cmp.mapping(M.cmp.mapping.confirm(), { "i", "s", "c" }),
            ["<c-p>"] = M.cmp.mapping(M.cmp.mapping.select_prev_item(), { "i", "s", "c" }),
            ["<c-n>"] = M.cmp.mapping(M.cmp.mapping.select_next_item(), { "i", "s", "c" }),
            ["<c-b>"] = M.cmp.mapping(M.cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
            ["<c-f>"] = M.cmp.mapping(M.cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
            ["<tab>"] = M.cmp.mapping(M.cmp.mapping.confirm({ select = true }), { "i", "s", "c" }),
            ["<c-u>"] = M.cmp.mapping(function(fallback)
                if M.cmp.visible() then
                    for i = 1, 5, 1 do
                        M.cmp.select_prev_item({ behavior = M.cmp.SelectBehavior.Select })
                    end
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            ["<c-d>"] = M.cmp.mapping(function(fallback)
                if M.cmp.visible() then
                    for i = 1, 5, 1 do
                        M.cmp.select_next_item({ behavior = M.cmp.SelectBehavior.Select })
                    end
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            ["<c-k>"] = M.cmp.mapping(function()
                if M.cmp.visible() then
                    M.cmp.abort()
                else
                    M.cmp.complete()
                end
            end, { "i", "s", "c" }),
        },
        -- Define sorting rules
        sorting = {
            priority_weight = 2,
            comparators = {
                M.cmp.config.compare.length,
                M.cmp.config.compare.offset,
                M.cmp.under_compare,
                M.cmp.config.compare.exact,
                M.cmp.config.compare.scopes,
                M.cmp.config.compare.score,
                M.cmp.config.compare.recently_used,
                M.cmp.config.compare.locality,
                M.cmp.config.compare.kind,
                M.cmp.config.compare.sort_text,
                M.cmp.config.compare.order,
                -- M.kind_compare,
            },
        },
        -- Define the style of menu completion options
        formatting = {
            format = function(entry, vim_item)
                local kind = vim_item.kind
                local source = entry.source.name
                vim_item.kind = string.format("%s %s", icons[options.icons_style][kind], kind)
                vim_item.menu = string.format("<%s>", string.upper(source))
                return vim_item
            end,
        },
    })
end

function M.after()
    -- Define completion in cmd mode
    M.cmp.setup.cmdline("/", {
        sources = {
            { name = "buffer" },
        },
    })

    M.cmp.setup.cmdline("?", {
        sources = {
            { name = "buffer" },
        },
    })

    M.cmp.setup.cmdline(":", {
        sources = M.cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

function M.under_compare(entry1, entry2)
    -- Decrease priority if suggestion starts with _
    local _, entry1_under = entry1.completion_item.label:find("^_+")
    local _, entry2_under = entry2.completion_item.label:find("^_+")

    entry1_under = entry1_under or 0
    entry2_under = entry2_under or 0

    return entry1_under < entry2_under
end

function M.kind_compare(entry1, entry2)
    -- Sort by Kind priority (disabled by default)
    local entry1_kind = M.cmp.lsp.CompletionItemKind[entry1:get_kind()]
    local entry2_kind = M.cmp.lsp.CompletionItemKind[entry2:get_kind()]

    local kind_priority1 = M.kind_priority[entry1_kind] or 0
    local kind_priority2 = M.kind_priority[entry2_kind] or 0

    -- desc
    return kind_priority2 < kind_priority1
end

return M
