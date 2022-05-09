-- https://github.com/AndrewRadev/switch.vim

local str = require("utils.api.str")
local mapping = require("core.mapping")

local M = {
	switch_words = {
		{ "true", "false" },
		{ "on", "off" },
		{ "yes", "no" },
		{ "disable", "enable" },
		{ "open", "close" },
		{ "in", "out" },
		{ "resolve", "reject" },
		{ "start", "end" },
		{ "before", "after" },
		{ "from", "to" },
		{ "relative", "absolute" },
		{ "up", "down" },
		{ "left", "right" },
		{ "row", "column" },
		{ "drak", "light" },
		{ "white", "black" },
		{ "get", "post" },
		{ "+", "-" },
		{ ">", "<" },
		{ "=", "!=" },
	},
}

function M.entrance()
	M.register_global_key()

	local put_words = vim.deepcopy(M.switch_words)

	for _, value in ipairs(M.switch_words) do
		local upper_words = { string.upper(value[1]), string.upper(value[2]) }
		local title_words = { str.title(value[1]), str.title(value[2]) }
		table.insert(put_words, upper_words)
		table.insert(put_words, title_words)
	end

	vim.g.switch_custom_definitions = put_words
end

function M.register_global_key()
	mapping.register("global_mappings", {
		{
			mode = { "n" },
			lhs = "gs",
			rhs = ":Switch<cr>",
			options = { silent = true },
			description = "Switch the opposite meaning of the word",
		},
	})
end

return M
