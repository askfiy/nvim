# Documentation

## Notice

Important notice: I have completely refactored it to remove some unnecessary plugins. And made a lot of optimizations for the structure.

If you still want to continue to use the previous configuration, you can choose the [v0.01](https://github.com/askfiy/nvim/releases/tag/V0.01) version.

## Features

- Completely written in Lua language
- Rich functions
- Ultimate performance
- Lots of tweaks for every theme
- Excellent scalability

## illustrate

This is a Neovim configuration written in pure Lua, with good extensibility and a very easy-to-understand configuration (I refactored it entirely in Lua and made sure to remove all viml).

Now it should be stable and fast, I do lazy loading for 99% of the plugins and it should start in between 20ms - 70ms depending on your PC's configuration.

Really does it lightning fast ⚡️.

![](https://user-images.githubusercontent.com/81478335/160888684-419daafc-bdcd-48fd-af49-74950ebc0d21.png)

With the completion of the refactoring, this configuration will be stable and long-term use.

Currently, it supports the following languages:

- Python
- Golang
- Node
- HTML
- CSS
- JavaScript
- TypeScript
- Vue
- Json
- SQL
- Markdown

## Dependencies

Basic dependencies:

- [neovim > 0.7](https://github.com/neovim/neovim)
- [gcc](https://gcc.gnu.org/)
- [tree-sitter](https://tree-sitter.github.io/tree-sitter/)
- [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)
- [node](https://nodejs.org/en/)
- [npm](https://www.npmjs.com/)
- [fd](https://link.zhihu.com/?target=https%3A//github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tar](https://www.gnu.org/software/tar/) [curl](https://curl.se/) [git](https://git-scm.com/) [gzip](https://www.gnu.org/software/gzip/) [wget](https://www.gnu.org/software/wget/) [unzip](infozip.sourceforge.net/UnZip.html)
- [xsel](https://www.vergenet.net/~conrad/software/xsel/)

Other dependencies:

- [lazygit](https://github.com/jesseduffield/lazygit)
- [translate-shell](https://github.com/soimort/translate-shell)
- [picgo-core](https://github.com/PicGo/PicGo-Core)
- [mysql-client](https://www.percona.com/software/mysql-database/percona-server)
- [sqlite3](https://www.sqlite.org/index.html)

You can quickly install all dependencies using the package manager (don't be afraid, many are optional):

```
-- use the system clipboard
$ yay -S xsel

-- Fuzzy Finder
$ yay -S fd
$ yay -S sed
$ yay -S ripgrep

-- * Code format
$ yay -S stylua
$ npm install -g prettier
$ npm install -g gofmt
$ pip3 install autopep8
$ pip3 install sqlformat

-- parsing
$ yay -S tree-sitter

-- * Golang debug
$ yay -S delve

-- * Python debug
$ python3 -m pip install debugpy

-- * Python diagnostics
$ pip3 install pylint

-- * If you use Pyrigth to diagnose Django code, you should install it
$ pip3 install django-stubs

-- * neovim rely
$ npm install -g neovim
$ pip3 install neovim

-- * Lazygit
$ yay -S lazygit

-- * Translate
$ yay -S translate-shell

-- * Markdown preview
$ yay -S pandoc
$ npm install -g live-server

-- * Tabnine require
$ yay -S unzip
$ yay -S curl

-- * Image upload to image bed function
$ yay -S picgo-core

-- * mysql client linker
$ yay -S percona-server-clients

-- * Persistent save history yank records
$ yay -S sqllit3
```

## How do use

Make sure you have the above dependencies installed, then execute the command below

```
$ cd ~/.config/
$ mv nvim ./nvim-bak -- if you haven't configured Neovim yourself, this step can be omitted
$ git clone https://github.com/askfiy/nvim
```

When you open neovim for the first time, it will automatically download all plugins and LSP servers, this process may take 1-2 minutes. please wait patiently ...

## Directory Structure

Directory Structure:

```
.
├── lint/
│   └── ...
├── ftplugin/
│   └── ...
├── snipptes/
│   └── ...
├── lua/
│   ├── configure/
│   │   ├── dap/
│   │   │   └── ...
│   │   ├── lsp/
│   │   │   └── ...
│   │   ├── plugins/
│   │   │   └── ...
│   │   └── theme/
│   │       └── .../
│   │           └── ...
│   ├── core/
│   │   ├── after/
│   │   │   ├── init.lua
│   │   │   ├── vsnip-set.lua
│   │   │   └── auto-command.lua
│   │   ├── mapping.lua
│   │   ├── options.lua
│   │   ├── plugins.lua
│   │   └── setting.lua
│   └── utils/
│       ├── api/
│       │   ├── hi.lua
│       │   ├── path.lua
│       │   ├── str.lua
│       │   └── tbl.lua
│       └── icons.lua
└── init.lua
```

Directory Structure description:

- lint/ : lint configuration for various languages
- ftplugin/ : load different diff options based on file type
- snippets/ : user-defined code snippets
- lua/ : main configuration directory
- lua/configure/ : configuration directory
- lua/configure/dap/ : DAP configuration in different languages
- lua/configure/lsp/ : LSP configuration in different languages
- lua/configure/plugins/ : configuration of plugins
- core/after/ : some autocommand scripts like autosave, cursor events, etc..
- utils/ : defines some auxiliary functions and non-core configuration
- utils/api/ : define helper functions

File Description:

- settings : neovim built-in configuration
- options : user-defined configuration
- mapping : user key configuration
- plugins : plugin loading configuration

## Some commands

```
PackerStatus: View plug-in running status
PackerSync: Update plugins
VsnipOPen: define code snippets
MarkdownPreview: Preview markdown files
LspInfo: View LSP running status
LSPInstallInfo: View LSP download status
```

## Disabled plugins

### Tabnine

[Tabnine](https://github.com/tzachar/cmp-tabnine) is disabled for performance reasons, you can search for Tabnine in the [lua/core/plugins.lua](./lua/core/plugins.lua) file and open it.

```
	["tzachar/cmp-tabnine"] = { -- AI smart completion (it may affect performance)
        -- comment the line below
		disable = true,
		run = "./install.sh",
		after = { "nvim-cmp" },
	},
```

Enter `:PackerSync` to install the plugin. After the installation is complete, an error may occur. You need to execute the following command:

```
$ ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```

### Copillot

For performance reasons, the [copillot](https://github.com/github/copilot.vim) plugin is also disabled by default, you can turn it on as well.

After entering the `:PackerSync` command, you can enter `:Copilot setup` .

It will return you a string of verification codes, which you need to record and enter in your browser.

## Extension

### Add New plugin

Add the new plugins you want to use in [lua/core/plugins](./lua/core/plugins.lua).

Note that if your newly installed plugin requires a configuration file, and the plugin is written in viml, you must declare it like this:

```
-- If it is a Lua plugin, this is not required
["plugin_author/plugin_name"] = {
    ptp = "viml"
}
```

Then you can create configuration files in the [lua/configure/plugins](./lua/configure/plugins/) directory.

The configuration file must start with `nv_` and end with `.lua`, such as `nv_plugin_name.lua`.

The plugin writing template of viml type is as follows:

```
local M = {}

function M.entrance()
end

return M
```

If it is a plugin written in Lua, you need to use the following template:

```
local M = {}

function M.before() end

function M.load()
	local ok, m = pcall(require, "m")
	if not ok then
		return
	end

	M.m = m
	M.m.setup({config})
end

function M.after() end

return M
```

The reason for this is that you can manage your plugins more easily, so I recommend it.

### Add Lsp config

To add a new LSP configuration, please add a new configuration file in the [lua/configure/lsp/](./lua/configure/lsp/) directory.

The configuration file template is as follows:

```
return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr)
            -- This is required, you don't have to write anything.
            -- Here you can do things that only target the current LSP server when you need it
		end,
	},
	options = {
        -- LSP configuration goes here
	},
}
```

Then you need to add a new configuration to [lua/configure/plugins/nv_nvim-lsp-installer.lua](./lua/configure/plugins/nv_nvim-lsp-installer.lua)

```
local M = {
	language_servers_config = {
		lsp_name = require("configure.lsp.your_lsp_config_file_name"),
	},
}
```

### Add Dap config

To add a new Dap configuration, please add a new configuration file in the [lua/configure/dap/](./lua/configure/dap/) directory.

The configuration file template is as follows:

```
return {
	names = {
        -- Some debuggers have different names for adapters and configurations
        -- so you have to specify it here, it's required
		adapters = "adapters_name",
		configurations = "configurations_name",
	},
	adapters = {
        ...
	},
	configurations = {
        ...
	},
}
```

Then you need to add a new configuration to [lua/configure/plugins/nv_nvim-dap.lua](lua/configure/plugins/nv_nvim-dap.lua)

```
local M = {
	dubug_adapter_config = {
		...
		arbitrary_name = require("configure.dap.your_dap_config_file_name"),
	},
}
```

## Key bindings

### Diff keymap

The default `leader` is `space`, you can check the [lua/core/mapping.lua](./lua/core/mapping.lua) file to see the basic key bindings.

Some vim or neovim default keys have been replaced, namely:

- `normal <c-u>` : now it will move up 10 lines instead of half the display area
- `normal <c-d>` : now it will move down 10 lines instead of half the display area
- `normal <c-e>` : now it will move the current buffer to the left instead of scrolling up a line
- `normal <c-y>` : now it will move the current display area to the right instead of scrolling down a line
- `normal <c-l>` : now he will focus on the left buffer instead of clearing the search highlight

### Manager keymap

`<leader>1`, `<leader>2`, `<leader>3`, `<leader>4` Can open some specific functions.

![图片](https://user-images.githubusercontent.com/81478335/167361254-1d79dd69-eec8-40a3-bae1-6011f2d30fc2.png)

- File Exporer is [Nvim-tree](https://github.com/kyazdani42/nvim-tree.lua), you can press `g?` for help.
- Outline Explorer is [aerial](https://github.com/stevearc/aerial.nvim), you can press `?` for help.
- Undo Explorer is [undotree](https://github.com/mbbill/undotree), you can press `?` for help.
- Database Explorer is [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui), you can press `?` for help.

### Buffer keymap

```
- normal <c-q> : Close current buffer
- normal <c-h> : Go to left buffer
- normal <c-l> : Go to right buffer
- normal <c-e> : Move current buffer to left
- normal <c-y> : Move current buffer to right
```

Other keys can be viewed by pressing `<leader>b` in normal mode.

![图片](https://user-images.githubusercontent.com/81478335/167360833-2e19d73c-43d2-48e6-876c-738bd27483c7.png)

### LSP keymap

```
- normal gh : Show help information
- normal gr : Go to references
- normal go : Show Workspace Diagnostics
- normal gd : Go to definitions
- normal gD : Go to type definitions
- normal [g : Jump to prev diagnostic
- normal ]g : Jump to next diagnostic
- insert <c-j> : Toggle signature help
```

Other keys can be viewed by pressing `<leader>c` in normal mode.

![图片](https://user-images.githubusercontent.com/81478335/167362538-9babb025-bb4f-4abc-a012-377fff85350b.png)

### Code Completion

```
- insert <c-k> : Toggle completion menu
- insert <c-p> : select the previous completion suggestion
- insert <c-n> : select the next completion suggestion
- insert <c-d> : select the fifth completion suggestion below
- insert <c-u> : select the fifth completion suggestion above
- insert <cr>  : confirm current suggestion
- insert <tab> : similar to vscode, if you do not enter the completion menu, select the next item, if you enter the completion menu, select the current item
- insert <c-b> : scroll up the floating window
- insert <c-f> : scroll down the floating window
```

Additionally, `<tab>` and `<s-tab>` can also be used in fragments, which behave the same as in vscode:

```
- insert <tab> : jump backward
- insert <s-tab> : jump forward
```

### Debug

The `<leader>d` prefix is used to manage `Debug`:

![图片](https://user-images.githubusercontent.com/81478335/167365809-85e6d011-5e62-4dbf-925b-2d924250e1f9.png)

Some other keys will only take effect after entering `Debug` mode:

```
- normal <f5> : Enable debugging or jump to the next breakpoint
- normal <f6> : Step into
- normal <f7> : Step over
- normal <f8> : Step out
- normal <f9> : Rerun debug
- normal <f10> : Close debug
```

Additionally, you can enter expressions by pressing `i` in the `repl` window.

### Find

All lookups are prefixed with `<leader>f`:

![图片](https://user-images.githubusercontent.com/81478335/167366170-6c56cdf5-5495-4782-8e28-66dead74b808.png)

### Git

You can use `<leader>g` to view Git information in the current file, for Git management, we have other ways:

![图片](https://user-images.githubusercontent.com/81478335/167366513-1f1e91c3-caff-4ae3-944a-952f44d6d816.png)

### Replace

The full workspace fuzzy string search and replace of vscode is very easy to use, there is also a corresponding plugin in neovim, I set its prefix key to `<leader>r`:

![图片](https://user-images.githubusercontent.com/81478335/167366676-34b8a278-dd7e-4898-ac27-d6c9fa344c2b.png)

Also, after entering the fuzzy search and replace interface, you can use `?` to get more help.

### Session

Restoring the working state after reopening the IDE is a feature that modern editors should have. You can directly use `<leader>sl` to restore the last session record.

In addition, `<leader>s` is also bound to some other keys:

![图片](https://user-images.githubusercontent.com/81478335/167367284-476b6958-f9a2-4eab-8804-b8ec8b5825ad.png)

### Terminal

The prefix key for the integrated terminal is `<leader>t`:

```
- normal <leader>tt : Toggle bottom or vertical terminal
- normal <leader>tf : Toggle floating terminal
- normal <leader>tv : Toggle vertical terminal
- normal <leader>tg : Toggle lazygit terminal (requires lazygit installed)
- normal <leader>ta : Toggle all terminal
```

The floating terminal and lazygit terminal can only open one, but the bottom terminal and side terminal can open many.

The default terminal number opened by `<leader>tt` is `1`, if you want to open a new terminal, please enter `{count}<leader>tt`

Notice! floating terminal number is 120, lazygit terminal number is 130.

### Translate

Well, translated commands are also prefixed with `<leader>t`:

![图片](https://user-images.githubusercontent.com/81478335/167368539-edd9ef3e-c6f0-40d6-ae81-7385b4d8add2.png)

```
- normal | visual <leader>tcs : Translate English to Chinese and open in split window
- normal | visual <leader>tcr : Translate English to Chinese and replace English
- normal | visual <leader>tcf : Translate English to Chinese and open in float window
- normal | visual <leader>tci : Translate English to Chinese and insert to next line
- normal | visual <leader>tcc : Translate English to Chinese and copy result to clipboard
- normal | visual <leader>tcw : Translate English word to Chinese and open in float window
- normal | visual <leader>tcb : Translate English comment to Chinese and open in float window


- normal | visual <leader>tes : Translate Chinese to English and open in split window
- normal | visual <leader>ter : Translate Chinese to English and replace Chinese
- normal | visual <leader>tef : Translate Chinese to English and open in float window
- normal | visual <leader>tei : Translate Chinese to English and insert to next line
- normal | visual <leader>tec : Translate Chinese to English and copy result to clipboard
- normal | visual <leader>tew : Translate Chinese word to English and open in float window
- normal | visual <leader>teb : Translate Chinese comment to English and open in float window
```

If you want to change the language, you can open the [/lua/configure/plugins/nv_translate.lua](./lua/configure/plugins/nv_translate.lua) file and change the mapping.

Finally, don't forget to modify the key grouping description in the [/lua/configure/plugins/nv_which-key.lua](./lua/configure/plugins/nv_which-key.lua) file.

### Upload

There are some buttons that can upload pictures to the Internet, and a makrdown picture link will be generated after the upload is complete。

The prefix is `<leader>u`：

![图片](https://user-images.githubusercontent.com/81478335/167370030-b0a1044b-05b6-4dad-8e6e-c88bc2e5159c.png)

### Multiple cursors

It is common to quickly select a range of words and make changes. Here are the key bindings for multi-cursor mode:

```
normal <tab> : Toggle between normal and visual mode
normal <c-n> : Select down
normal <c-s> : Skip selection
normal <c-p> : Delete the current selection
normal <m-p> : Create cursor down
normal <m-n> : Create cursor up
normal <esc> : Exit Multiple cursors mode
```

### Surround

It is very common to change `"` to `'` or `()` to `[]`.

You can make quick changes using the following keys:

```
normal ys{range}{char} : Add Surround
normal cs{char}{char}  : Changne Surround
normal cq              : Toggle Surround
normal ds{char}        : Delete Surround
visual s               : Add Surround
```

### Comment

Good code needs to use comments, you can press the following shortcut keys to quickly add comments：

```
normal gcc : Toggle line comment
normal gcb : Toggle block comment
normal gca : Insert line comment to line end
normal gcj : Insert line comment to next line
normal gck : Insert line comment to previous line
normal gb{range} : Switch the specified line to a block comment

visual gc  : Toggle line comment
visual gb  : Toggle block comment
```

### Switch

It is common to quickly change `True` to `False`. Switching can be done quickly with `gs`.

If you want to add some words, you can edit the [lua/configure/plugins/nv_switch.lua](./lua/configure/plugins/nv_switch.lua) file.

### Emment

Use `<c-f>,` to quickly expand emment fragments.

`<c-f>` has some other functions, but it only works with certain types of files:

![图片](https://user-images.githubusercontent.com/81478335/167378228-47973a0c-fca2-45df-a87e-8ee3d53ec9e2.png)

### Motions

With the [Hop](https://github.com/phaazon/hop.nvim) plugin, you can quickly jump to any position in the buffer:

![图片](https://user-images.githubusercontent.com/81478335/167379194-0e6b7036-54e8-4ccd-9e95-04af1f2ad1c0.png)

### Drawing

Drawing with neovim is a cool feature when writing Markdown documents.

Press `<leader>5` to open Venn, then try `<c-j/k/h/l>` to draw lines.

Select an area with `<c-v>` and press `f` or `b` you will get a solid or hollow box.

### Copillot

Use `<c-l>` to get copillot's suggestions in insert mode.

### 1
### 2

### 3
