local options = require("core.options")
local utils = require("utils")

M = {}

local lsp_requires_dirs = utils.path.join(vim.fn.stdpath("config"), "lua", "configure", "lsp", "requires")

if options.platform_info == "UNIX" then
    M.zeta_path = utils.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-linux")
elseif M.platform_info == "MAC" then
    M.zeta_path = utils.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-mac")
else
    M.zeta_path = utils.path.join(lsp_requires_dirs, "zeta-note", "zeta-note-win.exe")
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
