# README

## introduce

![](https://img.shields.io/badge/neovim-0.8-green?style=plastic&logo=Neovim) ![](https://img.shields.io/badge/Lua-Jit-green?style=plastic&logo=Lua)

This is a configuration based on neovim 0.8, it has good extensibility, and at the same time it is very beautiful, I have done a lot of highlight customization to the catppuccin theme.

- Can be used directly without complicated configuration
- Reasonable key bindings
- Has the functions of most IDEs

## screenshot

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/20220628175433.png)

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/20220628175834.png)

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/20220628180054.png)

## dependencies

Download the following dependencies according to your usage:

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
$ npm install picgo -g

-- * mysql client linker
$ yay -S percona-server-clients

-- * Persistent save history yank records
$ yay -S sqlite3

-- * Command-line tool to put files into recycle bin
$ yay -S trash-cli
```

## install and use

```
$ cd ~/.config/
$ mv nvim ./nvim-bak -- if you haven't configured Neovim yourself, this step can be omitted
$ git clone https://github.com/askfiy/nvim
$ cd ~/.config/nvim
$ git checkout neovim-0.8
```

## personalized configuration

Open [settings.lua](./lua/core/setting.lua) Modify according to your personal preference.

Open [options.lua](./lua/core/options.lua) to customize your configuration.

Open [icons.lua](./lua/utils/icons.lua) change custom icons.

## add LSP configuration

If you want to add a new LSP configuration, open the [nv_nvim-lsp-installer.lua](./lua/configure/plugins/nv_nvim-lsp-installer.lua) file and add the name of the LSP server in installer_servers.

If you need to configure the added LSP, you can create a new lua file with the same name in the [lua/configure/lsp](./lua/configure/lsp) directory and write the configuration.

```
local M = {
    ...
    installer_servers = {
        "new lsp name"
    },
}
```

## add DAP configuration

If you want to add a new DAP configuration, you only need to create a new lua file in the [./lua/configure/dap](./lua/configure/dap) directory, and write the DAP configuration in it, the following is Python DAP configuration file:

```
return {
    adapters = {
        -- add the name of the adapters
        python = {
            ...
        },
    },
    configurations = {
        -- add the name of the configuration
        python = {
            ...
    }
}
```

## key binds

The following are commonly used keys and descriptions, leader key is space.

If you want to modify some keys, you can find them in the plugin's configuration file and modify them.

Some plugins default key descriptions are stored in the [nv_which-key.lua](./lua/configure/plugins/nv_which-key.lua) file, you may need to modify them.

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


- "n" <leader>1  : Open File Explorer
- "n" <leader>2  : Open Outilne Explorer
- "n" <leader>3  : Open Undo Explorer
- "n" <leader>4  : Open Database Explorer
- "n" <leader>5  : Open Venn Mode (drawing mode)


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

-  "n" <leader>ca  :  Show code action
-  "n" <leader>cn  :  Variable renaming
-  "n" <leader>cf  :  Format buffer
-  "n" <leader>cs  :  Enable or disable spell checking
-  "n" <leader>cp  :  Open copilot panel
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

- "i" <c-k> : Toggle completion menu
- "i" <c-p> : select the previous completion suggestion
- "i" <c-n> : select the next completion suggestion
- "i" <c-d> : select the fifth completion suggestion below
- "i" <c-u> : select the fifth completion suggestion above
- "i" <cr>  : confirm current suggestion
- "i" <tab> : similar to vscode, if you do not enter the completion menu, select the next item, if you enter the completion menu, select the current item
- "i" <c-b> : scroll up the floating window
- "i" <c-f> : scroll down the floating window

- "i" <tab> : jump backward
- "i" <s-tab> : jump forward

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

-  "n" [c               :  Jump to the prev hunk
-  "n" ]c               :  Jump to the next hunk
-  "n" <leader>gl       :  Toggle current line blame
-  "n" <leader>gh       :  Preview current hunk
-  "n" <leader>gH       :  Show current block blame
-  "n" <leader>gd       :  Open deff view
-  "n" <leader>gD       :  Show deleted lines
-  "n", "v" <leader>gr  :  Reset current hunk
-  "n" <leader>gR       :  Reset current buffer

-  "n" <leader>rp  :  Replace characters in all files in the current workspace
-  "n" <leader>rf  :  Replace all characters in the current file
-  "n" <leader>rwf :  Replace the character under the cursor in the current file
-  "n" <leader>rwp :  Replace the character under the cursor in all files under the current workspace
-  "n" <leader>ss  :  Save session
-  "n" <leader>sd  :  Delete session
-  "n" <leader>sl  :  Load session

- "n" <leader>tt : Toggle bottom or vertical terminal
- "n" <leader>tf : Toggle floating terminal
- "n" <leader>tv : Toggle vertical terminal
- "n" <leader>tg : Toggle lazygit terminal (requires lazygit installed)
- "n" <leader>ta : Toggle all terminal

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

-  "n" <leader>uc  :  Upload image from clipboard
-  "n" <leader>uf  :  Upload image from disk file

-  "n" <tab> : Toggle between normal and visual mode
-  "n" <c-n> : Select down
-  "n" <c-p> : Select up
-  "n" <c-s> : Skip selection
-  "n" <c-d> : Delete the current selection
-  "n" <m-p> : Create cursor down
-  "n" <m-n> : Create cursor up
-  "n" [     : Go to Prev
-  "n" ]     : Go to next
-  "n" <esc> : Exit Multiple cursors mode
-  "n" <c-l> : Suggestions for choosing copilot

-  "n" ys{range}{char} : Add Surround
-  "n" cs{char}{char}  : Changne Surround
-  "n" cq              : Toggle Surround
-  "n" ds{char}        : Delete Surround
-  "v" s               : Add Surround

-  "n" gcc : Toggle line comment
-  "n" gcb : Toggle block comment
-  "n" gca : Insert line comment to line end
-  "n" gcj : Insert line comment to next line
-  "n" gck : Insert line comment to previous line
-  "n" gb{range} : Switch the specified line to a block comment

-  "v" gc  : Toggle line comment
-  "v" gb  : Toggle block comment

-  "n" gs  : Switch the opposite meaning of the word
-  "n" gS  : Switch variable naming style

-  "n", "v" ss  :  Jump to word head
-  "n", "v" sl  :  Jump to line
-  "n", "v" sf  :  Jump to search char on buffer
-  "n", "v" sc  :  Jump to search char on current line
```

## some commands

```
- PackerSync      : Update plugin
- MarkdownPreview : Preview markdown file
- VsnipOpen       : Open a user-defined snippet
- LspInfo         : View LSP server running status
- LspInstallInfo  : View LSP server download status
- TSUpdate all    : Update tree-sitter parser
- Copilot setup   : login copilot
```
