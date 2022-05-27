-- https://github.com/mbbill/undotree

local aux = require("utils.api.aux")
local path = require("utils.api.path")
local mapping = require("core.mapping")

local M = {
    undotree_dir = path.join(vim.fn.stdpath("cache"), "undotree"),
}

function M.entrance()
    M.register_global_key()

    -- style: default 1, optional: 1 2 3 4
    -- vim.g.undotree_WindowLayout = 2

    -- custom window
    vim.g.undotree_CustomUndotreeCmd = "topleft vertical 30 new"
    vim.g.undotree_CustomDiffpanelCmd = "belowright 10 new"

    -- auto focus default 0
    vim.g.undotree_SetFocusWhenToggle = 1

    if vim.fn.has("persistent_undo") == 1 then
        ---@diagnostic disable-next-line: missing-parameter
        local target_path = vim.fn.expand(M.undotree_dir)
        if not vim.fn.isdirectory(target_path) then
            vim.fn.mkdir(target_path, "p", 0700)
        end
        vim.o.undodir = target_path
        vim.o.undofile = true
    end
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>3",
            -- rhs = ":UndotreeToggle<cr>",
            rhs = function()
                aux.toggle_sidebar("undotree")
                vim.cmd("UndotreeToggle")
            end,
            options = { silent = true },
            description = "Open Undo Explorer",
        },
    })
end

return M
