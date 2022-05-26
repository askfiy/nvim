# Documentation

<details>
<summary>Directory</summary>

- [Notice](#Notice)
- [Features](#Features)
- [illustrate](#illustrate)
- [Dependencies](#Dependencies)
- [How-do-use](#How-do-use)
- [Directory-Structure](#Directory-Structure)
- [Personal-customization](#Personal-customization)
- [Some-commands](#Some-commands)
- [Disabled-plugins](#Disabled-plugins)
  - [Tabnine](#Tabnine)
  - [Copillot](#Copillot)
- [Extension](#Extension)
  - [Add-New-plugin](#Add-New-plugin)
  - [Add-Lsp-config](#Add-Lsp-config)
  - [Add-Dap-config](#Add-Dap-config)
- [Key-bindings](#Key-bindings)
  - [Diff-keymap](#Diff-keymap)
  - [Manager-keymap](#Manager-keymap)
  - [Buffer-keymap](#Buffer-keymap)
  - [LSP-keymap](#LSP-keymap)
  - [Code-Completion](#Code-Completion)
  - [Debug](#Debug)
  - [Find](#Find)
  - [Git](#Git)
  - [Replace](#Replace)
  - [Session](#Session)
  - [Terminal](#Terminal)
  - [Translate](#Translate)
  - [Upload](#Upload)
  - [Multiple-cursors](#Multiple-cursors)
  - [Surround](#Surround)
  - [Comment](#Comment)
  - [Switch](#Switch)
  - [Emment](#Emment)
  - [Motions](#Motions)
  - [Drawing](#Drawing)
  - [Copillot](#Copillot)

</details>

## Features

- Completely written in Lua language
- Rich functions
- Ultimate performance
- Lots of tweaks for every theme
- Excellent scalability

## illustrate

This is a Neovim configuration written in pure Lua, with good extensibility and a very easy-to-understand configuration.

Now it should be stable and fast, I do lazy loading for 99% of the plugins and it should start in between 20ms - 70ms depending on your PC's configuration.

Really does it lightning fast ⚡️.

![](https://user-images.githubusercontent.com/81478335/160888684-419daafc-bdcd-48fd-af49-74950ebc0d21.png)

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
- [trash](https://formulae.brew.sh/formula/trash)

You can quickly install all dependencies using the package manager (don't be afraid, many are optional):

```
-- use the system clipboard
$ yay -S xsel

-- parsing
$ yay -S tree-sitter

-- Fuzzy Finder
$ yay -S fd
$ yay -S sed
$ yay -S ripgrep

-- * neovim rely
$ npm install -g neovim
$ pip3 install neovim

--* Python diagnostics (use Pyright by default)
$ pip3 install pylint

-- * If you use pylint to diagnose Django code, you should install it
$ pip3 install pylint-django

-- * If you use Pyrigth to diagnose Django code, you should install it (Disabled by default)
$ pip3 install django-stubs

-- * Code format
$ yay -S stylua
$ npm install -g prettier
$ npm install -g gofmt
$ pip3 install autopep8
$ pip3 install sqlformat

-- * Golang debug
$ yay -S delve

-- * Python debug
$ python3 -m pip install debugpy

-- * Lazygit
$ yay -S lazygit

-- * Translate (you can also use Google or Deepl source, if you do you must install curl)
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

-- * Command-line tool to put files into recycle bin
$ yay -S trash
```

## How-do-use

Make sure you have the above dependencies installed, then execute the command below

```
$ cd ~/.config/
$ mv nvim ./nvim-bak -- if you haven't configured Neovim yourself, this step can be omitted
$ git clone https://github.com/askfiy/nvim
```

When you open neovim for the first time, it will automatically download all plugins and LSP servers, this process may take 1-2 minutes. please wait patiently ...

When you first open it, you should look at the [nvim/lua/core/options.lua](./lua/core/options.lua) file and make some customizations to it.

## Directory-Structure

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

## Personal-customization

Open the [nvim/lua/core/options.lua](./lua/core/options.lua) file and you can do some basic customizations.

- icons_style : use kind by default (need [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/) support), you can also use vscode (need [codicon.ttf](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf)) support, use kind by default

Use your own icon: Use your own image of interest, defined in [nvim/lua/utils/icons.lua](./lua/utils/icons.lua).

Change key bindings: change the key set description in [nvim/lua/configure/plugins/nv_which-key.lua](./lua/configure/plugins/nv_which-key.lua), change the default keys in different plugin configuration files .

## Some-commands

```
PackerStatus: View plug-in running status
PackerSync: Update plugins
VsnipOPen: define code snippets
MarkdownPreview: Preview markdown files
LspInfo: View LSP running status
LSPInstallInfo: View LSP download status
```

## Disabled-plugins

### Tabnine

[Tabnine](https://github.com/tzachar/cmp-tabnine) is disabled for performance reasons, you can search for Tabnine in the [nvim/lua/core/plugins.lua](./lua/core/plugins.lua) file and open it.

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

### Add-New-plugin

Add the new plugins you want to use in [nvim/lua/core/plugins](./lua/core/plugins.lua).

Note that if your newly installed plugin requires a configuration file, and the plugin is written in viml, you must declare it like this:

```
-- If it is a Lua plugin, this is not required
["plugin_author/plugin_name"] = {
    ptp = "viml"
}
```

Then you can create configuration files in the [nvim/lua/configure/plugins](./lua/configure/plugins/) directory.

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

### Add-Lsp-config

To add a new LSP configuration, please add a new configuration file in the [nvim/lua/configure/lsp/](./lua/configure/lsp/) directory.

The configuration file template is as follows:

```
local M = {}

M.private_attach_callbackfn = function(client, bufnr)
    -- Do your own thing
    -- It will be called after publish_attach_callbackfn
end

M.lsp_config = {
    -- Write your LSP configuration
    ...
}

return M
```

Then you need to add a new configuration to [nvim/lua/configure/plugins/nv_nvim-lsp-installer.lua](./lua/configure/plugins/nv_nvim-lsp-installer.lua)

```
M.language_servers_config = {
    lsp_name = require("configure.lsp.your_lsp_config_file_name")
}
```

### Add-Dap-config

To add a new Dap configuration, please add a new configuration file in the [nvim/lua/configure/dap/](./lua/configure/dap/) directory.

The configuration file template is as follows:

```
return {
    adapters = {
        name = {
        ...
        }
    },
    configurations = {
        name = {
        ...
        }
    },
}
```

Then you need to add a new configuration to [nvim/lua/configure/plugins/nv_nvim-dap.lua](lua/configure/plugins/nv_nvim-dap.lua)

```
M.dubug_adapter_config = {
    ...
    arbitrary_name = require("configure.dap.your_dap_config_file_name"),
}
```

## Key-bindings

### Diff-keymap

The default `leader` is `space`, you can check the [nvim/lua/core/mapping.lua](./lua/core/mapping.lua) file to see the basic key bindings.

Some vim or neovim default keys have been replaced, namely:

- `"n" <c-u>` : now it moves up 1/4 screen instead of 1/2 screen
- `"n" <c-d>` : now it moves down 1/4 screen instead of 1/2 screen
- `"n" <c-e>` : now it will move the current buffer to the left instead of scrolling up a line
- `"n" <c-y>` : now it will move the current display area to the right instead of scrolling down a line
- `"n" <c-l>` : now he will focus on the right buffer instead of clearing the search highlight

The following is a description of the basic keys:

```
-  "i" jj                 :  Escape editor insert mode
-  "t" <esc>              :  Escape terminal insert mode
-  "n" <esc>              :  Clear search highlight
-  "n" <c-u>              :  Move 1/4 screen up
-  "n" <c-d>              :  Move 1/4 screen down
-  "n" <m-k>              :  Reduce horizontal split screen size
-  "n" <m-j>              :  Increase horizontal split screen size
-  "n" <m-h>              :  Reduce vertical split screen size
-  "n" <m-l>              :  Increase vertical split screen size
-  "c" <m-p>              :  Look up history
-  "c" <m-n>              :  Look down history
-  "n", "v" k             :  Move up one line
-  "n", "v" j             :  Move down one line
-  "n", "v" H             :  Move to the first character at the beginning of the line
-  "n", "v" L             :  Move to the last character at the end of the line
-  "i", "c", "t" <m-w>    :  Jump to next word in insert mode
-  "i", "c", "t" <m-b>    :  Jump to previous word in insert mode
-  "i", "c", "t" <m-j>  :  Move cursor down in insert mode "i", "c", "t" <m-k>  :  Move cursor up in insert mode
-  "i", "c", "t" <m-h>    :  Move cursor left in insert mode
-  "i", "c", "t" <m-l>    :  Move cursor right in insert mode

```

### Manager-keymap

`<leader>1`, `<leader>2`, `<leader>3`, `<leader>4` Can open some specific functions.

```
- "n" <leader>1  : Open File Explorer
- "n" <leader>2  : Open Outilne Explorer
- "n" <leader>3  : Open Undo Explorer
- "n" <leader>4  : Open Database Explorer
```

- File Exporer is [Nvim-tree](https://github.com/kyazdani42/nvim-tree.lua), you can press `g?` for help.
- Outline Explorer is [aerial](https://github.com/stevearc/aerial.nvim), you can press `?` for help.
- Undo Explorer is [undotree](https://github.com/mbbill/undotree), you can press `?` for help.
- Database Explorer is [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui), you can press `?` for help.

### Buffer-keymap

It is a very good idea to manage all buffers via the [bufferline](https://github.com/akinsho/bufferline.nvim) plugins , here is my keymap, usually they start with `<leader>b`:

```
-  "n" <c-q>       :  Close current buffer
-  "n" <c-h>       :  Go to left buffer
-  "n" <c-l>       :  Go to right buffer
-  "n" <c-e>       :  Move current buffer to left
-  "n" <c-y>       :  Move current buffer to right
-  "n" <leader>bn  :  Create new buffer
-  "n" <leader>bh  :  Close all left buffers
-  "n" <leader>bl  :  Close all right buffers
-  "n" <leader>bo  :  Close all other buffers
-  "n" <leader>ba  :  Close all buffers
-  "n" <leader>bt  :  Go to buffer *
-  "n" <leader>bs  :  Buffers sort (by extension)
-  "n" <leader>b1  :  Go to buffer 1
-  "n" <leader>b2  :  Go to buffer 2
-  "n" <leader>b3  :  Go to buffer 3
-  "n" <leader>b4  :  Go to buffer 4
-  "n" <leader>b5  :  Go to buffer 5
-  "n" <leader>b6  :  Go to buffer 6
-  "n" <leader>b7  :  Go to buffer 7
-  "n" <leader>b8  :  Go to buffer 8
-  "n" <leader>b9  :  Go to buffer 9
```

### LSP-keymap

LSP-related keys are usually prefixed with `g` or `<leader>c`, I prefer to use `<leader>c` as `code operate` to memorize.
Here are the default keys I bind:

```
-  "n" <leader>ca  :  Show code action
-  "n" <leader>cn  :  Variable renaming
-  "n" <leader>cf  :  Format buffer
-  "n" <leader>cs  :  Enable or disable spell checking
-  "n" gI          :  Go to implementations
-  "n" gD          :  Go to type definitions
-  "n" gd          :  Go to definitions
-  "n" gr          :  Go to references
-  "n" gh          :  Show help information
-  "n" go          :  Show Workspace Diagnostics
-  "n" [g          :  Jump to prev diagnostic
-  "n" ]g          :  Jump to next diagnostic
-  "i" <c-j>       :  Toggle signature help
- "n", "i" <c-f>   : Scroll down floating window (only for lsp-hover and lsp-signature-help)
- "n", "i" <c-d>   : Scroll up floating window (only for lsp-hover and lsp-signature-help)
```

Additionally, there is a command `<leader>cy` that can be used to clear all cached YANK records.

### Code-Completion

It's nice to use [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with [vim-vsnip](https://github.com/hrsh7th/vim-vsnip) for code completion, it's very fast and stable, here are my default keybindings:

```
- "i" <c-k> : Toggle completion menu
- "i" <c-p> : select the previous completion suggestion
- "i" <c-n> : select the next completion suggestion
- "i" <c-d> : select the fifth completion suggestion below
- "i" <c-u> : select the fifth completion suggestion above
- "i" <cr>  : confirm current suggestion
- "i" <tab> : similar to vscode, if you do not enter the completion menu, select the next item, if you enter the completion menu, select the current item
- "i" <c-b> : scroll up the floating window
- "i" <c-f> : scroll down the floating window
```

Additionally, `<tab>` and `<s-tab>` can also be used in fragments, which behave the same as in vscode:

```
- "i" <tab> : jump backward
- "i" <s-tab> : jump forward
```

### Debug

Code debugging currently only supports Python and Golang, through [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [https://github.com/rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) And the combination of [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) gives me an IDE-like debugging experience.

I use `<leader>d` to enable code debugging, all `<f>` keys will only take effect after you actually enable debug mode:

```
-  "n" <leader>db  :  Mark or delete breakpoints
-  "n" <leader>dc  :  Clear breakpoints in the current buffer
-  "n" <leader>du  :  Toggle debug ui
-  "n" <leader>de  :  Execute debug expressions
-  "n" <F5>        :  Enable debugging or jump to the next breakpoint
-  "n" <F6>        :  Step into
-  "n" <F7>        :  Step over
-  "n" <F8>        :  Step out
-  "n" <F9>        :  Rerun debug
-  "n" <F10>       :  Close debug
```

Additionally, you can enter expressions by pressing `i` in the `repl` window.

### Find

All lookups are prefixed with `<leader>f`.

Currently it supports some of the following searches, and you can define more search methods.

```
-  "n" <leader>ff  :  Find files in the current workspace
-  "n" <leader>fg  :  Find string in the current workspace
-  "n" <leader>fo  :  Find telescope history
-  "n" <leader>fh  :  Find last lookup
-  "n" <leader>ft  :  Find all help document tags
-  "n" <leader>fm  :  Find marks in the current workspace
-  "n" <leader>fi  :  Find all neovim highlights
-  "n" <leader>fb  :  Find all buffers
-  "n" <leader>f/  :  Find all search history
-  "n" <leader>f:  :  Find all command history
-  "n" <leader>fn  :  Find notices history
-  "n" <leader>fd  :  Find todo tag in the current workspace
-  "n" <leader>fy  :  Find Clipboard History
-  "n" <leader>fc  :  Find the current file and open it in file explorer
```

They are provided by the following plugins respectively:

- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)

### Git

You can use `<leader>g` to view Git information in the current file, for Git management, I would use lazygit instead of any plugin for neovim.

These functions are provided by [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim):

```
-  "n" [c               :  Jump to the prev hunk
-  "n" ]c               :  Jump to the next hunk
-  "n" <leader>gl       :  Toggle current line blame
-  "n" <leader>gh       :  Preview current hunk
-  "n" <leader>gH       :  Show current block blame
-  "n" <leader>gd       :  Open deff view
-  "n" <leader>gD       :  Show deleted lines
-  "n", "v" <leader>gr  :  Reset current hunk
-  "n" <leader>gR       :  Reset current buffer
```

### Replace

The full workspace fuzzy string search and replace of vscode is very easy to use, there is also a corresponding plugin in neovim, I set its prefix key to `<leader>r`.

Also, after entering the fuzzy search and replace interface, you can use `?` to get more help.

This functionality is provided by [nvim-spectre](https://github.com/nvim-pack/nvim-spectre):

```
-  "n" <leader>rp  :  Replace characters in all files in the current workspace
-  "n" <leader>rf  :  Replace all characters in the current file
-  "n" <leader>rw  :  Replace the character under the cursor in all files under the current workspace
```

### Session

Restoring the working state after reopening the IDE is a feature that modern editors should have. You can directly use `<leader>sl` to restore the last session record.

In addition, `<leader>s` is also bound to some other keys.

This functionality is provided by [persisted.nvim](https://github.com/olimorris/persisted.nvim):

```
-  "n" <leader>ss  :  Save session
-  "n" <leader>sd  :  Delete session
-  "n" <leader>sl  :  Load session
```

### Terminal

The prefix key for the integrated terminal is `<leader>t`, the integrated terminal experience brought by the [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) plugin is very good:

```
- "n" <leader>tt : Toggle bottom or vertical terminal
- "n" <leader>tf : Toggle floating terminal
- "n" <leader>tv : Toggle vertical terminal
- "n" <leader>tg : Toggle lazygit terminal (requires lazygit installed)
- "n" <leader>ta : Toggle all terminal
```

The floating terminal and lazygit terminal can only open one, but the bottom terminal and side terminal can open many.

The default terminal number opened by `<leader>tt` is `1`, if you want to open a new terminal, please enter `{count}<leader>tt`

Notice! floating terminal number is 120, lazygit terminal number is 130.

### Translate

Well, translated commands are also prefixed with `<leader>t`. [translate.nvim](https://github.com/uga-rosa/translate.nvim) is definitely the best translation plugin I've ever seen.

```
-  "n", "v" <leader>tcs  :  Translate English to Chinese and open in split window
-  "n", "v" <leader>tcr  :  Translate English to Chinese and replace English
-  "n", "v" <leader>tcf  :  Translate English to Chinese and open in float window
-  "n", "v" <leader>tci  :  Translate English to Chinese and insert to next line
-  "n", "v" <leader>tcc  :  Translate English to Chinese and copy result to clipboard
-  "n" <leader>tcb       :  Translate English comment to Chinese and open in float window
-  "n" <leader>tcw       :  Translate English word to Chinese and open in float window

-  "n", "v" <leader>tes  :  Translate Chinese to English and open in split window
-  "n", "v" <leader>ter  :  Translate Chinese to English and replace Chinese
-  "n", "v" <leader>tef  :  Translate Chinese to English and open in float window
-  "n", "v" <leader>tei  :  Translate Chinese to English and insert to next line
-  "n", "v" <leader>tec  :  Translate Chinese to English and copy result to clipboard
-  "n" <leader>teb       :  Translate Chinese comment to English and open in float window
-  "n" <leader>tew       :  Translate Chinese word to English and open in float window
```

If you want to change the language, you can open the [nvim/lua/configure/plugins/nv_translate.lua](./lua/configure/plugins/nv_translate.lua) file and change the mapping.

Finally, don't forget to modify the key grouping description in the [nvim/lua/configure/plugins/nv_which-key.lua](./lua/configure/plugins/nv_which-key.lua) file.

### Upload

There are some buttons that can upload pictures to the Internet, and a makrdown picture link will be generated after the upload is complete。

[nvim-picgo](https://github.com/askfiy/nvim-picgo) is the first neovim plugin I wrote myself and I love it.

The prefix is `<leader>u`.

```
-  "n" <leader>uc  :  Upload image from clipboard
-  "n" <leader>uf  :  Upload image from disk file
```

### Multiple-cursors

It is common to quickly select a range of words and make changes. Here are the key bindings for multi-cursor mode:

```
"n" <tab> : Toggle between normal and visual mode
"n" <c-n> : Select down
"n" <c-p> : Select up
"n" <c-s> : Skip selection
"n" <c-d> : Delete the current selection
"n" <m-p> : Create cursor down
"n" <m-n> : Create cursor up
"n" [     : Go to Prev
"n" ]     : Go to next
"n" <esc> : Exit Multiple cursors mode
```

The plugin that provides multi-cursor mode is [vim-visual-multi](https://github.com/mg979/vim-visual-multi).

### Surround

It is very common to change `"` to `'` or `()` to `[]`.

You can make quick changes using the following keys:

```
"n" ys{range}{char} : Add Surround
"n" cs{char}{char}  : Changne Surround
"n" cq              : Toggle Surround
"n" ds{char}        : Delete Surround
"v" s               : Add Surround
```

This feature is provided by [surround.nvim](https://github.com/ur4ltz/surround.nvim), in addition, you can also use the `.` command to repeat the last modified surround work, which is provided by [vim-repeat ](https://github.com/tpope/vim-repeat).

### Comment

Good code needs to use comments, you can press the following shortcut keys to quickly add comments：

```
"n" gcc : Toggle line comment
"n" gcb : Toggle block comment
"n" gca : Insert line comment to line end
"n" gcj : Insert line comment to next line
"n" gck : Insert line comment to previous line
"n" gb{range} : Switch the specified line to a block comment

"v" gc  : Toggle line comment
"v" gb  : Toggle block comment
```

In addition, in some single-file multi-language environments (such as Vue), it also supports switching annotations according to context.

Well, these functions are provided by [Comment.nvim](https://github.com/numToStr/Comment.nvim) and [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring).

### Switch

It is common to quickly change `True` to `False`. Switching can be done quickly with `gs`.

If you want to add some words, you can edit the [nvim/lua/configure/plugins/nv_switch.lua](./lua/configure/plugins/nv_switch.lua) file.

In addition, using `gS` can quickly switch variable naming methods, such as:

```
variable_example => variableExample
```

As you can see, this feature is supported without the [switch](https://github.com/AndrewRadev/switch.vim) plugin.

### Emment

Use `<c-e>,` to quickly expand emment fragments.

`<c-e>` has some other functions, but it only works with certain types of files:

### Motions

With the [Hop](https://github.com/phaazon/hop.nvim) plugin, you can quickly jump to any position in the buffer:

```
-  "n", "v" ss  :  Jump to word head
-  "n", "v" sl  :  Jump to line
-  "n", "v" sf  :  Jump to search char on buffer
-  "n", "v" sc  :  Jump to search char on current line
```

### Drawing

Drawing with neovim is a cool feature when writing Markdown documents.

[venn](https://github.com/jbyuki/venn.nvim) implements this very cool feature.

Press `<leader>5` to open Venn, then try `<c-j/k/h/l>` to draw lines.

Select an area with `<c-v>` and press `f` or `b` you will get a solid or hollow box.

### Copillot

Use `<c-l>` to get copillot's suggestions in insert mode.
