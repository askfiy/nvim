-- https://github.com/jbyuki/venn.nvim

-- WARN: If you open venn mode too early, it may cause some keys in the buffer to fail
-- So it is recommended not to open venn mode in code files

local mapping = require("core.mapping")

local M = {
    notify = nil,
    cache_buffer_mappings = {},
}

function M.before()
    M.register_global_key()
end

function M.load()
    local ok, m = pcall(require, "venn")
    if not ok then
        return
    end

    M.venn = m
end

function M.after()
    M.wrapper_command()
end

function M.open_venn_notify()
    ---@diagnostic disable-next-line: missing-parameter
    vim.notify.dismiss()
    M.notify = vim.notify("Venn enabled", "info", {
        title = "Venn",
        keep = function()
            return vim.b.venn_enabled
        end,
        render = "minimal",
    })
end

function M.close_venn_notify()
    vim.notify("Venn disabled", "info", {
        title = "Venn",
        render = "minimal",
        replace = M.notify,
    })
end

function M.get_buffer_keymap() end

function M.wrapper_command()
    M.venn.toggle_venn_mode = function()
        local venn_enable = vim.b.venn_enabled
        if not venn_enable then
            vim.b.venn_enabled = true
            vim.wo.virtualedit = "all"
            M.cache_buffer_key()
            M.register_buffer_key(0)
            M.open_venn_notify()
        else
            vim.b.venn_enabled = false
            vim.wo.virtualedit = ""
            vim.cmd([[mapclear <buffer>]])
            M.remap_buffer_key()
            M.close_venn_notify()
        end
    end
end

function M.cache_buffer_key()
    for _, mode in ipairs({ "i", "v", "n" }) do
        M.buffer_mappings = vim.tbl_deep_extend("force", M.cache_buffer_mappings, vim.api.nvim_buf_get_keymap(0, mode))
    end
    vim.tbl_filter(function(key_map)
        return key_map.desc
    end, M.cache_buffer_mappings)
end

function M.remap_buffer_key()
    vim.tbl_map(function(key_map)
        if key_map.mode == " " then
            return
        end

        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs or key_map.callback, {
            buffer = key_map.buffer,
            desc = key_map.desc,
            silent = key_map.silent,
            expr = key_map.expr,
        })
    end, M.cache_buffer_mappings)
end

function M.register_global_key()
    mapping.register({
        {
            mode = { "n" },
            lhs = "<leader>5",
            rhs = function()
                require("venn").toggle_venn_mode()
            end,
            options = { silent = true },
            description = "Open Venn Mode",
        },
    })
end

function M.register_buffer_key(bufnr)
    mapping.register({
        {
            mode = { "n" },
            lhs = "<c-j>",
            rhs = "<c-v>j:VBox<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw line to down",
        },
        {
            mode = { "n" },
            lhs = "<c-k>",
            rhs = "<c-v>k:VBox<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw line to up",
        },
        {
            mode = { "n" },
            lhs = "<c-l>",
            rhs = "<c-v>l:VBox<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw line to left",
        },
        {
            mode = { "n" },
            lhs = "<c-h>",
            rhs = "<c-v>h:VBox<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw line to right",
        },
        {
            mode = { "v" },
            lhs = "b",
            rhs = ":VBox<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw hollow box",
        },
        {
            mode = { "v" },
            lhs = "f",
            rhs = ":VFill<cr>",
            options = { silent = true, buffer = bufnr },
            description = "Draw solid box",
        },
    })
end

return M
