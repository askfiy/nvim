-- https://github.com/microsoft/pylance-release

local util = require("lspconfig.util")
local aid_nvim_lsputils = require("utils.aid.nvim-lsputils")

local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    -- customize
    "manage.py",
    "server.py",
    "main.py",
}

local ignore_diagnostic_message = {
    '"self" is not accessed',
    '"args" is not accessed',
    '"kwargs" is not accessed',
    '"i" is not accessed',
    'Variable "i" is not accessed',
    '"get" is not a known member of "None"'
}

return {
    filetypes = { "python" },
    single_file_support = true,
    -- cmd = { "pylance-langserver", "--stdio" },
    ---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(root_files)),
    handlers = {
        -- If you want to disable pylance's diagnostic prompt, open the code below
        -- ["textDocument/publishDiagnostics"] = function(...) end,
        -- If you want to disable pylance from diagnosing unused parameters, open the function below
        ["textDocument/publishDiagnostics"] = vim.lsp.with(aid_nvim_lsputils.filter_publish_diagnostics, {
            ignore_diagnostic_level = {},
            ignore_diagnostic_message = ignore_diagnostic_message,
        }),
    },
    ---@diagnostic disable-next-line: unused-local
    on_attach = function(client, bufnr)
        -- aid_nvim_lsputils.did_change_configuration(client)
        vim.api.nvim_buf_create_user_command(bufnr, "LspChange", function()
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end, {
            desc = "send didChangeConfiguration to Langserver",
        })
    end,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- off, basic, strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                diagnosticSeverityOverrides = {
                    strictListInference = true,
                    strictDictionaryInference = true,
                    strictSetInference = true,
                    reportUnusedImport = "warning",
                    reportUnusedClass = "warning",
                    reportUnusedFunction = "warning",
                    reportUnusedVariable = "warning",
                    reportUnusedCoroutine = "warning",
                    reportDuplicateImport = "warning",
                    reportPrivateUsage = "warning",
                    reportUnusedExpression = "warning",
                    reportConstantRedefinition = "error",
                    reportIncompatibleMethodOverride = "error",
                    reportMissingImports = "error",
                    reportUndefinedVariable = "error",
                    reportAssertAlwaysTrue = "error",
                },
                -- pylance
                inlayHints = {
                    variableTypes = true,
                    functionReturnTypes = true,
                    pytestParameters = true,
                },
            },
        },
    },
}
