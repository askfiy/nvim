-- https://github.com/neovim/nvim-lspconfig

local api = require("utils.api")
local aid_nvim_lspconfig = require("utils.aid.nvim-lspconfig")

local M = {
    requires = {
        "neodev", -- neovim lua api complete enhance, must require
        "lspconfig",
        "nvim-navic",
        "mason-lspconfig",
    },
    server_configurations_dir_path = api.path.join("conf", "lsp", "server_configurations"),
}

function M.before()
    M.register_key()
end

function M.load()
    aid_nvim_lspconfig.begin()

    -- lspconfig_to_mason or mason_to_lspconfig
    local mappings = M.mason_lspconfig.get_mappings()

    for _, server_name in ipairs(M.mason_lspconfig.get_installed_servers()) do
        local require_path = api.path.join(M.server_configurations_dir_path, mappings.lspconfig_to_mason[server_name])

        local ok, settings = pcall(require, require_path)
        if not ok then
            settings = {}
        end

        settings.capabilities = aid_nvim_lspconfig.get_capabilities()
        settings.handlers = aid_nvim_lspconfig.get_headlers(settings)

        settings.on_attach = function(client, bufnr)
            M.nvim_navic.attach(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            -- close semantic tokens
            client.server_capabilities.semanticTokensProvider = nil
        end

        M.lspconfig[server_name].setup(settings)
    end
end

function M.after() end

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
            rhs = function()
                vim.lsp.buf.format({ async = true })
            end,
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
            lhs = "gi",
            rhs = function()
                require("telescope.builtin").lsp_implementations()
            end,
            options = { silent = true },

            description = "Go to implementations",
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
            lhs = "gD",
            rhs = function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            options = { silent = true },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = aid_nvim_lspconfig.diagnostic_open_float,
            options = { silent = true },
            description = "Show Current Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "gO",
            rhs = function()
                require("telescope.builtin").diagnostics()
            end,
            options = { silent = true },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = aid_nvim_lspconfig.goto_prev_diagnostic,
            options = { silent = true },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = aid_nvim_lspconfig.goto_next_diagnostic,
            options = { silent = true },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = aid_nvim_lspconfig.toggle_sigature_help,
            options = { silent = true },
            description = "Toggle signature help",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-b>",
            rhs = aid_nvim_lspconfig.scroll_docs_to_up("<c-b>"),
            options = { silent = true },
            description = "Scroll up floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-f>",
            rhs = aid_nvim_lspconfig.scroll_docs_to_down("<c-f>"),
            options = { silent = true },
            description = "Scroll down floating window",
        },
    })
end

return M
