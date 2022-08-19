local icons = {}

icons.platform = {
    unix = "",
    dos = "",
    mac = "",
}

icons.diagnostic = {
    Error = "",
    Warn = "",
    Info = "ﬤ",
    Hint = "",
}

icons.tag_level = {
    Fixme = "ﰡ",
    Hack = "ﰠ",
    Warn = "",
    Note = "ﮉ",
    Todo = "ﮉ",
    Perf = "ﮉ",
}

icons.lsp_kind = {
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
    Field = "ﰠ",
    Variable = "ﳋ",
    Class = "",
    Interface = "",
    Module = "ﰪ",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "﬌",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

return icons
