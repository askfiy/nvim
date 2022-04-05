M = {}
M.path = {}

function M.path.join(...)
    local path_string = ""
    for _, path in ipairs({...}) do
        path_string = path_string .. path .. "/"
    end
    return path_string:sub(1, #path_string - 1)
end

function M.path.exists(path)
    local file = io.open(path, "r")
    if file then
        io.close(file)
        return true
    end
    return false
end

M.module = {}

function M.module.get_module(name)
    local ok, m = pcall(require, name)
    return ok, m
end

M.string = {}

function M.string.title(str)
    return (str:gsub(
        "(%a)([%w_']*)",
        function(first, rest)
            return first:upper() .. rest:lower()
        end
    ))
end

M.hi = {}

function M.hi.set(name, opts)
    local command = "highlight " .. name
    for k, v in pairs(opts) do
        if k ~= "gui" then
            command = command .. " gui" .. k .. "=" .. v
        else
            command = command .. " " .. k .. "=" .. v
        end
    end
    vim.cmd(command)
end

M.icons = {}

M.icons.kind = {
    Text = "",
    Method = "פּ",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "﬌",
    Event = "",
    Operator = "",
    TypeParameter = "",
    -- extra
    String = "s",
    Collapsed = ""
}

M.icons.vscode = {
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

-- M.icons.kind_backup = {
--     "", "", "", "",
--     "", "", "", "", "了", "",
--     "", "", "", "", "ﰮ", "",
--     "ƒ", "", "", "", "","",
--     "", "", "", "", "ﲃ", ""
-- }

return M
