-- https://github.com/mg979/vim-visual-multi

local mapping = require("core.mapping")

vim.g.VM_default_mappings = 0

vim.g.VM_maps = {
    ["Switch Mode"] = mapping.plugin.vim_visual_multi.switch_mode,
    ["Find Under"] = mapping.plugin.vim_visual_multi.find_under,
    ["Skip Region"] = mapping.plugin.vim_visual_multi.skip_region,
    ["Remove Region"] = mapping.plugin.vim_visual_multi.remove_region,
    ["Add Cursor Up"] = mapping.plugin.vim_visual_multi.add_cursor_to_up,
    ["Add Cursor Down"] = mapping.plugin.vim_visual_multi.add_cursor_to_down
}

vim.g.VM_Extend_hl = "VM_mode1"
vim.g.VM_Cursor_hl = "VM_mode1"
vim.g.VM_Mono_hl = "VM_mode2"
vim.g.VM_Insert_hl = "VM_mode2"
