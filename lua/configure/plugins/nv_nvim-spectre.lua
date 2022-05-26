-- https://github.com/nvim-pack/nvim-spectre

local aux = require("utils.api.aux")
local mapping = require("core.mapping")

local M = {}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "spectre")
    if not ok then
        return
    end

    M.spectre = m
    M.spectre.setup()
end

function M.after() end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>rp",
            rhs = function()
                aux.toggle_sidebar("spectre_panel")
                require("spectre").open()
            end,
            options = { silent = true },
            description = "Replace characters in all files in the current workspace",
        },
        {
            mode = { "n" },
            lhs = "<leader>rf",
            rhs = function()
                aux.toggle_sidebar("spectre_panel")
                -- FIX: Invalid selected word ..
                -- vim.cmd("normal! viw")
                require("spectre").open_file_search()
            end,
            options = { silent = true },
            description = "Replace all characters in the current file",
        },
        {
            mode = { "n" },
            lhs = "<leader>rw",
            rhs = function()
                aux.toggle_sidebar("spectre_panel")
                require("spectre").open_visual({ select_word = true })
            end,
            options = { silent = true },
            description = "Replace the character under the cursor in all files under the current workspace",
        },
    })
end

return M
