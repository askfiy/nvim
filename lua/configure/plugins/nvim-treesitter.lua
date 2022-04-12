-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

local mapping = require("core.mapping")

require("nvim-treesitter.configs").setup(
    {
        -- installed highlight support sources
        ensure_installed = "all",
        -- synchronous download highlighting support
        sync_install = false,
        -- highlight related
        highlight = {
            enable = true,
            -- disable built-in regex highlighting
            additional_vim_regex_highlighting = false
        },
        -- incremental selection
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = mapping.plugin.nvim_treesitter.init_selection,
                node_incremental = mapping.plugin.nvim_treesitter.node_incremental,
                node_decremental = mapping.plugin.nvim_treesitter.node_decremental,
                scope_incremental = mapping.plugin.nvim_treesitter.scope_incremental
            }
        },
        -- indent have bug in python
        indent = {
            enable = false
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true
        }
    }
)

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
