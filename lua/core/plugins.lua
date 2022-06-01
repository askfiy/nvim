local options = require("core.options")
local path = require("utils.api.path")

local packer_install_tbl = {
    --[[
	=====================================
	  ------------- basic -------------
	=====================================
	--]]
    ["wbthomason/packer.nvim"] = {}, -- package manager
    ["lewis6991/impatient.nvim"] = {}, -- speed up startup
    ["nathom/filetype.nvim"] = {}, -- speed up startup
    ["rcarriga/nvim-notify"] = {}, -- fancy notification message
    --[[
	=====================================
	  ------------ Depend ------------
	=====================================
	--]]
    ["kyazdani42/nvim-web-devicons"] = { -- neovim icons support
        after = { "impatient.nvim" },
    },
    ["nvim-lua/plenary.nvim"] = { -- some module dependencies
        after = { "impatient.nvim" },
    },
    ["lewis6991/gitsigns.nvim"] = { -- git commit sign
        event = { "BufRead", "BufNewFile" },
    },
    --[[
	=====================================
	 ------------- Theme ---------------
	=====================================
	--]]
    ["askfiy/catppuccin"] = { -- dark purple theme
        cond = options.colorscheme == "catppuccin",
    },
    ["Mofiqul/vscode.nvim"] = {
        cond = options.colorscheme == "vscode",
    },
    ["projekt0n/github-nvim-theme"] = {
        cond = options.colorscheme == "github-theme",
    },
    --[[
	=====================================
	 ---------- Core function ----------
	=====================================
	--]]
    ["nvim-lualine/lualine.nvim"] = { -- status bar plugin
        after = { "nvim-web-devicons", "gitsigns.nvim" },
    },
    ["kyazdani42/nvim-tree.lua"] = { -- file tree view
        after = { "nvim-web-devicons" },
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    },
    ["akinsho/bufferline.nvim"] = { -- buffer label
        after = { "nvim-web-devicons" },
    },
    ["mbbill/undotree"] = { -- undo tree
        ptp = "viml",
        event = { "BufRead", "BufNewFile" },
    },
    ["folke/which-key.nvim"] = { -- keybinder
        event = { "BufRead", "BufNewFile" },
    },
    --[[
	=====================================
	 ----- language server protocol ----
	=====================================
	--]]
    ["neovim/nvim-lspconfig"] = { -- Basic LSP configuration support
        after = { "impatient.nvim" },
    },
    ["hrsh7th/cmp-nvim-lsp"] = { -- Enhance neovim completion
        after = { "nvim-lspconfig" },
    },
    -- In order to keep the order of lazy loading, so this plugin is placed here
    -- but it is not part of the LSP plugin scope
    ["stevearc/aerial.nvim"] = { -- outline notation preview
        after = { "nvim-lspconfig" },
    },
    ["folke/lua-dev.nvim"] = { -- sumneko_lua enhancement plugin for neovim-lua development
        after = { "nvim-lspconfig" },
    },
    ["jose-elias-alvarez/null-ls.nvim"] = { -- Provides third-party diagnostics, debugging, formatting, etc. for the built-in LSP
        after = { "nvim-lspconfig" },
    },
    ["williamboman/nvim-lsp-installer"] = { -- automatically install LSP service
        after = { "nvim-lspconfig", "cmp-nvim-lsp", "aerial.nvim", "lua-dev.nvim", "null-ls.nvim" },
    },
    ["j-hui/fidget.nvim"] = { -- prompt LSP initialization status
        after = { "nvim-lsp-installer" },
    },
    ["kosayoda/nvim-lightbulb"] = { -- prompt a lightbulb when code behavior is available
        after = { "nvim-lsp-installer" },
    },
    --[[
	=====================================
	 --------- Code Completion ---------
	=====================================
	--]]
    ["rafamadriz/friendly-snippets"] = { -- provide rich snippet support
        event = { "InsertEnter", "CmdlineEnter" },
    },
    ["hrsh7th/vim-vsnip"] = { -- provide snippet support for nvim-cmp
        ptp = "viml",
        after = { "friendly-snippets" },
    },
    ["hrsh7th/nvim-cmp"] = { -- autocomplete plugin for neovim
        after = { "vim-vsnip" },
    },
    ["hrsh7th/cmp-vsnip"] = { -- vsnip support for cmp
        after = { "nvim-cmp" },
    },
    ["hrsh7th/cmp-buffer"] = { -- provide buffer completion
        after = { "nvim-cmp" },
    },
    ["hrsh7th/cmp-path"] = { -- provide path completion
        after = { "nvim-cmp" },
    },
    ["hrsh7th/cmp-cmdline"] = { -- provide command line completion
        after = { "nvim-cmp" },
    },
    ["kristijanhusak/vim-dadbod-completion"] = { -- complete completion for dadbod  (it may affect performance)
        ptp = "viml",
        after = { "nvim-cmp" },
    },
    ["tzachar/cmp-tabnine"] = { -- AI smart completion (it may affect performance)
        disable = false,
        run = "./install.sh",
        after = { "nvim-cmp" },
    },
    ["github/copilot.vim"] = { -- AI smart completion
        disable = false,
        ptp = "viml",
        event = { "InsertEnter" },
    },
    --[[
	=====================================
	 ----- debug adapter protocol ------
	=====================================
	--]]
    ["mfussenegger/nvim-dap"] = { -- provide code debugging
        module = "dap",
    },
    ["theHamsta/nvim-dap-virtual-text"] = { -- provide dummy text for debugging
        after = { "nvim-dap" },
    },
    ["rcarriga/nvim-dap-ui"] = { -- provide UI interface for debugging
        after = { "nvim-dap" },
    },
    --[[
	=====================================
	 ------- Database connection -------
	=====================================
	--]]
    ["tpope/vim-dadbod"] = { -- core tool for linking databases
        ptp = "viml",
        fn = { "db#resolve" },
    },
    ["kristijanhusak/vim-dadbod-ui"] = { -- quick link database
        ptp = "viml",
        cmd = "DBUIToggle",
    },
    --[[
	=====================================
	 ----------- Code Editor -----------
	=====================================
	--]]
    ["windwp/nvim-autopairs"] = { -- autocomplete parentheses
        event = { "InsertEnter" },
    },
    ["norcalli/nvim-colorizer.lua"] = { -- view code color
        event = { "BufReadPre", "BufNewFile" },
    },
    ["RRethy/vim-illuminate"] = { -- highlight the same word under the cursor
        ptp = "viml",
        event = { "BufRead", "BufNewFile" },
    },
    ["lukas-reineke/indent-blankline.nvim"] = { -- highlight indent
        event = { "BufRead", "BufNewFile" },
    },
    ["nvim-treesitter/nvim-treesitter"] = { -- syntax tree plugin
        event = { "BufRead", "BufNewFile" },
        run = ":TSUpdate",
    },
    ["lewis6991/spellsitter.nvim"] = {
        after = { "nvim-treesitter" },
    },
    ["p00f/nvim-ts-rainbow"] = { -- rainbow brackets
        after = { "nvim-treesitter" },
    },
    ["windwp/nvim-ts-autotag"] = { -- autocomplete tags
        after = { "nvim-treesitter" },
    },
    ["JoosepAlviste/nvim-ts-context-commentstring"] = { -- Provides context-based commenting behavior for Comment
        after = { "nvim-treesitter" },
    },
    ["numToStr/Comment.nvim"] = { -- provide code comment function
        keys = { "gb", "gc" },
        after = { "nvim-ts-context-commentstring" },
    },
    ["tpope/vim-repeat"] = { -- repeat the modified surround operation of surround
        ptp = "viml",
        fn = "repeat#set",
    },
    ["ur4ltz/surround.nvim"] = { -- modify surround
        event = { "BufRead", "BufNewFile" },
    },
    ["folke/todo-comments.nvim"] = { -- highlight and find all TODO comments
        event = { "BufRead", "BufNewFile" },
    },
    ["AndrewRadev/switch.vim"] = { -- quickly switch the opposite of the word
        ptp = "viml",
        cmd = { "Switch" },
        fn = { "switch#Switch" },
    },
    ["Vimjas/vim-python-pep8-indent"] = { -- Python indentation rules
        ptp = "viml",
        ft = "py",
        event = { "InsertEnter" },
    },
    ["mattn/emmet-vim"] = { -- emmet abbreviation support
        ptp = "viml",
        ft = { "html", "javascript", "typescript", "vue", "xml", "jsx" },
    },
    --[[
	=====================================
	 ----------- Fuzzy lookup ----------
	=====================================
	--]]
    ["nvim-telescope/telescope.nvim"] = { -- fuzzy lookup tool
        module = "telescope",
    },
    ["tami5/sqlite.lua"] = { -- persistent storage history yank records
        after = { "impatient.nvim" },
    },
    ["AckslD/nvim-neoclip.lua"] = { -- can be used to quickly view historical yank records
        after = { "sqlite.lua" },
    },
    ["nvim-pack/nvim-spectre"] = { -- Text replacement and retrieval tool for all items
        module = "spectre",
    },
    --[[
	=====================================
	 ------ Documentation editing ------
	=====================================
	--]]
    ["phaazon/hop.nvim"] = { -- quick jump to any location
        module = "hop",
        cmd = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
    },
    ["kevinhwang91/nvim-hlslens"] = { -- Enhanced / query experience
        module = "hlslens",
        event = { "CmdlineEnter" },
    },
    ["davidgranstrom/nvim-markdown-preview"] = { -- markdown preview tool
        ptp = "viml",
        ft = { "markdown" },
        cmd = { "MarkdownPreview" },
    },
    ["askfiy/nvim-picgo"] = { -- image uploader
        module = "nvim-picgo",
    },
    ["mg979/vim-visual-multi"] = { -- multi-cursor mode
        ptp = "viml",
        fn = { "vm#commands#add_cursor_up", "vm#commands#add_cursor_down" },
        keys = { "<c-n>" },
    },
    ["jbyuki/venn.nvim"] = { -- an excellent drawing tool
        module = "venn",
    },
    ["kristijanhusak/vim-carbon-now-sh"] = { -- carbon-based code screenshot tool (requires internet connection)
        ptp = "viml",
        cmd = { "CarbonNowSh" },
    },
    --[[
	=====================================
	 ---------- Other function ---------
	=====================================
	--]]
    ["olimorris/persisted.nvim"] = { -- session manager
        after = { "impatient.nvim" },
    },
    ["yianwillis/vimcdoc"] = { -- vim Chinese documentation
        ptp = "viml",
        event = { "CmdlineEnter" },
        after = { "telescope.nvim" },
    },
    ["dstein64/vim-startuptime"] = { -- query startup time
        ptp = "viml",
        cmd = { "StartupTime" },
    },
    ["ethanholz/nvim-lastplace"] = {
        event = { "BufRead" },
    },
    ["dstein64/nvim-scrollview"] = { -- draggable scrollbar
        event = { "BufRead", "BufNewFile" },
    },
    ["akinsho/toggleterm.nvim"] = { -- Beautify neovim default terminal
        module = "toggleterm",
    },
    ["uga-rosa/translate.nvim"] = { -- an excellent translation plugin
        cmd = { "Translate" },
    },
    ["jghauser/mkdir.nvim"] = {
        event = "CmdlineEnter",
    },
}

Packer_bootstrap = (function()
    local packer_install_path = path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")
    ---@diagnostic disable-next-line: missing-parameter
    if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
        local rtp_addition = string.format("%s/site/pack/*/start/*", vim.fn.stdpath("data"))
        vim.notify("Please wait ...\nInstalling packer package manager ...", "info", { title = "Packer" })
        if not string.find(vim.o.runtimepath, rtp_addition) then
            vim.o.runtimepath = string.format("%s,%s", rtp_addition, vim.o.runtimepath)
        end
        return vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            packer_install_path,
        })
    end
end)()

local packer = require("packer")

packer.init({
    git = {
        -- For Chinese users, if the download is slow, you can switch to the github mirror source
        -- replace : https://hub.fastgit.xyz/%s
        default_url_format = "https://github.com/%s",
    },
})

packer.startup({
    function(use)
        for plug_name, plug_config in pairs(packer_install_tbl) do
            local plug_options = vim.tbl_deep_extend("force", { plug_name }, plug_config)
            local plug_filename = plug_options.as or string.match(plug_name, "/([%w%-_]+).?")
            -- The plugin configuration module that needs to be loaded
            local load_disk_path = path.join("configure", "plugins", string.format("nv_%s", plug_filename:lower()))
            -- Path of the plugin configuration module on disk
            local file_disk_path = path.join(vim.fn.stdpath("config"), "lua", string.format("%s.lua", load_disk_path))
            -- If the path exists, load the configuration, otherwise apply the plugin directly
            if path.is_exists(file_disk_path) then
                if plug_config.ptp == "viml" then
                    plug_options.setup = string.format("require('%s').entrance()", load_disk_path)
                else
                    plug_options.setup = string.format("require('%s').before()", load_disk_path)
                    plug_options.config = string.format(
                        [[
                        require('%s').load()
                        require('%s').after()
                        ]],
                        load_disk_path,
                        load_disk_path
                    )
                end
            end
            use(plug_options)
        end
        if Packer_bootstrap then
            -- Automatically download plugins when neovim is opened for the first time
            packer.sync()
        end
    end,
    -- Preview with floating window
    config = { display = { open_fn = require("packer.util").float } },
})

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "plugins.lua" },
    callback = function()
        vim.cmd("source <afile>")
        vim.cmd("PackerCompile")
        vim.pretty_print("Recompile plugins successify...")
    end,
    group = packer_user_config,
})

return packer
