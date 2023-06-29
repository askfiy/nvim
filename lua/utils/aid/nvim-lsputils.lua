local M = {}

function M.close_document_format(client)
    client.server_capabilities.documentFormattingProvider = false
end

function M.did_change_configuration(client)
    vim.api.nvim_create_autocmd({ "DirChanged", "CursorHold" }, {
        pattern = { "*" },
        callback = function()
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end,
    })
end

function M.close_semantic_tokens(client)
    client.server_capabilities.semanticTokensProvider = nil
end

function M.filter_publish_diagnostics(a, params, client_info, extra_message, config)
    ---@diagnostic disable-next-line: unused-local
    local client = vim.lsp.get_client_by_id(client_info.client_id)

    local ignore_diagnostic_message = extra_message.ignore_diagnostic_message or {}
    local ignore_diagnostic_level = vim.tbl_map(function(level)
        return vim.diagnostic.severity[level:upper()]
    end, extra_message.ignore_diagnostic_level or {})

    if ignore_diagnostic_message then
        local new_index = 1

        for _, diagnostic in ipairs(params.diagnostics) do
            if
                not (
                    vim.tbl_contains(ignore_diagnostic_level, diagnostic.severity) -- disable level
                    or vim.tbl_contains(ignore_diagnostic_message, diagnostic.message) -- disable message
                )
            then
                params.diagnostics[new_index] = diagnostic
                new_index = new_index + 1
            end
        end

        for i = new_index, #params.diagnostics do
            params.diagnostics[i] = nil
        end
    end

    ---@diagnostic disable-next-line: redundant-parameter
    vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_info, extra_message, config)
end

return M
