-- https://github.com/mattn/emmet-vim

local M = {}

function M.entrance()
    -- Enable emmet in all modes
    vim.g.user_emmet_mode = "a"
    -- Modify the default button
    vim.g.user_emmet_leader_key = "<c-e>"
end

return M
