local aux = {}

--[[
Get all win_id and buf_id and buf_filetype

Example:
     aux.get_all_win_buf_ft()

Returns:
     {{win_id = 1008, buf_id = 5, buf_ft = "main.c"}, ...}

]]
function aux.get_all_win_buf_ft()
    local result = {}
    local wins = vim.api.nvim_list_wins()

    for _, win_id in ipairs(wins) do
        if vim.api.nvim_win_is_valid(win_id) then
            local buf_id = vim.api.nvim_win_get_buf(win_id)
            table.insert(result, {
                win_id = win_id,
                buf_id = buf_id,
                buf_ft = vim.api.nvim_buf_get_option(buf_id, "filetype"),
            })
        end
    end

    return result
end

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

    for _, opts in ipairs(aux.get_all_win_buf_ft()) do
        if opts.buf_ft ~= target_ft and vim.tbl_contains(offset_ft, opts.buf_ft) then
            vim.api.nvim_win_close(opts.win_id, true)
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

            for _, opts in ipairs(aux.get_all_win_buf_ft()) do
                if opts.buf_ft == "toggleterm" then
                    local buf_name = vim.api.nvim_buf_get_name(opts.buf_id)
                    local term_id = tonumber(buf_name:match("#(%d+)$"))
                    max_term_id = math.max(max_term_id, term_id)
                    max_win_id = opts.win_id
                end
            end

            if max_win_id ~= 0 then
                vim.fn.win_gotoid(max_win_id)
            end
        end,
    }

    for _, opts in ipairs(aux.get_all_win_buf_ft()) do
        if vim.tbl_contains(vim.tbl_keys(offset_ft), opts.buf_ft) then
            offset_ft[opts.buf_ft](opts.win_id)
            return
        end
    end

    vim.cmd(command)
end

return aux
