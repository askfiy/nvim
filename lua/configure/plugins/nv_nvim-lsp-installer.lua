-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/stevearc/aerial.nvim
-- https://github.com/williamboman/nvim-lsp-installer

local icons = require("utils.icons")
local mapping = require("core.mapping")
local options = require("core.options")

local M = {
    opt_scrolloff = vim.opt.scrolloff:get(),
}

function M.load_lsp_config()
    M.language_servers_config = {
        -- ltex = require("configure.lsp.ltex"),
        vimls = require("configure.lsp.vimls"),
        sumneko_lua = require("configure.lsp.sumneko_lua"),
        jsonls = require("configure.lsp.jsonls"),
        tailwindcss = require("configure.lsp.tailwindcss"),
        html = require("configure.lsp.html"),
        cssls = require("configure.lsp.cssls"),
        tsserver = require("configure.lsp.tsserver"),
        vuels = require("configure.lsp.vuels"),
        gopls = require("configure.lsp.gopls"),
        pyright = require("configure.lsp.pyright"),
    }
end

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-lsp-installer")
    if not ok then
        return
    end

    M.nvim_lsp_installer = m

    M.load_lsp_config()
    -- Set options for floating windows
    M.float_style_settings()
    -- Set diagnostic style
    M.diagnostics_style_settings()
    -- Set lspconfig floating border
    M.lspconfig_float_settings()

    M.aerial = require("aerial")
    M.lspconfig = require("lspconfig")
    M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

    M.nvim_lsp_installer.setup({
        automatic_installation = true,
        ui = {
            border = "double",
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
            -- For Chinese users, if the download is slow, you can switch to the github mirror source
            -- download_url_template = "https://hub.fastgit.xyz/%s/releases/download/%s/%s",
            download_url_template = "https://github.com/%s/releases/download/%s/%s",
        },
        max_concurrent_installers = 20,
    })
end

function M.after()
    for server_name, server_settings in pairs(M.language_servers_config) do
        local server_available, server = M.nvim_lsp_installer.get_server(server_name)
        -- Determine whether the LSP server is valid (supports automatic download)
        if server_available then
            ---@diagnostic disable-next-line: undefined-field
            if not server:is_installed() then
                -- If the LSP server is not downloaded, download it
                vim.notify("Install Language Server: " .. server_name, "info", { title = "Language Server" })
                ---@diagnostic disable-next-line: undefined-field
                server:install()
            else
                -- If it has been downloaded, it can be used directly
                local lsp_config = server_settings.lsp_config
                local private_attach_callbackfn = server_settings.private_attach_callbackfn
                local public_attach_callbackfn = M.public_attach_callbackfn

                lsp_config.capabilities = M.capabilities

                lsp_config.flags = {
                    debounce_text_changes = 150,
                }
                -- Merge public headers with private headers
                lsp_config.handlers = vim.tbl_deep_extend("force", M.lsp_handlers, lsp_config.handlers or {})
                -- Use the public configuration first, then use the private configuration of each LSP server
                -- If there are duplicates, the private configuration will override the public configuration
                lsp_config.on_attach = function(client, bufnr)
                    public_attach_callbackfn(client, bufnr)
                    private_attach_callbackfn(client, bufnr)
                end
                -- Start LSP server
                M.lspconfig[server_name].setup(lsp_config)
            end
        end
    end
end

function M.float_style_settings()
    -- Add file type for floating window
    M.lsp_handlers = {
        ["textDocument/hover"] = vim.lsp.with(M.lsp_hover, {
            border = "rounded",
            filetype = "lsp-hover",
        }),
        ["textDocument/signatureHelp"] = vim.lsp.with(M.lsp_signature_help, {
            border = "rounded",
            filetype = "lsp-signature-help",
        }),
    }
end

function M.lsp_hover(_, result, ctx, config)
    -- Add file type for LSP hover
    local bufnr, winner = vim.lsp.handlers.hover(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

function M.lsp_signature_help(_, result, ctx, config)
    -- Add file type for LSP signature help
    local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)
    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

function M.diagnostics_style_settings()
    vim.diagnostic.config({
        signs = true,
        underline = true,
        severity_sort = true,
        update_in_insert = false,
        float = { source = "always" },
        virtual_text = { prefix = "●", source = "always" },
    })

    for tpe, icon in pairs(icons.diagnostics) do
        local hl = "DiagnosticSign" .. tpe
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

function M.lspconfig_float_settings()
    local win = require("lspconfig.ui.windows")
    local _default_opts = win.default_opts

    ---@diagnostic disable-next-line: redefined-local
    win.default_opts = function(options)
        local opts = _default_opts(options)
        opts.border = "double"
        return opts
    end
end

function M.public_attach_callbackfn(client, bufnr)
    M.aerial.on_attach(client, bufnr)
    M.register_buffer_key(bufnr)
end

function M.register_buffer_key(bufnr)
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>ca",
            rhs = vim.lsp.buf.code_action,
            options = { silent = true, buffer = bufnr },
            description = "Show code action",
        },
        {
            mode = { "n" },
            lhs = "<leader>cn",
            rhs = vim.lsp.buf.rename,
            options = { silent = true, buffer = bufnr },
            description = "Variable renaming",
        },
        {
            mode = { "n" },
            lhs = "<leader>cf",
            rhs = vim.lsp.buf.formatting_sync,
            options = { silent = true, buffer = bufnr },
            description = "Format buffer",
        },
        {
            mode = { "n" },
            lhs = "gI",
            rhs = function()
                require("telescope.builtin").lsp_implementations()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Go to implementations",
        },
        {
            mode = { "n" },
            lhs = "gD",
            rhs = function()
                require("telescope.builtin").lsp_type_definitions()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Go to type definitions",
        },
        {
            mode = { "n" },
            lhs = "gd",
            rhs = function()
                require("telescope.builtin").lsp_definitions()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Go to definitions",
        },
        {
            mode = { "n" },
            lhs = "gr",
            rhs = function()
                require("telescope.builtin").lsp_references()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Go to references",
        },
        {
            mode = { "n" },
            lhs = "gh",
            rhs = vim.lsp.buf.hover,
            options = { silent = true, buffer = bufnr },
            description = "Show help information",
        },
        {
            mode = { "n" },
            lhs = "go",
            rhs = function()
                require("telescope.builtin").diagnostics()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Show Workspace Diagnostics",
        },
        {
            mode = { "n" },
            lhs = "[g",
            rhs = function()
                vim.diagnostic.goto_prev({ float = { border = "rounded" } })
            end,
            options = { silent = true, buffer = bufnr },
            description = "Jump to prev diagnostic",
        },
        {
            mode = { "n" },
            lhs = "]g",
            rhs = function()
                vim.diagnostic.goto_next({ float = { border = "rounded" } })
            end,
            options = { silent = true, buffer = bufnr },
            description = "Jump to next diagnostic",
        },
        {
            mode = { "i" },
            lhs = "<c-j>",
            rhs = function()
                -- When the signature is visible, pressing <c-j> again will close the window
                local wins = vim.api.nvim_list_wins()
                for _, win_id in ipairs(wins) do
                    local buf_id = vim.api.nvim_win_get_buf(win_id)
                    local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")
                    if ft == "lsp-signature-help" then
                        vim.api.nvim_win_close(win_id, false)
                        return
                    end
                end
                vim.lsp.buf.signature_help()
            end,
            options = { silent = true, buffer = bufnr },
            description = "Toggle signature help",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-f>",
            rhs = function()
                local scroll_floating_filetype = { "lsp-signature-help", "lsp-hover" }
                local wins = vim.api.nvim_list_wins()

                for _, win_id in ipairs(wins) do
                    local buf_id = vim.api.nvim_win_get_buf(win_id)
                    local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")

                    if vim.tbl_contains(scroll_floating_filetype, ft) then
                        local win_height = vim.api.nvim_win_get_height(win_id)
                        local cursor_line = vim.api.nvim_win_get_cursor(win_id)[1]
                        local buf_total_line = vim.api.nvim_buf_line_count(buf_id)
                        ---@diagnostic disable-next-line: redundant-parameter
                        local win_last_line = vim.fn.line("w$", win_id)

                        if buf_total_line == win_height then
                            vim.api.nvim_echo({ { "Can't scroll down", "MoreMsg" } }, false, {})
                            return
                        end

                        vim.opt.scrolloff = 0
                        if cursor_line < win_last_line then
                            vim.api.nvim_win_set_cursor(win_id, { win_last_line + 5, 0 })
                        elseif cursor_line + 5 > buf_total_line then
                            vim.api.nvim_win_set_cursor(win_id, { buf_total_line, 0 })
                        else
                            vim.api.nvim_win_set_cursor(win_id, { cursor_line + 5, 0 })
                        end
                        vim.opt.scrolloff = M.opt_scrolloff

                        return
                    end
                end

                local map = "<c-f>"
                local key = vim.api.nvim_replace_termcodes(map, true, false, true)
                vim.api.nvim_feedkeys(key, "n", true)
            end,
            options = { silent = true, buffer = bufnr },
            description = "Scroll down floating window",
        },
        {
            mode = { "i", "n" },
            lhs = "<c-b>",
            rhs = function()
                local scroll_floating_filetype = { "lsp-signature-help", "lsp-hover" }
                local wins = vim.api.nvim_list_wins()

                for _, win_id in ipairs(wins) do
                    local buf_id = vim.api.nvim_win_get_buf(win_id)
                    local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")

                    if vim.tbl_contains(scroll_floating_filetype, ft) then
                        local win_height = vim.api.nvim_win_get_height(win_id)
                        local cursor_line = vim.api.nvim_win_get_cursor(win_id)[1]
                        local buf_total_line = vim.api.nvim_buf_line_count(buf_id)
                        ---@diagnostic disable-next-line: redundant-parameter
                        local win_first_line = vim.fn.line("w0", win_id)

                        if buf_total_line == win_height then
                            vim.api.nvim_echo({ { "Can't scroll up", "MoreMsg" } }, false, {})
                            return
                        end

                        vim.opt.scrolloff = 0
                        if cursor_line > win_first_line then
                            vim.api.nvim_win_set_cursor(win_id, { win_first_line - 5, 0 })
                        elseif cursor_line - 5 < 1 then
                            vim.api.nvim_win_set_cursor(win_id, { 1, 0 })
                        else
                            vim.api.nvim_win_set_cursor(win_id, { cursor_line - 5, 0 })
                        end
                        vim.opt.scrolloff = M.opt_scrolloff

                        return
                    end
                end

                local map = "<c-b>"
                local key = vim.api.nvim_replace_termcodes(map, true, false, true)
                vim.api.nvim_feedkeys(key, "n", true)
            end,
            options = { silent = true, buffer = bufnr },
            description = "Scroll up floating window",
        },
    })
end

return M
