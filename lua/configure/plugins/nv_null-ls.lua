-- https://github.com/jose-elias-alvarez/null-ls.nvim

local path = require("utils.api.path")
local options = require("core.options")

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "null-ls")
    if not ok then
        return
    end

    M.null_ls = m
    M.null_ls.setup({
        sources = {
            M.null_ls.builtins.formatting.prettier,
            M.null_ls.builtins.formatting.gofmt,
            M.null_ls.builtins.formatting.autopep8,
            M.null_ls.builtins.formatting.sqlformat,
            M.null_ls.builtins.formatting.stylua.with({
                extra_args = {
                    "--indent-type=Spaces",
                    "--indent-width=4",
                },
            }),
            -- M.null_ls.builtins.diagnostics.pylint.with({
            --     extra_args = {
            --         "-f",
            --         "json",
            --         "--load-plugins=pylint_django",
            --         "--disable=django-not-configured",
            --         "--rcfile=" .. path.join(options.nvim_lint_dir, "pylint.conf"),
            --     },
            -- }),
        },
    })
end

function M.after() end

return M
