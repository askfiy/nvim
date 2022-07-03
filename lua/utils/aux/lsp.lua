local api = require("utils.api")
local aux_public = require("utils.aux.public")

local function _lsp_hover(_, result, ctx, config)
    -- add file type for LSP hover
    local bufnr, winner = vim.lsp.handlers.hover(_, result, ctx, config)

    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local function _lsp_signature_help(_, result, ctx, config)
    -- add file type for LSP signature help
    local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)

    -- put the signature floating window above the cursor
    local current_cursor_line = vim.api.nvim_win_get_cursor(0)[1]
    local ok, win_height = pcall(vim.api.nvim_win_get_height, winner)

    if not ok then
        return
    end

    if current_cursor_line > win_height + 2 then
        vim.api.nvim_win_set_config(winner, {
            anchor = "SW",
            relative = "cursor",
            row = 0,
            col = -1,
        })
    end

    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local aux_lsp = {
    icons = api.get_icons("diagnostic", true),
}

function aux_lsp.get_active_lsp_clients()
    local active_clients = vim.lsp.get_active_clients()
    local ignore_lsp = { "copilot", "null-ls"}
    local buf_ft = vim.bo.filetype

    if buf_ft ~= "markdown" then
        table.insert(ignore_lsp, "tailwindcss")
    end

    return active_clients, ignore_lsp
end

function aux_lsp.get_headlers(lsp_config)
    return vim.tbl_deep_extend("force", aux_lsp.lsp_handlers, lsp_config.handlers or {})
end

function aux_lsp.get_capabilities()
    return aux_lsp.capabilities
end

function aux_lsp.sigature_help()
    -- When the signature is visible, pressing <c-j> again will close the window
    for _, opts in ipairs(aux_public.get_all_win_buf_ft()) do
        if opts.buf_ft == "lsp-signature-help" then
            vim.api.nvim_win_close(opts.win_id, false)
            return
        end
    end
    vim.lsp.buf.signature_help()
end

function aux_lsp.scroll_to_up()
    local scroll_floating_filetype = { "lsp-signature-help", "lsp-hover" }

    for _, opts in ipairs(aux_public.get_all_win_buf_ft()) do
        if vim.tbl_contains(scroll_floating_filetype, opts.buf_ft) then
            local win_height = vim.api.nvim_win_get_height(opts.win_id)
            local cursor_line = vim.api.nvim_win_get_cursor(opts.win_id)[1]
            local buf_total_line = vim.api.nvim_buf_line_count(opts.buf_id)
            ---@diagnostic disable-next-line: redundant-parameter
            local win_first_line = vim.fn.line("w0", opts.win_id)

            if buf_total_line <= win_height or cursor_line == 1 then
                vim.api.nvim_echo({ { "Can't scroll up", "MoreMsg" } }, false, {})
                return
            end

            vim.opt.scrolloff = 0
            if cursor_line > win_first_line then
                vim.api.nvim_win_set_cursor(opts.win_id, { win_first_line - 5, 0 })
            elseif cursor_line - 5 < 1 then
                vim.api.nvim_win_set_cursor(opts.win_id, { 1, 0 })
            else
                vim.api.nvim_win_set_cursor(opts.win_id, { cursor_line - 5, 0 })
            end
            vim.opt.scrolloff = aux_lsp.opt_scrolloff

            return
        end
    end

    local map = "<c-b>"
    local key = vim.api.nvim_replace_termcodes(map, true, false, true)
    vim.api.nvim_feedkeys(key, "n", true)
end

function aux_lsp.scroll_to_down()
    local scroll_floating_filetype = { "lsp-signature-help", "lsp-hover" }

    for _, opts in ipairs(aux_public.get_all_win_buf_ft()) do
        if vim.tbl_contains(scroll_floating_filetype, opts.buf_ft) then
            local win_height = vim.api.nvim_win_get_height(opts.win_id)
            local cursor_line = vim.api.nvim_win_get_cursor(opts.win_id)[1]
            local buf_total_line = vim.api.nvim_buf_line_count(opts.buf_id)
            ---@diagnostic disable-next-line: redundant-parameter
            local win_last_line = vim.fn.line("w$", opts.win_id)

            if buf_total_line <= win_height or cursor_line == buf_total_line then
                vim.api.nvim_echo({ { "Can't scroll down", "MoreMsg" } }, false, {})
                return
            end

            vim.opt.scrolloff = 0
            if cursor_line < win_last_line then
                vim.api.nvim_win_set_cursor(opts.win_id, { win_last_line + 5, 0 })
            elseif cursor_line + 5 > buf_total_line then
                vim.api.nvim_win_set_cursor(opts.win_id, { buf_total_line, 0 })
            else
                vim.api.nvim_win_set_cursor(opts.win_id, { cursor_line + 5, 0 })
            end
            vim.opt.scrolloff = aux_lsp.opt_scrolloff

            return
        end
    end

    local map = "<c-f>"
    local key = vim.api.nvim_replace_termcodes(map, true, false, true)
    vim.api.nvim_feedkeys(key, "n", true)
end

function aux_lsp.quick_set(float_border)
    -- save scrolloff number
    aux_lsp.opt_scrolloff = vim.opt.scrolloff:get()

    -- set capabilities
    aux_lsp.capabilities = vim.lsp.protocol.make_client_capabilities()

    aux_lsp.capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        },
    }

    -- set public header
    aux_lsp.lsp_handlers = {
        ["textDocument/hover"] = vim.lsp.with(_lsp_hover, {
            border = float_border and "rounded" or "none",
            filetype = "lsp-hover",
        }),
        ["textDocument/signatureHelp"] = vim.lsp.with(_lsp_signature_help, {
            border = float_border and "rounded" or "none",
            filetype = "lsp-signature-help",
        }),
    }

    -- set diagnostic style
    vim.diagnostic.config({
        signs = true,
        underline = true,
        severity_sort = true,
        update_in_insert = false,
        float = { source = "always" },
        virtual_text = { prefix = "●", source = "always" },
    })

    for tpe, icon in pairs(aux_lsp.icons) do
        local hl = "DiagnosticSign" .. tpe
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- lspconfig float window set border
    local win = require("lspconfig.ui.windows")
    local _default_opts = win.default_opts

    ---@diagnostic disable-next-line: redefined-local
    win.default_opts = function(options)
        local opts = _default_opts(options)
        opts.border = float_border and "double" or "none"
        return opts
    end

    -- goto diagnostic
    aux_lsp.goto_next_diagnostic = function()
        vim.diagnostic.goto_next({ float = { border = float_border and "rounded" or "none" } })
    end

    aux_lsp.goto_prev_diagnostic = function()
        vim.diagnostic.goto_prev({ float = { border = float_border and "rounded" or "none" } })
    end
end

return aux_lsp
