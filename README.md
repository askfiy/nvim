# Documentation

## illustrate

Self-use neovim configuration. Written entirely in Lua, based on neovim 0.7.

It starts very fast, and 90% of the plugins are lazy loaded:

![图片](https://user-images.githubusercontent.com/81478335/160888684-419daafc-bdcd-48fd-af49-74950ebc0d21.png)

This configuration is updated for a long time, you can use it with confidence.

Now, it supports the following languages, you only need to do very few things to develop happily:

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

## todo

- Add more LSP services configuration
- Add more DAP configuration
- Support for more languages
- Script for one-click installation
- Input switching scheme for windows and mac platforms

## dependencies

Basic dependencies:

- [neovim > 0.7](https://github.com/neovim/neovim)
- [gcc](https://gcc.gnu.org/)
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

I copied a quick install script from someone else's repository, I'm not sure if it's available.

But it should help you, don't forget to add execute permission to the file before executing.

They are:

- Linux Mac: [linux-mac.sh](./resource/linux-mac.sh)
- Windows: [windows.ps1](./resource/windows.ps1)

I prefer to download all dependent projects manually, take `arch` as an example:

```
-- Use the system clipboard
$ yay -S xsel

-- Fuzzy search
$ yay -S fd
$ yay -S sed
$ yay -S ripgrep

-- Code format
$ npm install -g lua-fmt
$ npm install -g prettier
$ npm install -g gofmt
$ pip3 install autopep8
$ pip3 install sqlformat

-- Translate
$ yay -S translate-shell

-- markdown preview
$ yay -S pandoc
$ npm install -g live-server

-- Golang debug
$ yay -S delve

-- Python debug
$ python3 -m pip install debugpy

-- Python diagnostics (optional)
$ pip3 install pylint

-- If you use Pyrigth to diagnose Django code, you should install it
$ pip3 install django-stubs

-- Lazygit
$ yay -S lazygit

-- Tabnine require
$ yay -S unzip
$ yay -S curl
```

## content

Directory listing:

```

.
├── ftplugin
│   └── ...
├── lint
│   └── ...
├── lua
│   ├── configure
│   │   ├── dap
│   │   │   └── ...
│   │   ├── lsp
│   │   │   ├── requires
│   │   │   │   └── ...
│   │   │   └── ...
│   │   └── plugins
│   │       └── ...
│   ├── core
│   │   ├── after
│   │   │   ├── init.lua
│   │   │   ├── input_toggle.lua
│   │   │   ├── load_mapping.lua
│   │   │   └── load_snippet.lua
│   │   ├── mapping.lua
│   │   ├── options.lua
│   │   ├── plugins.lua
│   │   └── setting.lua
│   └── utils
│       ├── api.lua
│       ├── icons.lua
│       └── notices.lua
├── README.md
├── resources
│   └── ...
├── snippets
│   └── ...
└── init.lua
```

Directory Description:

- ftplugin/: the directory where language indentation rules are stored
- lint/: lint code diagnostic configuration file storage directory
- lua/ : project home directory
- lua/configure/: plugin, LSP, DAP configuration
- lua/configure/dap/: debugger configuration
- lua/configure/lsp/: language server configuration
- lua/configure/plugins/: plugin configuration
- lua/configure/lsp/requires/: LSP dependencies
- lua/core/: core configuration
- lua/core/after/: Configuration loaded after initialization is complete
- utils/: functional configuration
- resources/: some external programs not related to the project itself
- snippets/: Snippet configuration

File Description:

- [init.lua](./init.lua): project entry file
- [lua/core/setting.lua](./lua/core/setting.lua): neovim original setting
- [lua/core/options.lua](./lua/core/options.lua): user-defined configuration items
- [lua/core/mapping.lua](./lua/core/mapping.lua): user-defined shortcut keys
- [lua/core/plugins.lua](./lua/core/plugins.lua): all plugin configurations loaded
- [lua/core/after/init.lua](./lua/core/after/init.lua): the entry file after all configuration items are loaded，In addition, it is also responsible for defining the global variable configuration of some plugins
- [lua/core/after/input_toggle.lua](./lua/core/after/input_toggle.lua): the input method switching scheme that needs to be loaded, currently only supports [fcixt5](https://github.com/fcitx/fcitx5) of the Linux platform
- [lua/core/after/load_mapping.lua](./lua/core/after/load_mapping.lua): Load all user-defined keys
- [lua/core/after/load_snippet.lua](./lua/core/after/load_snippet.lua): Load different code snippets under different conditions
- [lua/utils/api.lua](./lua/utils/api.lua): defines some functions that can be easily used
- [lua/utils/icons.lua](./lua/utils/icons.lua): you can specify some icons here
- [lua/utils/notices.lua](./lua/utils/notices.lua): store user-defined notification messages

## key bindings

Ninety-nine percent of the keys are set in the [mapping.lua](./lua/core/mapping.lua) file.

You can centrally manage the keys of each plugin.

It's worth noting that `<c-e>` and `<c-y>` are now replaced by moving the buffer to the left or right.

`ss` is to jump to a word, `sl` is to jump to a certain column, `sc` is to search for a character and jump.

For other key bindings you can open the [mapping.lua](./lua/core/mapping.lua) file to see.

## icon setting

I have defined a set of [vscode](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf) icon schemes that you need to install to use.

Set in [options.lua](./lua/core/options.lua) file:

```
-- options.icons = "kind"
options.icons = "vscode"
```

## lint diagnostics

I installed the [nvim-lint](https://github.com/mfussenegger/nvim-lint) plugin, you can use diagnostic tools like eslint, pylint, etc.

Take pylint as an example, first you need to set the disable of [nvim-lint](https://github.com/mfussenegger/nvim-lint) in the [plugins.lua](./lua/core/plugins.lua) file is false.

Then use the PackerSync command to install the [nvim-lint](https://github.com/mfussenegger/nvim-lint) plugin.

Open the [pyright.lua](./lua/configure/lsp/pyright.lua) file and comment out the diagnostics from nvim-lsp:

```
-- If you want to enable pylint diagnostics, turn on the comments below
["textDocument/publishDiagnostics"] u003d function(...)
end
```

Install pylint using the pip tool, and then you can use pylint.

You can configure pylint diagnostics in [pylint.conf](./lint/pylint.conf).

If you don't want to use pylint or any other lint, you should disable the nvim-lint plugin. set in [plugins.lua](./lua/core/plugins.lua) .

## enable copilot

input command:

```
$ Copilot setup
```

Record your verification code and enter it in your browser.

## possible problems

If prompted with tabnine problems, you should install the curl and unzip commands first, after execute command:

```
$ ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```

If the icon shows an error, you should install [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)，And the font of the terminal needs to be changed.

## some commands

```
PackerStatus: View plug-in running status
PackerSync: Update plugins
VsnipOPen: define code snippets
MarkdownPreview: Preview markdown files
LspInfo: View LSP running status
LSPInstallInfo: View LSP download status
```

## some resource links

- [Code formatter download](https://github.com/sbdchd/neoformat#supported-filetypes)
- [Configure new lint](https://github.com/mfussenegger/nvim-lint)
- [Configure new DAP debugger](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation)
- [Configure new LSP file (1)](https://github.com/williamboman/nvim-lsp-installer#available-lsps)
- [Configure new LSP file (2)](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

## known bugs

In my daily use, I will encounter some bugs from the plug-in itself. I hereby appeal to everyone to help me go to the original plug-in address and submit ISSUES, so that they can be repaired faster:

- [vim-visual-multi](https://github.com/mg979/vim-visual-multi)： &lt;c-n&gt; and &lt;c-p&gt; of completion menu do not work when completion menu is visible
