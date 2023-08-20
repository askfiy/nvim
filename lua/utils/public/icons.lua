local M = {}

M.diagnostic = {
    Error = "",
    Warn = "",
    Info = "󰋽",
    Hint = "󰋽",
}

M.tag_level = {
    Fixme = "ﰡ",
    Hack = "ﰠ",
    Warn = "",
    Note = "󱞁",
    Todo = "",
    Perf = "ﮉ",
    Test = "󱜯"
}

M.lsp_kind = {
    -- lsp type
    String = "",
    Number = "",
    Boolean = "◩",
    Array = "",
    Object = "",
    Key = "",
    Null = "ﳠ",
    -- lsp kind
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Namespace = "",
    Field = "",
    Variable = "ﳋ",
    Class = "",
    Interface = "",
    Module = "ﰪ",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "󰅴",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "﬌",
    Event = "",
    Operator = "",
    TypeParameter = "",
    Default = "",
}

return M
