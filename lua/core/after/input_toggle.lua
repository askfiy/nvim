local options = require("core.options")

if options.platform_info == "UNIX" then
    vim.api.nvim_create_autocmd(
        {"InsertLeave"},
        {
            pattern = {"*"},
            callback = function()
                local input_status = tonumber(vim.fn.system("fcitx-remote"))
                if input_status == 2 then
                    vim.fn.system("fcitx-remote -c")
                end
            end
        }
    )
end
