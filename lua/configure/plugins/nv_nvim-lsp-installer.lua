-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/SmiteshP/nvim-navic
-- https://github.com/stevearc/aerial.nvim
-- https://github.com/williamboman/nvim-lsp-installer

local api = require("utils.api")
local aux_lsp = require("utils.aux.lsp")
local options = require("core.options")

local M = {
    safe_requires = {
        { "aerial" },
        { "lspconfig" },
        { "nvim-navic", "navic" },
        { "nvim-lsp-installer", "lsp_installer" },
    },
    installer_servers = {
        "vimls",
        "sumneko_lua",
        "gopls",
        "pyright",
        "html",
        "vuels",
        "cssls",
        "jsonls",
        "emmet_ls",
        "tsserver",
        "tailwindcss",
    },
}

function M.before() end

function M.load()
    aux_lsp.quick_set(options.float_border)

    M.lsp_installer.setup({
        automatic_installation = true,
        ui = {
            border = options.float_border and "double" or "none",
            icons = {
                server_installed = "",
                server_pending = "",
                server_uninstalled = "ﮊ",
            },
            keymaps = {
                toggle_server_expand = "<cr>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "X",
            },
        },
        github = {
            download_url_template = options.download_source .. "%s/releases/download/%s/%s",
        },
        max_concurrent_installers = 20,
    })
end

function M.after()
    -- store servers name waiting to be installed
    local download_servers = {}

    for _, server_name in pairs(M.installer_servers) do
        local server_available, server_object = M.lsp_installer.get_server(server_name)

        -- if available
        if server_available then

            -- if is installed
            if server_object:is_installed() then

                -- determine if there is a user-defined configuration file
                local ok, lsp_config = pcall(require, string.format("configure.lsp.%s", server_name))

                -- if there is no user-defined configuration file, use the default configuration
                if not ok then
                    lsp_config = {}
                end

                lsp_config.capabilities = aux_lsp.get_capabilities()
                lsp_config.handlers = aux_lsp.get_headlers(lsp_config)
                lsp_config.on_attach = function(client, bufnr)
                    M.register_key()
                    M.navic.attach(client, bufnr)
                    M.aerial.on_attach(client, bufnr)
                end

                M.lspconfig[server_name].setup(lsp_config)

            -- if not installed, add to download list and install server
            else
                table.insert(download_servers, server_name)
                server_object:install()
            end

        -- invalid server name
        else
            local error_message = server_object
            vim.notify(error_message, "ERROR", { title = "Language Server" })
        end
    end

    -- show download information
    if not vim.tbl_isempty(download_servers) then
        vim.notify(
            string.format("Install Language Servers: \n - %s", table.concat(download_servers, "\n - ")),
            "INFO",
            { title = "Language Server" }
        )
    end
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>ca",
            rhs = vim.lsp.buf.code_action,
            options = { silent = true },
            description = "Show code action",
        },
        {
            mode = { "n" },
            lhs = "<leader>cn",
            rhs = vim.lsp.buf.rename,
            options = { silent = true },
            description = "Variable renaming",
        },
        {
            mode = { "n" },
            lhs = "<leader>cf",
            rhs = vim.lsp.buf.format,
            options = { silent = true },
            description = "Format buffer",
        },
        {
            mode = { "n" },
            lhs = "gh",
            rhs = vim.lsp.buf.hover,
            options = { silent = true },
            description = "Show help information",
        },
        {
            mode = { "n" },
            lhs = "gr",
            rhs = function()
                require("telescope.builtin").lsp_references()
            end,
            options = { silent = true },
            description = "Go to references",
        },
        {
            mode = { "n" },
            lhs = "gI",
            rhs = function()
                require("telescope.builtin").lsp_implementations()
            end,
            options = { silent = true },

            description = "Go to implementations",
        },
        {
            mode = { "n" },
            lhs = "gD",
            rhs = function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            options = { silent = true },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "gd",
            rhs = function()
                require("telescope.builtin").lsp_definitions()
            end,
            options = { silent = true },
            description = "Go to definitions",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = function()
                require("telescope.builtin").diagnostics()
            end,
            options = { silent = true },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = aux_lsp.goto_prev_diagnostic,
            options = { silent = true },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = aux_lsp.goto_next_diagnostic,
            options = { silent = true },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = aux_lsp.sigature_help,
            options = { silent = true },
            description = "Toggle signature help",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-b>",
            rhs = aux_lsp.scroll_to_up,
            options = { silent = true },
            description = "Scroll up floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-f>",
            rhs = aux_lsp.scroll_to_down,
            options = { silent = true },
            description = "Scroll down floating window",
        },
    })
end

return M
