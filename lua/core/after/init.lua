local options = require("core.options")

vim.g.vsnip_filetypes = {
    javascript = {"typescript"},
    typescript = {"javascript"},
    vue = {"javascript", "typescript"},
}

vim.g.vsnip_snippet_dir = options.code_snippet_directory
vim.g.dbs = options.database_config

require("core.after.load_mapping")
require("core.after.load_snippet")
require("core.after.input_toggle")
