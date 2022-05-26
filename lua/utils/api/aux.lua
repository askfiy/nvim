local aux = {}

--[[
    Toggle sidebar

    target_ft: expected sidebar file type to open
]]
function aux.toggle_sidebar(target_ft)
    local offset_ft = {
        "NvimTree",
        "undotree",
        "dbui",
        "spectre_panel",
    }
    local wins = vim.api.nvim_list_wins()
    for _, win_id in ipairs(wins) do
        if vim.api.nvim_win_is_valid(win_id) then
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")
            if ft ~= target_ft and vim.tbl_contains(offset_ft, ft) then
                vim.api.nvim_win_close(win_id, true)
            end
        end
    end
end


return aux
