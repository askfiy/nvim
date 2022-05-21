-- https://github.com/nvim-lualine/lualine.nvim

local icons = require("utils.icons")

local M = {
    filter_ft = {
        "NvimTree",
        "aerial",
        "dbui",
    },
    platform_icons = {
        unix = " ",
        dos = " ",
        mac = " ",
    },
}

function M.before() end

function M.load()
    local ok, m = pcall(require, "lualine")
    if not ok then
        return
    end

    M.lualine = m
    M.lualine.setup({
        options = {
            -- Whether to enable symbols
            icons_enabled = true,
            -- App theme
            theme = "auto",
            -- Separator
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            -- Disabled file types
            disabled_filetypes = {},
            -- Enable global status bar
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                {
                    "fileformat",
                    symbols = M.platform_icons,
                    fmt = M.trunc(12, 0, nil, true),
                },
                {
                    "mode",
                    cond = function()
                        return not vim.tbl_contains(M.filter_ft, vim.o.filetype)
                    end,
                    fmt = M.trunc(22, 0, nil, true),
                },
                {
                    "filetype",
                    cond = function()
                        return vim.tbl_contains(M.filter_ft, vim.o.filetype)
                    end,
                    fmt = M.trunc(12, 0, nil, true),
                },
            },
            lualine_b = {
                {
                    "branch",
                    fmt = M.trunc(70, 0, nil, true),
                },
                {
                    "diff",
                    fmt = M.trunc(85, 0, nil, true),
                },
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.error,
                        warn = icons.diagnostics.warning,
                        info = icons.diagnostics.info,
                        hint = icons.diagnostics.hint,
                    },
                    fmt = M.trunc(90, 0, nil, true),
                },
            },
            lualine_c = {
                {
                    "filename",
                    fmt = M.trunc(37, 0, nil, true),
                },
            },
            lualine_x = {
                {
                    "filetype",
                    fmt = M.trunc(42, 0, nil, true),
                },
            },
            lualine_y = {
                {
                    "encoding",
                    fmt = M.trunc(52, 0, nil, true),
                },
            },
            lualine_z = {
                {
                    "location",
                    fmt = M.trunc(61, 0, nil, true),
                },
                {
                    "progress",
                    fmt = M.trunc(12, 0, nil, true),
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
    })
end

function M.after() end

function M.jump() end

function M.trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
    return function(str)
        local win_width = vim.fn.winwidth(0)
        if hide_width and win_width < hide_width then
            return ""
        elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
            return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
        end
        return str
    end
end

return M
