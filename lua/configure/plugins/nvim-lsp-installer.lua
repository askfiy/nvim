-- https://github.com/williamboman/nvim-lsp-installer

local mapping = require("core.mapping")
local notices = require("utils.notices")

local lsp_installer_servers = require("nvim-lsp-installer.servers")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {
    sumneko_lua = require("configure.lsp.sumneko_lua"),
    pyright = require("configure.lsp.pyright"),
    tsserver = require("configure.lsp.tsserver"),
    html = require("configure.lsp.html"),
    cssls = require("configure.lsp.cssls"),
    gopls = require("configure.lsp.gopls"),
    jsonls = require("configure.lsp.jsonls"),
    zeta_note = require("configure.lsp.zeta_note"),
    vuels = require("configure.lsp.vuels")
}

local function disgnostic_settings()
    -- diagnostic style customization
    vim.diagnostic.config(
        {
            virtual_text = {
                prefix = "●",
                source = "always"
            },
            float = {
                source = "always"
            },
            update_in_insert = false
        }
    )
end

local function attach(client, bufnr)
    require("aerial").on_attach(client, bufnr)
    mapping.register("buffer", "nvim_lsp_installer", bufnr)
    disgnostic_settings()
end

-- automatically install or start LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- determine if the service is available
    if server_available then
        -- determine whether the service is ready, if it is ready, start the service
        server:on_ready(
            function()
                -- keybind
                server_options.on_attach = attach
                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- instead of built-in omnifunc
                server_options.capabilities = capabilities
                server:setup(server_options)
            end
        )
        -- auto install if language server is not ready
        if not server:is_installed() then
            vim.notify(
                notices.language_server.download.message(server_name),
                notices.language_server.download.level,
                notices.language_server.download.options
            )
            server:install()
        end
    end
end
