local requires = require("configure.lsp.requires")

return {
    cmd = {requires.zeta_path},
    root_dir = function()
        return vim.fn.getcwd()
    end
}
