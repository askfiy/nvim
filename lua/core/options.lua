local api = require("utils.api")

local options = {}

options.transparency_background = true
options.python_interpreter_path = "/usr/bin/python3"
options.code_snippet_directory = api.path.join(vim.fn.stdpath("config"), "snippets")
options.nvim_lint_dir = api.path.join(vim.fn.stdpath("config"), "lint")
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
