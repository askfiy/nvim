-- https://github.com/petertriho/nvim-scrollbar

local colors = {
    color = "#292E42",
    Search = "#FC867",
    Error = "#FD6883",
    Warn = "#FFD886",
    Info = "A9DC76",
    Hint = "#78DCE8",
    Misc = "#AB9DF2"
}

require("scrollbar").setup(
    {
        handle = {
            -- scroller color
            color = colors.color
        },
        marks = {
            -- diagnostics color, need lsp suppert
            Search = {color = colors.Search},
            Error = {color = colors.Error},
            Warn = {color = colors.Warn},
            Info = {color = colors.Info},
            Hint = {color = colors.Hint},
            Misc = {color = colors.Misc}
        }
    }
)
