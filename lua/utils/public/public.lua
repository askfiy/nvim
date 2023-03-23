local M = {}

function M.get_icons_group(icon_group_name, has_suffix_space)
    local icons = vim.deepcopy(require("utils.public.icons")[icon_group_name])

    if has_suffix_space then
        for icon_tag, icon_code in pairs(icons) do
            icons[icon_tag] = ("%s "):format(icon_code)
        end
    end

    return icons
end

function M.get_all_window_buffer_filetype()
    local window_buffer_filetype = {}
    local window_tables = vim.api.nvim_list_wins()

    for _, window_id in ipairs(window_tables) do
        if vim.api.nvim_win_is_valid(window_id) then
            local buffer_id = vim.api.nvim_win_get_buf(window_id)
            table.insert(window_buffer_filetype, {
                window_id = window_id,
                buffer_id = buffer_id,
                buffer_filetype = vim.api.nvim_buf_get_option(buffer_id, "filetype"),
            })
        end
    end

    return window_buffer_filetype
end

function M.toggle_sidebar(target_filetype)
    local close_prev_filetypes = {
        "NvimTree",
        "undotree",
        "dbui",
        "spectre_panel",
    }

    for _, opts in ipairs(M.get_all_window_buffer_filetype()) do
        if vim.tbl_contains(close_prev_filetypes, opts.buffer_filetype) and opts.buffer_filetype ~= target_filetype then
            vim.api.nvim_win_close(opts.window_id, true)
        end
    end
end

function M.terminal_offset_run_command(command)
    local offset_filetype = {
        ---@diagnostic disable-next-line: unused-local
        NvimTree = function(window_id)
            vim.cmd("NvimTreeToggle")
            vim.cmd(command)
            require("nvim-tree.api").tree.toggle({
                focus = false,
            })
        end,

        ---@diagnostic disable-next-line: unused-local
        undotree = function(window_id)
            vim.g.undotree_SetFocusWhenToggle = 0
            vim.cmd("UndotreeToggle")
            vim.cmd(command)
            vim.cmd("UndotreeToggle")
            vim.g.undotree_SetFocusWhenToggle = 1
        end,

        dbui = function(window_id)
            vim.api.nvim_win_close(window_id, true)
            vim.cmd(command)
            vim.cmd("DBUIToggle")

            local max_window_id = 0
            local max_terminal_id = 0

            for _, opts in ipairs(M.get_all_window_buffer_filetype()) do
                if opts.buffer_filetype == "toggleterm" then
                    local buffer_name = vim.api.nvim_buf_get_name(opts.buffer_id)
                    local terminal_id = tonumber(buffer_name:match("#(%d+)$"))

                    max_window_id = opts.window_id
                    max_terminal_id = math.max(max_terminal_id, terminal_id)
                end
            end

            if max_window_id ~= 0 then
                vim.fn.win_gotoid(max_window_id)
            end
        end,
    }

    local aerial_info = M.get_aerial_info()

    local all_window_buffer_filetype = M.get_all_window_buffer_filetype()
    for _, opts in ipairs(all_window_buffer_filetype) do
        if vim.tbl_contains(vim.tbl_keys(offset_filetype), opts.buffer_filetype) then
            offset_filetype[opts.buffer_filetype](opts.window_id)

            M.reset_aerial_width(aerial_info)

            return
        end
    end

    vim.cmd(command)
end

-- Fix the width problem of aerial:
-- Achievement conditions:
-- Turn on toggleterm, aerial, and then continue to open/close nvimtree or dbui
-- will affect the width calculation of aerial
-- Or this will happen when toggleterm is opened and closed continuously (on the premise that nvimtree or dbui has been opened)
function M.get_aerial_info()
    local all_window_buffer_filetype = M.get_all_window_buffer_filetype()

    local aerial_info = {
        exists = false,
        window_id = 0,
        width = 0,
    }

    for _, opts in ipairs(all_window_buffer_filetype) do
        if opts.buffer_filetype == "aerial" then
            aerial_info.exists = true
            aerial_info.window_id = opts.window_id
            aerial_info.width = vim.api.nvim_win_get_width(opts.window_id)
        end
    end

    return aerial_info
end

function M.reset_aerial_width(aerial_info)
    if aerial_info.exists then
        vim.api.nvim_win_set_width(aerial_info.window_id, aerial_info.width)
    end
end

return M
