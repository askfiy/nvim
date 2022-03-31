-- https://github.com/lewis6991/gitsigns.nvim/

local mapping = require("core.mapping")

require("gitsigns").setup(
    {
        -- default add and change text: │
        signs = {
            add = {hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
            change = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
            delete = {hl = "GitSignsDelete", text = "-", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
            topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
            changedelete = {hl = "GitSignsChange", text = "_", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
        },
        on_attach = function(bufnr)
            mapping.register("buffer", "gitsigns", bufnr)
        end
    }
)
