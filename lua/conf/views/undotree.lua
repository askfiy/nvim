-- https://github.com/mbbill/undotree

local api = require("utils.api")
local public = require("utils.public")

local M = {}

function M.before()
    M.register_key()
end

function M.load()
    local undotree_dir = api.path.join(vim.fn.stdpath("cache"), "undotree")

    -- style: default 1, optional: 1 2 3 4
    -- vim.g.undotree_WindowLayout = 2

    -- custom window
    -- vim.g.undotree_CustomUndotreeCmd = "topleft vertical 30 new"
    -- vim.g.undotree_CustomDiffpanelCmd = "belowright 10 new"

    -- auto focus default 0
    vim.g.undotree_SetFocusWhenToggle = 1

    if vim.fn.has("persistent_undo") == 1 then
        ---@diagnostic disable-next-line: missing-parameter
        local target_path = vim.fn.expand(undotree_dir)
        if not vim.fn.isdirectory(target_path) then
            vim.fn.mkdir(target_path, "p", 0700)
        end
        vim.o.undodir = target_path
        vim.o.undofile = true
    end
end
function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>3",
            rhs = function()
                public.toggle_sidebar("undotree")
                ---@diagnostic disable-next-line: param-type-mismatch
                local ok, _ = pcall(vim.cmd, "UndotreeToggle")
                if not ok then
                    vim.api.nvim_echo({ { "Can't open undotree", "ErrorMsg" } }, false, {})
                end
            end,
            options = { silent = true },
            description = "Open Undo Explorer",
        },
    })
end

return M
