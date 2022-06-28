local api = require("utils.api")
local aux_lsp = require("utils.aux.lsp")
local options = require("core.options")
local plugins_installer_table = require("core.packer.plugins")

Packer_bootstrap = (function()
    local packer_install_path = api.path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")

    ---@diagnostic disable-next-line: missing-parameter
    if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
        local rtp_addition = string.format("%s/site/pack/*/start/*", vim.fn.stdpath("data"))
        if not string.find(vim.o.runtimepath, rtp_addition) then
            vim.o.runtimepath = string.format("%s,%s", rtp_addition, vim.o.runtimepath)
        end

        vim.notify("Download packer ...", "INFO", { title = "Packer" })

        return vim.fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            packer_install_path,
        })
    end
end)()

local packer = require("packer")

packer.init({
    git = {
        default_url_format = options.download_source .. "%s",
    },
})

packer.startup({
    function(use)
        for plug_name, plug_config in pairs(plugins_installer_table) do
            plug_config = vim.tbl_deep_extend("force", { plug_name }, plug_config)
            local plug_file_name = plug_config.as or string.match(plug_name, "/([%w%-_]+).?")

            local plug_file_load_path = api.path.join(
                "configure",
                "plugins",
                string.format("nv_%s", plug_file_name:lower())
            )

            local plug_file_disk_path = api.path.join(
                vim.fn.stdpath("config"),
                "lua",
                string.format("%s.lua", plug_file_load_path)
            )

            if api.path.exists(plug_file_disk_path) then
                plug_config.setup = string.format("require('%s').before()", plug_file_load_path)
                plug_config.config = string.format(
                    [[
                         require('utils.api').safe_load(require('%s'))
                         require('%s').load()
                         require('%s').after()
                         ]],
                    plug_file_load_path,
                    plug_file_load_path,
                    plug_file_load_path
                )
            end

            use(plug_config)
        end
        if Packer_bootstrap then
            packer.sync()
        end
    end,
    config = { display = { open_fn = require("packer.util").float } },
})

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "plugins.lua" },
    callback = function()
        -- multiple reloads will increase memory usage, so stop some LSP servers before reloading
        -- but this may cause some error messages
        local active_clients, ignore_lsp = aux_lsp.get_active_clients()
        for _, client in pairs(active_clients) do
            if not vim.tbl_contains(ignore_lsp, client.name) then
                pcall(vim.lsp.stop_client, client, true)
            end
        end

        -- overload
        vim.cmd("source <afile>")
        vim.cmd("PackerCompile")
    end,
    group = packer_user_config,
})

return packer
