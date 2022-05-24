-- https://github.com/microsoft/pyright

local util = require("lspconfig.util")

local root_files = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    -- customize
    "manage.py",
    "run.py",
}

local filter_publish_diagnostics = function(a, params, client_id, c, config)
    local new_index = 1
    for index, diagnostic in ipairs(params.diagnostics) do
        if not vim.tbl_contains(c.filter_keywrod, diagnostic.message) then
            params.diagnostics[new_index] = diagnostic
            new_index = new_index + 1
        end
    end
    for i = new_index, #params.diagnostics do
        params.diagnostics[i] = nil
    end
    ---@diagnostic disable-next-line: redundant-parameter
    vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

local M = {}

M.private_attach_callbackfn = function(client, bufnr) end

M.lsp_config = {
    filetypes = { "python" },
    single_file_support = true,
    cmd = { "pyright-langserver", "--stdio" },
    ---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(root_files)),
    handlers = {
        -- If you want to disable pyright's diagnostic prompt, open the code below
        -- ["textDocument/publishDiagnostics"] = function(...) end,
        -- If you want to disable pyright from diagnosing unused parameters, turn on the function below
        ["textDocument/publishDiagnostics"] = vim.lsp.with(filter_publish_diagnostics, {
            filter_keywrod = {
                '"kwargs" is not accessed',
                '"args" is not accessed',
            },
        }),
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off", -- off, basic, strict
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
                    reportUndefinedVariable = "error",
                    reportAssertAlwaysTrue = "error",
                },
            },
        },
    },
}

return M
