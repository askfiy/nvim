local utils = require("utils")

local options = {}

options.platform_info = vim.bo.fileformat:upper()
options.transparency_background = false
options.python_interpreter_path = "/usr/bin/python3"
options.code_snippet_directory = utils.path.join(vim.fn.stdpath("config"), "snippets")
options.nvim_lint_dir = utils.path.join(vim.fn.stdpath("config"), "lint")
options.icons = "kind"

options.database_config = {
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1"
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test"
    }
}

return options
