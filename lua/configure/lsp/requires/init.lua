local api = require("utils.api")

M = {}

local lsp_requires_dirs = api.path.join(vim.fn.stdpath("config"), "lua", "configure", "lsp", "requires")

if vim.bo.fileformat == "unix" then
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-linux")
elseif vim.bo.fileformat == "mac" then
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-mac")
else
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-win.exe")
end

if vim.bo.fileformat ~= "dos" and vim.fn.executable(M.zeta_path) == 0 then
    vim.fn.system(
        {
            "chmod",
            "+x",
            M.zeta_path
        }
    )
end

return M
