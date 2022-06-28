return {

    -- Notice! Changes to lazy loading may cause plugins to behave unexpectedly

    ["wbthomason/packer.nvim"] = {},

    ["rcarriga/nvim-notify"] = {},

    ["kyazdani42/nvim-web-devicons"] = {
        module = "nvim-web-devicons",
    },

    ["nvim-lua/plenary.nvim"] = {
        module = "plenary",
    },

    ["askfiy/catppuccin"] = {},

    ["windwp/nvim-autopairs"] = {
        event = { "InsertEnter" },
    },

    ["lewis6991/gitsigns.nvim"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["kyazdani42/nvim-tree.lua"] = {
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    },

    ["mbbill/undotree"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["folke/which-key.nvim"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["akinsho/bufferline.nvim"] = {
        after = { "nvim-web-devicons" },
        events = { "BufNewFile", "BufRead", "TabEnter" },
    },

    ["nvim-lualine/lualine.nvim"] = {
        after = { "nvim-web-devicons" },
    },

    ["nvim-telescope/telescope.nvim"] = {
        after = { "plenary.nvim" },
        module = { "telescope" },
    },

    ["phaazon/hop.nvim"] = {
        cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
    },

    ["neovim/nvim-lspconfig"] = {},

    ["stevearc/aerial.nvim"] = {
        after = { "nvim-lspconfig" },
    },

    ["SmiteshP/nvim-navic"] = {
        after = { "nvim-lspconfig" },
    },

    ["folke/lua-dev.nvim"] = {
        after = { "nvim-lspconfig" },
    },

    ["williamboman/nvim-lsp-installer"] = {
        after = { "aerial.nvim", "lua-dev.nvim", "nvim-navic" },
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = { "nvim-lsp-installer" },
    },

    ["j-hui/fidget.nvim"] = {
        after = { "nvim-lsp-installer" },
    },

    ["kosayoda/nvim-lightbulb"] = {
        after = { "nvim-lsp-installer" },
    },

    ["rafamadriz/friendly-snippets"] = {
        event = { "InsertEnter", "CmdlineEnter" },
    },

    ["hrsh7th/vim-vsnip"] = {
        after = { "friendly-snippets" },
    },

    ["github/copilot.vim"] = {
        -- FIX: https://github.com/mfussenegger/nvim-dap/issues/562
        ft = { "dap-repl" },
        event = { "InsertEnter" },
    },

    ["hrsh7th/nvim-cmp"] = {
        after = { "vim-vsnip" },
    },

    ["hrsh7th/cmp-vsnip"] = {
        after = { "nvim-cmp" },
    },

    ["hrsh7th/cmp-nvim-lsp"] = {
        after = { "nvim-cmp" },
    },

    ["hrsh7th/cmp-buffer"] = {
        after = { "nvim-cmp" },
    },

    ["hrsh7th/cmp-path"] = {
        after = { "nvim-cmp" },
    },

    ["hrsh7th/cmp-cmdline"] = {
        after = { "nvim-cmp" },
    },

    ["kristijanhusak/vim-dadbod-completion"] = {
        after = { "nvim-cmp" },
    },

    ["tzachar/cmp-tabnine"] = {
        run = "./install.sh",
        after = { "nvim-cmp" },
    },

    -- dap

    ["mfussenegger/nvim-dap"] = {
        module = "dap",
    },

    ["theHamsta/nvim-dap-virtual-text"] = {
        after = { "nvim-dap" },
    },

    ["rcarriga/nvim-dap-ui"] = {
        after = { "nvim-dap" },
    },

    -- database

    ["tpope/vim-dadbod"] = {
        fn = { "db#resolve" },
    },
    ["kristijanhusak/vim-dadbod-ui"] = {
        cmd = "DBUIToggle",
    },

    -- editor

    ["norcalli/nvim-colorizer.lua"] = {},

    ["RRethy/vim-illuminate"] = {
        event = { "BufRead", "BufNewFile" },
    },

    -- treesitter

    ["nvim-treesitter/nvim-treesitter"] = {
        module = "nvim-treesitter",
        run = ":TSUpdate",
    },

    ["lukas-reineke/indent-blankline.nvim"] = {
        after = { "nvim-treesitter" },
    },

    ["p00f/nvim-ts-rainbow"] = {
        after = { "nvim-treesitter" },
    },

    ["lewis6991/spellsitter.nvim"] = {
        after = { "nvim-treesitter" },
    },

    ["windwp/nvim-ts-autotag"] = {
        after = { "nvim-treesitter" },
    },

    ["JoosepAlviste/nvim-ts-context-commentstring"] = {
        after = { "nvim-treesitter" },
    },

    ["numToStr/Comment.nvim"] = {
        keys = { "gb", "gc" },
        module = { "Comment" },
        after = { "nvim-ts-context-commentstring" },
    },

    ["tpope/vim-repeat"] = {
        fn = "repeat#set",
    },

    ["ur4ltz/surround.nvim"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["folke/todo-comments.nvim"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["AndrewRadev/switch.vim"] = {},

    ["Vimjas/vim-python-pep8-indent"] = {
        ft = "py",
        event = { "InsertEnter" },
    },

    -- fzf
    ["tami5/sqlite.lua"] = {},

    ["AckslD/nvim-neoclip.lua"] = {
        after = { "sqlite.lua" },
    },

    ["nvim-pack/nvim-spectre"] = {
        module = "spectre",
    },

    ["kevinhwang91/nvim-hlslens"] = {
        module = "hlslens",
    },

    ["davidgranstrom/nvim-markdown-preview"] = {
        ft = { "markdown" },
        cmd = { "MarkdownPreview" },
    },
    ["askfiy/nvim-picgo"] = {
        module = "nvim-picgo",
    },

    ["mg979/vim-visual-multi"] = {
        fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
        keys = { "<c-n>" },
    },

    ["jbyuki/venn.nvim"] = {
        module = "venn",
    },

    ["kristijanhusak/vim-carbon-now-sh"] = {
        cmd = { "CarbonNowSh" },
    },

    ["olimorris/persisted.nvim"] = {},

    ["dstein64/nvim-scrollview"] = {
        event = { "BufRead", "BufNewFile" },
    },

    ["uga-rosa/translate.nvim"] = {
        cmd = { "Translate" },
    },

    ["akinsho/toggleterm.nvim"] = {
        module = "toggleterm",
    },

    ["jghauser/mkdir.nvim"] = {
        event = "CmdlineEnter",
    },

    ["dstein64/vim-startuptime"] = {
        cmd = { "StartupTime" },
    },
}
