local path = require("utils.api.path")

local options = {}

-- Hide cursor in nvim-tree and aerial
options.hidden_cursor_on_view = true
-- Auto save Buffer
options.auto_save_buffer = true
-- Automatically switch input method, currently only for Linux and Fcitx5
options.auto_switch_input = true

-- Icon style to use
-- • vscode
-- • kind（default）
options.icons_style = "kind"
-- theme style to use
-- • catppuccin
options.colorscheme = "catppuccin"
-- Whether the background is transparent
-- • boolean
options.transparent_background = false
-- Python interpreter path
-- • string
options.python_interpreter_path = "/usr/bin/python3"
-- lint configuration file
-- • string
options.nvim_lint_dir = path.join(vim.fn.stdpath("config"), "lint")
-- Code snippet storage directory
-- • string
options.code_snippets_directory = path.join(vim.fn.stdpath("config"), "snippets")
-- database link configuration
options.database_config = {
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
