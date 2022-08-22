local api = require("utils.api")

local options = {}

options.transparent = false
options.float_border = true
options.show_winbar = true

options.download_source = "https://github.com/"
-- options.download_source = "https://hub.fastgit.xyz/"

options.lint_directory = api.path.join(vim.fn.stdpath("config"), "lint")
options.snippets_directory = api.path.join(vim.fn.stdpath("config"), "snippets")

-- auto command manager
options.auto_save = true
options.auto_switch_input = true
options.auto_restore_cursor_position = true
options.auto_remove_new_lines_comment = true

options.database_connect = {
    {
        name = "pg",
        url = "postgres://postgres:123456@localhost:5430/jg037",
    },
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1",
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test",
    },
}

return options
