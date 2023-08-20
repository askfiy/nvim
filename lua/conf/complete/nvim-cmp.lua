-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/kristijanhusak/vim-dadbod-completion
-- https://github.com/tzachar/cmp-tabnine

-- WARN: manually install tabnine when there is an error in tabnine
--    TabNine is not executable
-- requires curl and unzip
--    ~/.local/share/nvim/store/cmp-tabnine/install.sh

local public = require("utils.public")
local options = require("core.options")
local aid_nvim_cmp = require("utils.aid.nvim-cmp")
local icons = public.get_icons_group("lsp_kind", false)

local M = {
    requires = {
        "cmp",
        "cmp.types",
        "luasnip",
    },
}

function M.before()
    -- complete the floating window settings of the menu
    M.complete_window_settings = {
        fixed = false,
        min_width = 15,
        max_width = 15,
    }
    -- whether to allow the following completion sources to have the same keywords as other completion sources
    M.duplicate_keywords = {
        -- allow duplicate keywords
        ["luasnip"] = 1,
        ["nvim_lsp"] = 1,
        -- do not allow duplicate keywords
        ["buffer"] = 0,
        ["path"] = 0,
        ["cmdline"] = 0,
        ["cmp_tabnine"] = 0,
        ["vim-dadbod-completion"] = 0,
    }
end

function M.load()
    -- send cmp to aid_cmp module
    aid_nvim_cmp.receive_cmp(M.cmp)

    M.cmp.setup({
        view = {
            -- "custom", "wildmenu" or "native"
            entries = "custom",
        },
        -- uncheck auto-select (gopls)
        preselect = M.cmp_types.cmp.PreselectMode.None,
        -- Insert or Replace
        confirmation = {
            default_behavior = M.cmp.ConfirmBehavior.Insert,
        },
        snippet = {
            expand = function(args)
                M.luasnip.lsp_expand(args.body)
            end,
        },
        -- define completion source
        sources = M.cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "cmp_tabnine" },
            { name = "vim-dadbod-completion" },
        }),
        -- define buttons
        -- • i: valid in insert mode
        -- • s: valid in select mode
        -- • c: valid in command mode
        -- if you don't want to auto-complete when selecting, then fill in the following content in the item selection
        -- { behavior = M.cmp.SelectBehavior.Select }
        mapping = {
            ["<cr>"] = aid_nvim_cmp.confirm(),
            ["<c-p>"] = aid_nvim_cmp.select_prev_item(),
            ["<c-n>"] = aid_nvim_cmp.select_next_item(),
            ["<c-b>"] = aid_nvim_cmp.scroll_docs(-5),
            ["<c-f>"] = aid_nvim_cmp.scroll_docs(5),
            ["<tab>"] = aid_nvim_cmp.confirm_select(),
            ["<c-u>"] = aid_nvim_cmp.select_prev_n_item(5),
            ["<c-d>"] = aid_nvim_cmp.select_next_n_item(5),
            ["<c-k>"] = aid_nvim_cmp.toggle_complete_menu(),
        },
        -- define sorting rules
        sorting = {
            priority_weight = 2,
            comparators = {
                M.cmp.config.compare.offset,
                M.cmp.config.compare.exact,
                -- M.cmp.config.compare.scopes,
                M.cmp.config.compare.score,
                M.cmp.config.compare.recently_used,
                M.cmp.config.compare.locality,
                M.cmp.config.compare.kind,
                -- M.cmp.config.compare.sort_text,
                M.cmp.config.compare.length,
                M.cmp.config.compare.order,
                -- M.cmp.config.compare.recently_used,
                -- M.cmp.config.compare.locality,
                -- aid_nvim_cmp.source_compare,
                -- aid_nvim_cmp.kind_compare,
            },
        },
        -- define the style of menu completion options
        formatting = {
            -- sort menu
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                local abbr = vim_item.abbr
                local kind = vim_item.kind
                local source = entry.source.name

                -- vim_item.kind = ("%s %s"):format(icons[kind], kind)
                -- vim_item.menu = ("<%s>"):format(source:upper())

                -- icon_prefix
                vim_item.kind = (" %s "):format(icons[kind] or icons["Default"])
                vim_item.menu = ("<%s>"):format(kind)

                vim_item.dup = M.duplicate_keywords[source] or 0

                -- determine if it is a fixed window size
                if
                    M.complete_window_settings.fixed
                    and vim.fn.mode() == "i"
                then
                    local min_width = M.complete_window_settings.min_width
                    local max_width = M.complete_window_settings.max_width
                    local truncated_abbr =
                        vim.fn.strcharpart(abbr, 0, max_width)

                    if truncated_abbr ~= abbr then
                        vim_item.abbr = ("%s %s"):format(truncated_abbr, "…")
                    elseif abbr:len() < min_width then
                        local padding = (" "):rep(min_width - abbr:len())
                        vim_item.abbr = ("%s %s"):format(abbr, padding)
                    end
                end

                return vim_item
            end,
        },
        -- define the appearance of the completion menu
        window = not options.float_border and {}
            or {
                completion = M.cmp.config.window.bordered({
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
                    -- menu position offset
                    col_offset = -4,
                    -- content offset
                    side_padding = 0,
                }),
                documentation = M.cmp.config.window.bordered({
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
                }),
            },
    })
end

function M.after()
    -- define completion in cmd mode
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
            { name = "cmdline" },
        }),
    })
end

return M
