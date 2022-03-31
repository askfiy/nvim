-- https://github.com/folke/which-key.nvim

require("which-key").setup(
    {
        plugins = {
            spelling = {
                -- Whether to take over the default zu003d behavior
                enabled = true,
                suggestions = 20
            }
        }
    }
)
