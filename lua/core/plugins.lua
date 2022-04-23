local api = require("utils.api")
local notices = require("utils.notices")

local packer_install_plugins = {
    -------------
    --- basic ---
    -------------
    ["wbthomason/packer.nvim"] = {
        load_file = false,
        disable = false
    },
    ["lewis6991/impatient.nvim"] = {
        load_file = true,
        disable = false
    },
    ["nathom/filetype.nvim"] = {
        load_file = false,
        disable = false
    },
    ["github/copilot.vim"] = {
        load_file = true,
        disable = false
    },
    ["kyazdani42/nvim-web-devicons"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"}
    },
    ["onsails/lspkind-nvim"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"}
    },
    ["rcarriga/nvim-notify"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"}
    },
    ["ray-x/lsp_signature.nvim"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"}
    },
    ["yianwillis/vimcdoc"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["nvim-lua/plenary.nvim"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["BurntSushi/ripgrep"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["sharkdp/fd"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["petertriho/nvim-scrollbar"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"}
    },
    -------------
    --- theme ---
    -------------
    ["catppuccin/nvim"] = {
        as = "catppuccin",
        load_file = true,
        disable = false,
        after = {"nvim-scrollbar"}
    },
    ["Mofiqul/vscode.nvim"] = {
        load_file = true,
        disable = true,
        after = {"nvim-scrollbar"}
    },
    ["RRethy/vim-illuminate"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["p00f/nvim-ts-rainbow"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["nvim-treesitter/nvim-treesitter"] = {
        load_file = true,
        disable = false,
        run = ":TSUpdate",
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["SmiteshP/nvim-gps"] = {
        load_file = false,
        disable = false,
        after = {"nvim-treesitter"}
    },
    ["lewis6991/gitsigns.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-treesitter", "plenary.nvim"}
    },
    ["nvim-lualine/lualine.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-web-devicons", "nvim-gps", "gitsigns.nvim"}
    },
    -------------
    ---- lsp ----
    -------------
    ["neovim/nvim-lspconfig"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"},
        event = {"BufRead", "BufNewFile"}
    },
    ["stevearc/aerial.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-lspconfig", "nvim-web-devicons", "lspkind-nvim"}
    },
    ["hrsh7th/cmp-nvim-lsp"] = {
        load_file = false,
        disable = false,
        after = {"nvim-lspconfig", "nvim-web-devicons"}
    },
    ["williamboman/nvim-lsp-installer"] = {
        load_file = true,
        disable = false,
        after = {"cmp-nvim-lsp", "aerial.nvim"}
    },
    ["j-hui/fidget.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-lsp-installer"}
    },
    ["tami5/lspsaga.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-lsp-installer"}
    },
    ["mfussenegger/nvim-lint"] = {
        load_file = true,
        disable = true,
        after = {"nvim-lsp-installer"}
    },
    ["kosayoda/nvim-lightbulb"] = {
        load_file = true,
        disable = false,
        after = {"nvim-lsp-installer"}
    },
    -------------
    -- complete -
    -------------
    ["askfiy/friendly-snippets"] = {
        load_file = false,
        disable = false,
        event = {"InsertEnter", "CmdlineEnter"},
        after = {"impatient.nvim"}
    },
    ["hrsh7th/vim-vsnip"] = {
        load_file = false,
        disable = false,
        after = {"friendly-snippets"}
    },
    ["hrsh7th/nvim-cmp"] = {
        load_file = true,
        disable = false,
        after = {"lspkind-nvim", "vim-vsnip"}
    },
    ["hrsh7th/cmp-vsnip"] = {
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    ["hrsh7th/cmp-path"] = {
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    ["hrsh7th/cmp-buffer"] = {
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    ["hrsh7th/cmp-cmdline"] = {
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    ["kristijanhusak/vim-dadbod-completion"] = {
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    ["tzachar/cmp-tabnine"] = {
        run = "./install.sh",
        load_file = false,
        disable = false,
        after = {"nvim-cmp"}
    },
    -------------
    ---- dap ----
    -------------
    ["mfussenegger/nvim-dap"] = {
        load_file = true,
        disable = false,
        module = "dap",
        after = {"impatient.nvim"}
    },
    ["theHamsta/nvim-dap-virtual-text"] = {
        load_file = true,
        disable = false,
        after = {"nvim-dap"}
    },
    ["rcarriga/nvim-dap-ui"] = {
        load_file = true,
        disable = false,
        after = {"nvim-dap"}
    },
    -------------
    --- code ----
    -------------
    ["norcalli/nvim-colorizer.lua"] = {
        load_file = true,
        disable = false,
        event = {"BufReadPre"},
        after = {"impatient.nvim"}
    },
    ["lewis6991/spellsitter.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["sbdchd/neoformat"] = {
        load_file = true,
        cmd = "Neoformat",
        after = {"impatient.nvim"}
    },
    ["JoosepAlviste/nvim-ts-context-commentstring"] = {
        load_file = false,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["numToStr/Comment.nvim"] = {
        load_file = true,
        disable = false,
        after = {"nvim-ts-context-commentstring"}
    },
    ["ur4ltz/surround.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["tpope/vim-repeat"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["windwp/nvim-autopairs"] = {
        load_file = true,
        disable = false,
        event = {"InsertEnter"},
        after = {"impatient.nvim"}
    },
    ["windwp/nvim-ts-autotag"] = {
        load_file = true,
        disable = false,
        event = {"InsertEnter"},
        after = {"impatient.nvim"}
    },
    ["folke/todo-comments.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["lukas-reineke/indent-blankline.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    -- viml plugin
    ["AndrewRadev/switch.vim"] = {
        load_file = true,
        disable = false,
        cmd = "Switch",
        after = {"impatient.nvim"}
    },
    ["tpope/vim-dadbod"] = {
        load_file = false,
        disable = false,
        after = {"impatient.nvim"}
    },
    ["kristijanhusak/vim-dadbod-ui"] = {
        load_file = true,
        disable = false,
        cmd = "DBUIToggle",
        after = {"vim-dadbod"}
    },
    ["Vimjas/vim-python-pep8-indent"] = {
        load_file = false,
        disable = false,
        ft = {"python"},
        after = {"impatient.nvim"}
    },
    ["mattn/emmet-vim"] = {
        load_file = false,
        disable = false,
        ft = {"html", "javascript", "typescript", "vue", "xml", "jsx"},
        after = {"impatient.nvim"}
    },
    ["davidgranstrom/nvim-markdown-preview"] = {
        load_file = true,
        ft = {"markdown"},
        after = "impatient.nvim"
    },
    -------------
    -- function -
    -------------
    ["Pocco81/AutoSave.nvim"] = {
        load_file = true,
        disable = false,
        event = {"TextChanged", "TextChangedI"},
        after = {"impatient.nvim"}
    },
    ["ethanholz/nvim-lastplace"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["kevinhwang91/nvim-hlslens"] = {
        load_file = true,
        disable = false,
        module = "hlslens",
        after = {"impatient.nvim"}
    },
    ["phaazon/hop.nvim"] = {
        load_file = true,
        disable = false,
        module = "hop",
        cmd = {"HopWord", "HopLine", "HopChar1"}
    },
    ["nvim-telescope/telescope.nvim"] = {
        load_file = true,
        module = "telescope",
        after = {"fd", "ripgrep", "nvim-web-devicons"}
    },
    ["AckslD/nvim-neoclip.lua"] = {
        load_file = true,
        disable = false,
        after = {"telescope.nvim"}
    },
    ["nvim-pack/nvim-spectre"] = {
        load_file = true,
        module = "spectre",
        after = {"ripgrep", "plenary.nvim"}
    },
    ["akinsho/bufferline.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufEnter"},
        after = {"nvim-web-devicons"}
    },
    ["famiu/bufdelete.nvim"] = {
        load_file = false,
        disable = false,
        cmd = {"Bdelete"},
        after = {"bufferline.nvim"}
    },
    ["kyazdani42/nvim-tree.lua"] = {
        load_file = true,
        disable = false,
        cmd = {"NvimTreeToggle", "NvimTreeFindFile"},
        after = {"nvim-web-devicons"}
    },
    ["mbbill/undotree"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["akinsho/toggleterm.nvim"] = {
        load_file = true,
        disable = false,
        module = "toggleterm",
        after = {"impatient.nvim"}
    },
    ["mg979/vim-visual-multi"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["folke/which-key.nvim"] = {
        load_file = true,
        disable = false,
        event = {"BufRead", "BufNewFile"},
        after = {"impatient.nvim"}
    },
    ["uga-rosa/translate.nvim"] = {
        load_file = true,
        disable = false,
        cmd = {"Translate"},
        after = {"impatient.nvim"}
    },
    ["jbyuki/venn.nvim"] = {
        load_file = true,
        disable = false,
        module = "venn",
        after = {"impatient.nvim"}
    },
    ["kristijanhusak/vim-carbon-now-sh"] = {
        load_file = false,
        disable = false,
        cmd = {"CarbonNowSh"},
        after = {"impatient.nvim"}
    },
    ["dstein64/vim-startuptime"] = {
        load_file = false,
        disable = false,
        cmd = {"StartupTime"},
        after = {"impatient.nvim"}
    },
    ["olimorris/persisted.nvim"] = {
        load_file = true,
        disable = false,
        after = {"impatient.nvim"}
    }
}

Packer_bootstrap =
    (function()
    local packer_install_path = api.path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")
    if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
        vim.notify(notices.packer.wait.message(), notices.packer.wait.level, notices.packer.wait.options)
        local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
        if not string.find(vim.o.runtimepath, rtp_addition) then
            vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
        end
        return vim.fn.system(
            {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                packer_install_path
            }
        )
    end
end)()

local packer = require("packer")

packer.init(
    {
        auto_clean = false
    }
)

packer.startup(
    {
        function(use)
            for name, opts in pairs(packer_install_plugins) do
                local plugin = vim.tbl_extend("force", {name}, opts)
                if opts.load_file then
                    local file_name
                    if opts.as then
                        file_name = opts.as
                    else
                        file_name = string.match(name, "/([%w-_]+).?")
                    end
                    local require_path = api.path.join("configure", "plugins", file_name)
                    local config_path = api.path.join(vim.fn.stdpath("config"), "lua", require_path .. ".lua")
                    if api.path.is_exists(config_path) then
                        plugin.config = "require('" .. require_path .. "')"
                    else
                        vim.notify(
                            notices.packer.config_not_found.message(name, config_path),
                            notices.packer.config_not_found.level,
                            notices.packer.config_not_found.options
                        )
                    end
                end
                use(plugin)
            end
            if Packer_bootstrap then
                require("packer").sync()
            end
        end,
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", {clear = true})

vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        pattern = {"plugins.lua"},
        command = "source <afile> | PackerCompile",
        group = packer_user_config
    }
)

return packer
