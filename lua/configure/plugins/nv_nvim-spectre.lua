-- https://github.com/nvim-pack/nvim-spectre

local api = require("utils.api")
local aux_public = require("utils.aux.public")

local M = {
    safe_requires = {
        { "spectre" },
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.spectre.setup()
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>rp",
            rhs = function()
                aux_public.toggle_sidebar("spectre_panel")
                require("spectre").open()
            end,
            options = { silent = true },
            description = "Replace characters in all files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>rf",
            rhs = function()
                aux_public.toggle_sidebar("spectre_panel")
                require("spectre").open_file_search()
            end,
            options = { silent = true },
            description = "Replace all characters in the current file",
        },
        {
            mode = { "n" },
            lhs = "<leader>rwf",
            rhs = function()
                aux_public.toggle_sidebar("spectre_panel")
                require("spectre").open_visual({
                    select_word = true,
                    ---@diagnostic disable-next-line: missing-parameter
                    path = vim.fn.fnameescape(vim.fn.expand("%:p:.")),
                })
            end,
            options = { silent = true },
            description = "Replace the character under the cursor in the current file",
        },
        {
            mode = { "n" },
            lhs = "<leader>rwp",
            rhs = function()
                aux_public.toggle_sidebar("spectre_panel")
                require("spectre").open_visual({ select_word = true })
            end,
            options = { silent = true },
            description = "Replace the character under the cursor in all files under the current workspace",
        },
    })
end

return M
