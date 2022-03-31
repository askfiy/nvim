-- https://github.com/mbbill/undotree

local utils = require("utils")

local undotree_dir = utils.path.join(vim.fn.stdpath("cache"), "undotree")

if vim.fn.has("persistent_undo") then
    local target_path = vim.fn.expand(undotree_dir)
    if not vim.fn.isdirectory(target_path) then
        vim.fn.mkdir(target_path, "p", 0700)
    end
    vim.o.undodir = target_path
    vim.o.undofile = true
end
