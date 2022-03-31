-- https://github.com/rcarriga/nvim-notify

local options = require("core.options")

local notify_opts = {
    -- animation style
    -- • fade_in_slide_out
    -- • fade
    -- • slide
    -- • static
    stages = "fade",
    -- default: 5000
    timeout = 2000
}

if options.transparency_background then
    notify_opts.background_colour = "#ffffff"
end

vim.notify = require("notify")

vim.notify.setup(notify_opts)

-- how to use
-- leveal: info、warn、error、debug、trace
-- demo:
-- vim.notify("hello world", "info", {title = "info"})
