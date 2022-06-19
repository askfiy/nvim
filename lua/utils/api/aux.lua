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

--[[
    Keep the terminal's window offset when there is a sidebar
]]
function aux.terminal_offset_run_command(command)
    local offset_ft = {

        NvimTree = function(win_id)
            vim.cmd("NvimTreeToggle")
            vim.cmd(command)
            require("nvim-tree").toggle(false, true)
        end,

        undotree = function(win_id)
            vim.g.undotree_SetFocusWhenToggle = 0
            vim.cmd("UndotreeToggle")
            vim.cmd(command)
            vim.cmd("UndotreeToggle")
            vim.g.undotree_SetFocusWhenToggle = 1
        end,

        dbui = function(win_id)
            vim.api.nvim_win_close(win_id, true)
            vim.cmd(command)
            vim.cmd("DBUIToggle")

            local max_term_id = 0
            local max_win_id = 0
            ---@diagnostic disable-next-line: redefined-local
            for _, winid in ipairs(vim.api.nvim_list_wins()) do
                if vim.api.nvim_win_is_valid(winid) then
                    local buf_id = vim.api.nvim_win_get_buf(winid)
                    local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")
                    if ft == "toggleterm" then
                        local buf_name = vim.api.nvim_buf_get_name(buf_id)
                        local term_id = tonumber(buf_name:match("#(%d+)$"))
                        max_term_id = math.max(max_term_id, term_id)
                        max_win_id = winid
                    end
                end
            end

            if max_win_id ~= 0 then
                vim.fn.win_gotoid(max_win_id)
            end
        end,
    }

    local wins = vim.api.nvim_list_wins()

    for _, win_id in ipairs(wins) do
        if vim.api.nvim_win_is_valid(win_id) then
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            local ft = vim.api.nvim_buf_get_option(buf_id, "filetype")
            if vim.tbl_contains(vim.tbl_keys(offset_ft), ft) then
                offset_ft[ft](win_id)
                return
            end
        end
    end

    vim.cmd(command)
end

return aux
