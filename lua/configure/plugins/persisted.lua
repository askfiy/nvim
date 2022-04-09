-- https://github.com/olimorris/persisted.nvim

-- show a small icon if restore session is available
vim.g.persisted = true

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
    local win_id = nil
    for _, buf_id in ipairs(bufs) do
        local buf_name = vim.api.nvim_buf_get_name(buf_id)
        if buf_name ~= "" then
            for _, name in ipairs(del_bufs_filename) do
                if buf_name:find(name) then
                    vim.api.nvim_buf_delete(buf_id, {force = true})
                    break
                end
            end
            if not win_id and #vim.fn.win_findbuf(buf_id) ~= 0 then
                win_id = vim.fn.win_findbuf(buf_id)[1]
            end
            if buf_name:find("NvimTree") then
                -- FIX: don't focus on NvimTree window
                vim.cmd("lua require'nvim-tree'.toggle(false, true)")
            -- vim.fn.win_gotoid(win_id)
            end
        else
            vim.api.nvim_buf_delete(buf_id, {force = true})
        end
    end

    vim.api.nvim_win_set_height(0, 100)
end
