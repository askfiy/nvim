-- https://github.com/uga-rosa/translate.nvim

-- The plugin uses the translate-shell plugin by default, so you need to install this plugin
-- https://github.com/soimort/translate-shell
-- You can also choose to use deepl for translation, but it relies on curl commands
-- https://curl.se/
-- With these tools, you can call deepl's api
-- https://www.deepl.com/en/docs-api/

local mapping = require("core.mapping")

local M = {}

function M.before()
	M.register_global_key()
end

function M.load()
	local ok, m = pcall(require, "translate")
	if not ok then
		return
	end

	M.translate = m
	M.translate.setup({
		default = {
			-- default: translate_shell
			-- deepl_free
			-- deepl_pro
			command = "translate_shell",
			output = "floating",
			parse_before = "trim",
			parse_after = "replace_symbols",
		},
		preset = {
			output = {
				split = {
					min_size = 8,
				},
			},
		},
		parse_after = {
			replace_symbols = {
				cmd = function(lines)
					for index, char in ipairs(lines) do
						if char:find("u003d") then
							lines[index] = char:gsub("u003d", "=")
						end
					end
					return lines
				end,
			},
		},
	})
end

function M.after() end

function M.register_global_key()
	mapping.register("global_mappings", {
		{
			mode = { "n", "x" },
			lhs = "<leader>tcs",
			rhs = ":Translate ZH -source=EN -output=split<cr>",
			options = { silent = true },
			description = "Translate English to Chinese and open in split window",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tcr",
			rhs = ":Translate ZH -source=EN -output=replace<cr>",
			options = { silent = true },
			description = "Translate English to Chinese and replace English",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tcf",
			rhs = ":Translate ZH -source=EN -output=floating<cr>",
			options = { silent = true },
			description = "Translate English to Chinese and open in float window",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tci",
			rhs = ":Translate ZH -source=EN -output=insert<cr>",
			options = { silent = true },
			description = "Translate English to Chinese and insert to next line",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tcc",
			rhs = ":Translate ZH -source=EN -output=register<cr>",
			options = { silent = true },
			description = "Translate English to Chinese and copy result to clipboard",
		},
		{
			mode = { "n" },
			lhs = "<leader>tcb",
			rhs = ":Translate ZH -source=EN -output=floating -comment<cr>",
			options = { silent = true },
			description = "Translate English comment to Chinese and open in float window",
		},
		{
			mode = { "n" },
			lhs = "<leader>tcw",
			rhs = ":Translate ZH -source=EN -output=floating<cr>",
			options = { silent = true },
			description = "Translate English word to Chinese and open in float window",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tes",
			rhs = ":Translate EN -source=ZH -output=split<cr>",
			options = { silent = true },
			description = "Translate Chinese to English and open in split window",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>ter",
			rhs = ":Translate EN -source=ZH -output=replace<cr>",
			options = { silent = true },
			description = "Translate Chinese to English and replace Chinese",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tef",
			rhs = ":Translate EN -source=ZH -output=floating<cr>",
			options = { silent = true },
			description = "Translate Chinese to English and open in float window",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tei",
			rhs = ":Translate EN -source=ZH -output=insert<cr>",
			options = { silent = true },
			description = "Translate Chinese to English and insert to next line",
		},
		{
			mode = { "n", "x" },
			lhs = "<leader>tec",
			rhs = ":Translate EN -source=ZN -output=register<cr>",
			options = { silent = true },
			description = "Translate Chinese to English and copy result to clipboard",
		},
		{
			mode = { "n" },
			lhs = "<leader>teb",
			rhs = ":Translate EN -source=ZH -output=floating -comment<cr>",
			options = { silent = true },
			description = "Translate Chinese comment to English and open in float window",
		},
		{
			mode = { "n" },
			lhs = "<leader>tew",
			rhs = ":Translate EN -source=ZH -output=floating<cr>",
			options = { silent = true },
			description = "Translate Chinese word to English and open in float window",
		},
	})
end

return M
