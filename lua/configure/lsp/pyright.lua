return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    -- If you want to enable pylint diagnostics, turn on the comments below
    handlers = {
        ---@diagnostic disable-next-line: unused-vararg
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off", -- off, basic, strict
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                diagnosticSeverityOverrides = {
                    strictListInference = "warning",
                    strictDictionaryInference = "warning",
                    strictSetInference = "warning",
                    reportUnusedVariable = false,
                    reportDuplicateImport = "warning",
                    reportPrivateUsage = "warning",
                    reportConstantRedefinition = "error"
                }
            }
        }
    }
}
