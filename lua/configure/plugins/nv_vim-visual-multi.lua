-- https://github.com/mg979/vim-visual-multi

local mapping = require("core.mapping")

local M = {}

function M.entrance()
    M.register_global_key()
    vim.g.VM_Extend_hl = "VM_Extend_hi"
    vim.g.VM_Cursor_hl = "VM_Cursor_hi"
    vim.g.VM_Mono_hl = "VM_Mono_hi"
    vim.g.VM_Insert_hl = "VM_Insert_hi"
    vim.g.VM_default_mappings = 0

    vim.g.VM_maps = {
        ["Find Under"] = "<c-n>",
        ["Find Prev"] = "<c-p>",
        ["Skip Region"] = "<c-s>",
        ["Remove Region"] = "<c-d>",
    }
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<m-p>",
            rhs = ":call vm#commands#add_cursor_up(0, v:count1)<cr>",
            options = { silent = true },
            description = "Create cursor down",
        },
        {
            mode = { "n" },
            lhs = "<m-n>",
            rhs = ":call vm#commands#add_cursor_down(0, v:count1)<cr>",
            options = { silent = true },
            description = "Create cursor up",
        },
    })
end

return M
