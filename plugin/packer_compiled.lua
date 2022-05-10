-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/askfiy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/askfiy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/askfiy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/askfiy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/askfiy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_comment").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_comment").after()\n\t\t\t\t\t' },
    load_after = {
      ["nvim-ts-context-commentstring"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["aerial.nvim"] = {
    after = { "lua-dev.nvim" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_aerial").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_aerial").after()\n\t\t\t\t\t' },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["bufdelete.nvim"] = {
    commands = { "Bdelete" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_bufferline").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_bufferline").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    cond = { true },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_catppuccin").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_catppuccin").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after = { "aerial.nvim", "friendly-snippets" },
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    after = { "nvim-lightbulb" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_fidget").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_fidget").after()\n\t\t\t\t\t' },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp", "vim-vsnip" },
    load_after = {
      ["cmp-nvim-lsp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    after = { "lualine.nvim" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_gitsigns").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_gitsigns").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopChar1", "HopChar1CurrentLine" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_hop").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_hop").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    after = { "vim-illuminate", "nvim-web-devicons", "gitsigns.nvim", "vim-visual-multi", "vim-carbon-now-sh", "vim-dadbod", "nvim-hlslens", "nvim-ts-context-commentstring", "nvim-ts-autotag", "nvim-ts-rainbow", "vim-repeat", "plenary.nvim", "sqlite.lua", "hop.nvim", "mkdir.nvim", "nvim-scrollview", "nvim-notify", "nvim-colorizer.lua", "which-key.nvim", "indent-blankline.nvim", "spellsitter.nvim", "todo-comments.nvim", "switch.vim", "translate.nvim", "venn.nvim", "vim-startuptime", "toggleterm.nvim", "vimcdoc", "remember.nvim", "nvim-lspconfig", "catppuccin", "nvim-picgo", "bufdelete.nvim", "persisted.nvim", "undotree", "nvim-autopairs", "nvim-dap", "friendly-snippets" },
    loaded = true,
    only_config = true
  },
  ["indent-blankline.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_indent-blankline").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_indent-blankline").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lua-dev.nvim"] = {
    after = { "null-ls.nvim" },
    load_after = {
      ["aerial.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_lualine").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_lualine").after()\n\t\t\t\t\t' },
    load_after = {
      ["gitsigns.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mkdir.nvim"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/mkdir.nvim",
    url = "https://github.com/jghauser/mkdir.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_null-ls").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_null-ls").after()\n\t\t\t\t\t' },
    load_after = {
      ["lua-dev.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-autopairs").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-autopairs").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp-cmdline", "cmp-vsnip", "vim-dadbod-completion", "cmp-path" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-cmp").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-cmp").after()\n\t\t\t\t\t' },
    load_after = {
      ["friendly-snippets"] = true,
      ["vim-vsnip"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-colorizer").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-colorizer").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "nvim-dap-virtual-text" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap-ui").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap-ui").after()\n\t\t\t\t\t' },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap-virtual-text").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-dap-virtual-text").after()\n\t\t\t\t\t' },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-hlslens").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-hlslens").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-lightbulb").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-lightbulb").after()\n\t\t\t\t\t' },
    load_after = {
      ["fidget.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    after = { "fidget.nvim" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-lsp-installer").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-lsp-installer").after()\n\t\t\t\t\t' },
    load_after = {
      ["null-ls.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "cmp-nvim-lsp" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-markdown-preview"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-markdown-preview",
    url = "https://github.com/davidgranstrom/nvim-markdown-preview"
  },
  ["nvim-neoclip.lua"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-neoclip").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-neoclip").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-notify").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-notify").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-picgo"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-picgo").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-picgo").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-picgo",
    url = "https://github.com/askfiy/nvim-picgo"
  },
  ["nvim-scrollview"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-scrollview").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-scrollview").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-spectre"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-spectre").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-spectre").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFindFile" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-tree").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-tree").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_nvim-treesitter").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_nvim-treesitter").after()\n\t\t\t\t\t' },
    load_after = {
      ["nvim-ts-autotag"] = true,
      ["nvim-ts-context-commentstring"] = true,
      ["nvim-ts-rainbow"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    after = { "nvim-treesitter" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    after = { "Comment.nvim", "nvim-treesitter" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    after = { "nvim-treesitter" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    after = { "nvim-tree.lua", "lualine.nvim", "bufferline.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["persisted.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_persisted").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_persisted").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/persisted.nvim",
    url = "https://github.com/olimorris/persisted.nvim"
  },
  ["plenary.nvim"] = {
    after = { "nvim-spectre", "telescope.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["remember.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_remember").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_remember").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/remember.nvim",
    url = "https://github.com/vladdoster/remember.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_spellsitter").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_spellsitter").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["sqlite.lua"] = {
    after = { "nvim-neoclip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["surround.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_surround").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_surround").after()\n\t\t\t\t\t' },
    load_after = {
      ["vim-repeat"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/surround.nvim",
    url = "https://github.com/ur4ltz/surround.nvim"
  },
  ["switch.vim"] = {
    commands = { "Switch" },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["telescope.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_telescope").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_telescope").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_todo-comments").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_todo-comments").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_toggleterm").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_toggleterm").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["translate.nvim"] = {
    commands = { "Translate" },
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_translate").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_translate").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/translate.nvim",
    url = "https://github.com/uga-rosa/translate.nvim"
  },
  undotree = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["venn.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_venn").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_venn").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vim-carbon-now-sh"] = {
    commands = { "CarbonNowSh" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-carbon-now-sh",
    url = "https://github.com/kristijanhusak/vim-carbon-now-sh"
  },
  ["vim-dadbod"] = {
    after = { "vim-dadbod-ui" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-dadbod",
    url = "https://github.com/tpope/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    after_files = { "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.lua", "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion",
    url = "https://github.com/kristijanhusak/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUIToggle" },
    load_after = {
      ["vim-dadbod"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui",
    url = "https://github.com/kristijanhusak/vim-dadbod-ui"
  },
  ["vim-illuminate"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    after = { "surround.nvim" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-visual-multi"] = {
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    after = { "nvim-cmp" },
    load_after = {
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimcdoc = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/vimcdoc",
    url = "https://github.com/yianwillis/vimcdoc"
  },
  ["which-key.nvim"] = {
    config = { '\t\t\t\t\t\trequire("configure/plugins/nv_which-key").load()\n\t\t\t\t\t\trequire("configure/plugins/nv_which-key").after()\n\t\t\t\t\t' },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/askfiy/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^dap"] = "nvim-dap",
  ["^hlslens"] = "nvim-hlslens",
  ["^hop"] = "hop.nvim",
  ["^nvim%-picgo"] = "nvim-picgo",
  ["^spectre"] = "nvim-spectre",
  ["^telescope"] = "telescope.nvim",
  ["^toggleterm"] = "toggleterm.nvim",
  ["^venn"] = "venn.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
						require("configure/plugins/nv_impatient").load()
						require("configure/plugins/nv_impatient").after()
					
time([[Config for impatient.nvim]], false)
-- Conditional loads
time([[Conditional loading of catppuccin]], true)
  require("packer.load")({"catppuccin"}, {}, _G.packer_plugins)
time([[Conditional loading of catppuccin]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vimcdoc ]]
vim.cmd [[ packadd persisted.nvim ]]

-- Config for: persisted.nvim
						require("configure/plugins/nv_persisted").load()
						require("configure/plugins/nv_persisted").after()
					

vim.cmd [[ packadd sqlite.lua ]]
vim.cmd [[ packadd nvim-neoclip.lua ]]

-- Config for: nvim-neoclip.lua
						require("configure/plugins/nv_nvim-neoclip").load()
						require("configure/plugins/nv_nvim-neoclip").after()
					

vim.cmd [[ packadd plenary.nvim ]]
vim.cmd [[ packadd nvim-web-devicons ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1CurrentLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1CurrentLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Bdelete lua require("packer.load")({'bufdelete.nvim'}, { cmd = "Bdelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUIToggle lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUIToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'translate.nvim'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Switch lua require("packer.load")({'switch.vim'}, { cmd = "Switch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'nvim-markdown-preview'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CarbonNowSh lua require("packer.load")({'vim-carbon-now-sh'}, { cmd = "CarbonNowSh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType vue ++once lua require("packer.load")({'emmet-vim'}, { ft = "vue" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'emmet-vim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType py ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "py" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'nvim-markdown-preview'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'nvim-hlslens', 'mkdir.nvim', 'friendly-snippets'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'vim-illuminate', 'gitsigns.nvim', 'vim-dadbod', 'nvim-ts-context-commentstring', 'nvim-ts-autotag', 'nvim-ts-rainbow', 'vim-repeat', 'nvim-scrollview', 'nvim-notify', 'which-key.nvim', 'indent-blankline.nvim', 'spellsitter.nvim', 'todo-comments.nvim', 'remember.nvim', 'nvim-lspconfig', 'undotree'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'vim-illuminate', 'gitsigns.nvim', 'vim-dadbod', 'nvim-ts-context-commentstring', 'nvim-ts-autotag', 'nvim-ts-rainbow', 'vim-repeat', 'nvim-scrollview', 'nvim-notify', 'which-key.nvim', 'indent-blankline.nvim', 'spellsitter.nvim', 'todo-comments.nvim', 'remember.nvim', 'nvim-lspconfig', 'undotree'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'bufferline.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-visual-multi'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'vim-python-pep8-indent', 'emmet-vim', 'nvim-autopairs', 'friendly-snippets'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
