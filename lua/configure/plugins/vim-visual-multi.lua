-- https://github.com/mg979/vim-visual-multi

local utils = require("utils")
local mapping = require("core.mapping")

vim.g.VM_default_mappings = 0

vim.g.VM_maps = {
    ["Switch Mode"] = mapping.plugin.vim_visual_multi.switch_mode,
    ["Find Under"] = mapping.plugin.vim_visual_multi.find_under,
    ["Skip Region"] = mapping.plugin.vim_visual_multi.skip_region,
    ["Remove Region"] = mapping.plugin.vim_visual_multi.remove_region
}

utils.hi.set("VM_red", {fg = "White", bg = "Red", gui = "bold"})
utils.hi.set("VM_green", {fg = "White", bg = "Green", gui = "bold"})

vim.g.VM_Extend_hl = "VM_red"
vim.g.VM_Cursor_hl = "VM_red"
vim.g.VM_Mono_hl = "VM_green"
vim.g.VM_Insert_hl = "VM_green"
