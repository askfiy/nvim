-- https://github.com/jose-elias-alvarez/null-ls.nvim

---@diagnostic disable: unused-local

local api = require("utils.api")
local options = require("core.options")

local M = {
    requires = {
        "null-ls",
    },
    formatting_filetype_extends = {
        shfmt = { "zsh" },
        fixjson = { "json5" },
    },
}

function M.before() end

function M.load()
    for package_name, filetype_tables in pairs(M.formatting_filetype_extends) do
        vim.tbl_map(function(filetype)
            table.insert(M.null_ls.builtins.formatting[package_name].filetypes, filetype)
        end, filetype_tables)
    end

    M.null_ls.setup({
        border = options.float_border and "double" or "none",
        sources = {
            M.null_ls.builtins.formatting.gofmt,
            M.null_ls.builtins.formatting.shfmt,
            M.null_ls.builtins.formatting.prettier,
            M.null_ls.builtins.formatting.fixjson,
            M.null_ls.builtins.formatting.autopep8.with({
                extra_args = {
                    "-a",
                    "--max-line-length=120",
                },
            }),
            M.null_ls.builtins.formatting.clang_format.with({
                extra_args = { "--style", "{IndentWidth: 4}" },
            }),
            M.null_ls.builtins.formatting.sql_formatter.with({
                extra_args = {
                    ("-l=%s"):format(options.sql_langkind),
                },
            }),
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
            --         "--rcfile=" .. api.path.join(options.lint_directory, "pylint.conf"),
            --     },
            -- }),
        },
    })
end

function M.after() end

return M
