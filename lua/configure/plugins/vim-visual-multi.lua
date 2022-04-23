-- https://github.com/mg979/vim-visual-multi

local mapping = require("core.mapping")

vim.g.VM_default_mappings = 0

vim.g.VM_Extend_hl = "VM_mode1"
vim.g.VM_Cursor_hl = "VM_mode1"
vim.g.VM_Mono_hl = "VM_mode2"
vim.g.VM_Insert_hl = "VM_mode2"

mapping.register("plugin", "vim_visual_multi")
