require("core.setting")
require("core.options")
require("core.mapping")
require("core.plugins")
require("core.after")

if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    -- vim.o.guifont = "Rec Mono Duotone:h9"
    vim.o.guifont = "GoMono Nerd Font:h9"

    vim.opt.linespace = 0
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_refresh_rate = 60

    vim.g.neovide_confirm_quit = false

    vim.g.neovide_cursor_animation_length = 0.15
    vim.g.neovide_cursor_trail_size = 0.6

    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = true

    vim.g.neovide_cursor_vfx_mode = "torpedo"
    vim.g.neovide_profiler = false

    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set({ "n", "i", "t" }, "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set({ "n", "i", "t" }, "<C-->", function()
        change_scale_factor(1 / 1.25)
    end)

    vim.keymap.set({ "c", "t", "i" }, "<C-V>", "<C-R>+") -- Paste command mode

    vim.g.terminal_color_0 = "#6E6C7E"
    vim.g.terminal_color_1 = "#F28FAD"
    vim.g.terminal_color_2 = "#ABE9B3"
    vim.g.terminal_color_3 = "#FAE3B0"
    vim.g.terminal_color_4 = "#96CDFB"
    vim.g.terminal_color_5 = "#F5C2E7"
    vim.g.terminal_color_6 = "#89DCEB"
    vim.g.terminal_color_7 = "#D9E0EE"
    vim.g.terminal_color_8 = "#988BA2"
    vim.g.terminal_color_9 = "#F28FAD"
    vim.g.terminal_color_10 = "#ABE9B3"
    vim.g.terminal_color_11 = "#FAE3B0"
    vim.g.terminal_color_12 = "#96CDFB"
    vim.g.terminal_color_13 = "#F5C2E7"
    vim.g.terminal_color_14 = "#89DCEB"
    vim.g.terminal_color_15 = "#D9E0EE"

    vim.opt.cmdheight = 0
end
