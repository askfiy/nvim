local options = require("core.options")
local api = require("utils.api")

M = {}

local lsp_requires_dirs = api.path.join(vim.fn.stdpath("config"), "lua", "configure", "lsp", "requires")

if options.platform_info == "UNIX" then
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-linux")
elseif M.platform_info == "MAC" then
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-mac")
else
    M.zeta_path = api.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-win.exe")
end

if options.platform_info ~= "dos" and vim.fn.executable(M.zeta_path) == 0 then
    vim.fn.system(
        {
            "chmod",
            "+x",
            M.zeta_path
        }
    )
end

return M
