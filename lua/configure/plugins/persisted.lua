-- https://github.com/olimorris/persisted.nvim

-- show a small icon if restore session is available
vim.g.persisted = true

local persisted = require("persisted")

persisted.setup()

persisted.load_session_all = function()
    vim.cmd("SessionLoad")
    local bufs = vim.api.nvim_list_bufs()
    local win_id = nil

    for _, buf_id in ipairs(bufs) do
        local buf_name = vim.api.nvim_buf_get_name(buf_id)
        if buf_name == "" then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("translate") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("undotree") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("dbui") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("dbout") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("dev") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("query") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("spectre") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("DAP") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
        elseif buf_name:find("toggleterm") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
            vim.cmd("lua require('toggleterm').term_toggle()")
        elseif buf_name:find("NvimTree") then
            vim.api.nvim_buf_delete(buf_id, {force = true})
            vim.cmd("NvimTreeToggle")
        else
            if not win_id then
                if #vim.fn.win_findbuf(buf_id) ~= 0 then
                    win_id = vim.fn.win_findbuf(buf_id)[1]
                    vim.fn.win_gotoid(win_id)
                end
            end
        end
    end

    if win_id then
        vim.api.nvim_win_set_height(win_id, 100)
    end
end
