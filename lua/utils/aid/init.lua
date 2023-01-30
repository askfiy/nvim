local M = {
    _import_modules = {
        "cfg",
        "lsp",
    },
}

for _, name in ipairs(M._import_modules) do
    M = vim.tbl_deep_extend("force", M, require(string.format("utils.aid.pkg.%s", name)) or {})
end

return M
