local aux = {}

function aux.didChangeConfiguration(client, filetype)
    vim.api.nvim_create_autocmd(
        { "DirChanged", "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufNewFile" },
        {
            pattern = { filetype, "NvimTree_*" },
            callback = function()
                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end,
        }
    )
end

return aux
