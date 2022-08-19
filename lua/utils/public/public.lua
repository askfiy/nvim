local public = {}

function public.get_icons(name, fill)
    local icons = require("utils.public.icons")

    if not fill then
        return icons[name]
    end

    local fill_icons = {}

    for icon_name, icon_value in pairs(icons[name]) do
        fill_icons[icon_name] = string.format("%s ", icon_value)
    end

    return fill_icons
end

function public.get_all_win_buf_ft()
    local result = {}
    local win_tbl = vim.api.nvim_list_wins()
    for _, win_id in ipairs(win_tbl) do
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

function public.get_all_float_win()
    local result = {}
    local win_tbl = vim.api.nvim_list_wins()
    for _, win_id in ipairs(win_tbl) do
        local win_config = vim.api.nvim_win_get_config(win_id)
        if ((win_config.width or 0) > 1) and win_config.relative ~= "" then
            table.insert(result, {
                id = win_id,
                config = win_config,
            })
        end
    end
    return result
end

function public.toggle_sidebar(target_ft)
    local offset_ft = {
        "NvimTree",
        "undotree",
        "dbui",
        "spectre_panel",
    }
    for _, opts in ipairs(public.get_all_win_buf_ft()) do
        if opts.buf_ft ~= target_ft and vim.tbl_contains(offset_ft, opts.buf_ft) then
            vim.api.nvim_win_close(opts.win_id, true)
        end
    end
end

function public.terminal_offset_run_command(command)
    local offset_ft = {

        ---@diagnostic disable-next-line: unused-local
        NvimTree = function(win_id)
            vim.cmd("NvimTreeToggle")
            vim.cmd(command)
            require("nvim-tree").toggle(false, true)
        end,

        ---@diagnostic disable-next-line: unused-local
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

            for _, opts in ipairs(public.get_all_win_buf_ft()) do
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

    local all_win_buf_ft = public.get_all_win_buf_ft()

    local aerial_exists = false
    local aerial_win_id = 0
    local aerial_width = 0

    for _, opts in ipairs(all_win_buf_ft) do
        if opts.buf_ft == "aerial" then
            aerial_exists = true
            aerial_win_id = opts.win_id
            aerial_width = vim.api.nvim_win_get_width(opts.win_id)
        end
    end

    for _, opts in ipairs(all_win_buf_ft) do
        if vim.tbl_contains(vim.tbl_keys(offset_ft), opts.buf_ft) then
            offset_ft[opts.buf_ft](opts.win_id)

            -- Resize aerial width
            if aerial_exists then
                vim.api.nvim_win_set_width(aerial_win_id, aerial_width)
            end

            return
        end
    end

    vim.cmd(command)
end

return public
