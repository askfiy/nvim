local utils = require("utils")

local options = {}

options.platform_info = vim.bo.fileformat:upper()
options.transparency_background = false
options.python_interpreter_path = "/usr/bin/python3"
options.code_snippet_directory = utils.path.join(vim.fn.stdpath("config"), "snippets")
options.nvim_lint_dir = utils.path.join(vim.fn.stdpath("config"), "lint")

options.database_config = {
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1"
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test"
    }
}

options.kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
    -- extra
    Package = "",
    String = "s",
    Collapsed = "",
    -- customize
    -- not used
    Calc = "",
    Spell = "",
    Emoji = "ﲃ"
}

options.source_icons = {
    vsnip = "",
    nvim_lsp = "",
    path = "",
    buffer = "",
    cmdline = "",
    ["vim-dadbod-completion"] = ""
}

options.vscode_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

return options
