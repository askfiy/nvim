-- https://github.com/microsoft/pyright

local util = require("lspconfig.util")

local M = {
    root_files = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
    },
}

M.filter_publish_diagnostics = function(a, params, client_id, c, config)
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

M.private_attach_callbackfn = function(client, bufnr) end

M.lsp_config = {
    filetypes = { "python" },
    single_file_support = true,
    cmd = { "pyright-langserver", "--stdio" },
    ---@diagnostic disable-next-line: deprecated
    root_dir = util.root_pattern(unpack(M.root_files)),
    handlers = {
        -- If you want to disable pyright's diagnostic prompt, open the code below
        -- ["textDocument/publishDiagnostics"] = function(...) end,
        -- If you want to disable pyright from diagnosing unused parameters, turn on the function below
        ["textDocument/publishDiagnostics"] = vim.lsp.with(M.filter_publish_diagnostics, {
            filter_keywrod = {
                '"kwargs" is not accessed',
                '"args" is not accessed',
            },
        }),
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic", -- off, basic, strict
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                diagnosticSeverityOverrides = {
                    strictListInference = true,
                    strictDictionaryInference = true,
                    strictSetInference = true,
                    strictParameterNoneValue = true,
                    reportUndefinedVariable = "error",
                    reportMissingTypeStubs = "none",
                    reportIncompleteStub = "none",
                    reportInvalidStubStatement = "none",
                },
            },
        },
    },
}

return M
