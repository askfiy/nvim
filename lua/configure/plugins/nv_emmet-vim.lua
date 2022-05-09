-- https://github.com/mattn/emmet-vim

local M = {}

function M.entrance()
	vim.g.user_emmet_mode = "a"
	vim.g.user_emmet_leader_key = "<c-f>"
end

return M
