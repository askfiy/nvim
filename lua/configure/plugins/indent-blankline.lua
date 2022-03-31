-- https://github.com/lukas-reineke/indent-blankline.nvim

-- disable indent in file type
vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "aerial",
    "undotree",
    "spectre_panel",
    "dbui",
    "toggleterm",
    "packer",
    "help"
}

require("indent_blankline").setup(
    {
        show_current_context = true,
        show_current_context_start = true,
        show_end_of_line = true
    }
)
