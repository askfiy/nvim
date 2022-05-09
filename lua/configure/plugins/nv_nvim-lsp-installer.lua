-- https://github.com/williamboman/nvim-lsp-installer

local icons = require("utils.icons")
local mapping = require("core.mapping")
local vim_lsp_handers = require("vim.lsp.handlers")

local M = {
	language_servers_config = {
		vimls = require("configure.lsp.vimls"),
		sumneko_lua = require("configure.lsp.sumneko_lua"),
		-- ltex = require("configure.lsp.ltex"),
		jsonls = require("configure.lsp.jsonls"),
		tailwindcss = require("configure.lsp.tailwindcss"),
		html = require("configure.lsp.html"),
		cssls = require("configure.lsp.cssls"),
		tsserver = require("configure.lsp.tsserver"),
		vuels = require("configure.lsp.vuels"),
		gopls = require("configure.lsp.gopls"),
		pyright = require("configure.lsp.pyright"),
	},
}

function M.before()
	M.lsp_float_settings()
	M.diagnostics_settings()
end

function M.load()
	local ok, m = pcall(require, "nvim-lsp-installer.servers")
	if not ok then
		return
	end

	M.nvim_lsp_installer_servers = m
	M.aerial = require("aerial")
	M.lua_dev = require("lua-dev")
	M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	M.capabilities.textDocument.completion.completionItem.snippetSupport = true
end

function M.after()
	for server_name, server_settings in pairs(M.language_servers_config) do
		local server_options = server_settings.options
		local server_hooks = server_settings.hooks
		local server_available, server = M.nvim_lsp_installer_servers.get_server(server_name)
		if server_available then
			---@diagnostic disable-next-line: undefined-field
			if not server:is_installed() then
				vim.notify("Install Language Server: " .. server_name, "info", { title = "Language Server" })
				---@diagnostic disable-next-line: undefined-field
				server:install()
			else
				if server_name == "sumneko_lua" then
					server_options = vim.tbl_deep_extend("force", M.lua_dev.setup(), server_options)
				end
				server_options.capabilities = M.capabilities
				server_options.on_attach = function(client, bufnr)
					M.attach_callbackfn(client, bufnr)
					server_hooks.attach(client, bufnr)
				end
				server_options.flags = { debounce_text_changes = 150 }
				server_options.handlers = vim.tbl_deep_extend("force", M.lsp_handlers, server_options.handlers or {})
				---@diagnostic disable-next-line: undefined-field
				server:setup(server_options)
			end
		end
	end
end

function M.lsp_float_settings()
	-- add file type for floating window
	M.lsp_handlers = {
		["textDocument/hover"] = vim.lsp.with(M.lsp_hover, {
			border = "rounded",
		}),
		["textDocument/signatureHelp"] = vim.lsp.with(M.lsp_signature_help, {
			border = "rounded",
		}),
	}
end

function M.lsp_hover(_, result, ctx, config)
	local bufnr, winner = vim_lsp_handers.hover(_, result, ctx, config)
	if bufnr and winner then
		vim.api.nvim_buf_set_option(bufnr, "filetype", "lsp-hover")
		return bufnr, winner
	end
end

function M.lsp_signature_help(_, result, ctx, config)
	local bufnr, winner = vim_lsp_handers.signature_help(_, result, ctx, config)
	if bufnr and winner then
		vim.api.nvim_buf_set_option(bufnr, "filetype", "lsp-signature-help")
		return bufnr, winner
	end
end

function M.diagnostics_settings()
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

---@diagnostic disable-next-line: unused-local
function M.attach_callbackfn(client, bufnr)
	M.aerial.on_attach(client, bufnr)
	M.register_buffer_key(bufnr)
end

function M.register_buffer_key(bufnr)
	mapping.register("buffer_mappings", {
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
			lhs = "gh",
			rhs = vim.lsp.buf.hover,
			options = { silent = true, buffer = bufnr },
			description = "Show help information",
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
					vim.pretty_print(vim.api.nvim_win_get_config(win_id))
					---@diagnostic disable-next-line: undefined-field
					local win_config = vim.api.nvim_win_get_config(win_id)
					---@diagnostic disable-next-line: undefined-field
					if win_config.relative ~= "" and win_config.width > 1 then
						-- Note: The scroll bar is actually a floating window, its width is 1
						vim.api.nvim_win_close(win_id, false)
						return
					end
				end
				vim.lsp.buf.signature_help()
			end,
			options = { silent = true, buffer = bufnr },
			description = "Toggle signature help",
		},
	})
end

return M
