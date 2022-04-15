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
- [fd](https://link.zhihu.com/?target=https%3A//github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [translate-shell](https://github.com/soimort/translate-shell)

Other dependencies:

- tar curl git gzip wget
- node npm
- xsel
- [lazygit](https://github.com/jesseduffield/lazygit)

I copied a quick install script from someone else's repository, I'm not sure if it's available.

But it should help you, don't forget to add execute permission to the file before executing.

They are:

- Linux Mac: [linux-mac.sh](./resource/linux-mac.sh)
- Windows: [windows.ps1](./resource/windows.ps1)

I prefer to download all dependent projects manually, take `arch` as an example:

```
-- use the system clipboard
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
$ yay -S trans

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

-- lazygit
$ yay -S lazygit
```

## content

Directory listing:

```
.
├── ftplugin
│   └── ...
├── init.lua
├── lint
│   └── ...
├── lua
│   ├── configure
│   │   ├── dap
│   │   │   └── ...
│   │   ├── lsp
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
│       └── ...
├── resource
│   └── ....
└── snippets
```

Directory Description：

- core: Core directory
- configure: LSP、DAP、Plugins configuration
- utils: Some wrapped API functions
- after: Last loaded configuration

File Description:

- mapping: Key binding
- options: User settings
- settings: System settings

## key bindings

Ninety-nine percent of the keys are set in the [mapping.lua](./lua/core/mapping.lua) file.

You can centrally manage the keys of each plugin.

It's worth noting that `<c-e>` and `<c-y>` are now replaced by moving the buffer to the left or right.

`ss` is to jump to a word, `sl` is to jump to a certain column, `sc` is to search for a character and jump.

For other key bindings you can open the [mapping.lua](./lua/core/mapping.lua) file to see.

## enable lint diagnostics

I installed the [nvim-lint](https://github.com/mfussenegger/nvim-lint) plugin, you can use diagnostic tools like eslint, pylint, etc.

Take pylint as an example, first you need to set the disable of [nvim-lint](https://github.com/mfussenegger/nvim-lint) in the [plugins.lua](./lua/core/plugins.lua) file is false.

Then use the PackerSync command to install the [nvim-lint](https://github.com/mfussenegger/nvim-lint) plugin.

Open the [pyright.lua](./lua/configure/lsp/pyright.lua) file and comment out the diagnostics from nvim-lsp:

````
-- If you want to enable pylint diagnostics, turn on the comments below
["textDocument/publishDiagnostics"] u003d function(...)
end
````

Install pylint using the pip tool, and then you can use pylint.

You can configure pylint diagnostics in [pylint.conf](./lint/pylint.conf).

## possible problems

If prompted with tabnine problems, you should:

```
$ ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```

If the icon shows an error, you should install [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)，And the font of the terminal needs to be changed.

I have defined a set of [vscode](https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf) icon schemes that you need to install to use.

Set in [options.lua](./lua/core/options.lua) file:

```
-- options.icons = "kind"
options.icons = "vscode"
```

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

- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets): Can't add Django filetypes, so I used Django snippets from vscode
