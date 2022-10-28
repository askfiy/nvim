-- https://github.com/golang/tools/tree/master/gopls

local util = require("lspconfig.util")
local aux = require("utils.aux")

local root_files = {
    "go.work",
    "go.mod",
    ".git",
}

return {
    cmd = { "gopls" },
    single_file_support = true,
    filetypes = { "go", "gomod", "gotmpl" },
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname)
    end,
}
