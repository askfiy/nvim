-- https://github.com/rcarriga/nvim-notify

local options = require("core.options")
local mapping = require("core.mapping")

local M = {}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "notify")
	if not ok then
		return
	end

	local notify_options = {
		-- animation style
		-- • fade_in_slide_out
		-- • fade
		-- • slide
		-- • static
		stages = "static", -- Under a transparent background, only static will ensure normal display effect
		-- default: 5000
		timeout = 3000,
	}

	if options.transparent_background then
		notify_options.background_colour = "#ffffff"
	end

	m.setup(notify_options)

	vim.notify = m
end

function M.after() end

function M.register_global_key()
	mapping.register({
		{
			mode = { "n" },
			lhs = "<leader>fn",
			rhs = function()
				require("telescope").extensions.notify.notify()
			end,
			options = { silent = true },
			description = "Show notices history",
		},
	})
end

return M
