-- https://github.com/ethanholz/nvim-lastplace

require("nvim-lastplace").setup(
    {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
    }
)
