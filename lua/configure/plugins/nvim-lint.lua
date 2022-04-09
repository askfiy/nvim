-- https://github.com/mfussenegger/nvim-lint

-- WARN: nvim-lint manually download the diagnostic tool to ensure that the tool is correctly enabled in the environment variables

-- pip3 install pylint
-- npm install -g eslint
-- ...

local options = require("core.options")

local utils = require("utils")

require("lint").linters_by_ft = {
    python = {"pylint"}
    -- javascript = {"eslint"},
    -- typescript = {"eslint"},
    -- go = {"golangcilint"}
}

-- pylint
require("lint.linters.pylint").args = {
    "-f",
    "json",
    "--rcfile=" .. utils.path.join(options.nvim_lint_dir, "pylint.conf")
}

vim.api.nvim_create_autocmd(
    {"InsertLeave", "TextChanged", "BufNew"},
    {
        pattern = "*",
        callback = function()
            require("lint").try_lint()
        end
    }
)
