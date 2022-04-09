-- https://github.com/olimorris/persisted.nvim

local persisted = require("persisted")

local del_bufs_filename = {
    "translate",
    "undotree",
    "dbui",
    "dbout",
    "dev",
    "query",
    "spectre",
    "DAP",
    "toggleterm",
    "NvimTree",
    "startuptime"
}

persisted.setup()

persisted.load_session_all = function()
    vim.cmd("SessionLoad")

    local bufs = vim.api.nvim_list_bufs()
    for _, buf_id in ipairs(bufs) do
        local buf_name = vim.api.nvim_buf_get_name(buf_id)
        if buf_name ~= "" then
            for _, name in ipairs(del_bufs_filename) do
                if buf_name:find(name) then
                    vim.api.nvim_buf_delete(buf_id, {force = true})
                    break
                end
            end
        else
            vim.api.nvim_buf_delete(buf_id, {force = true})
        end
    end

    -- vim.api.nvim_win_set_height(0, 100)
end
