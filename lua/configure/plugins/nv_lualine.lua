-- https://github.com/nvim-lualine/lualine.nvim

local api = require("utils.api")
local aux_lsp = require("utils.aux.lsp")

local M = {
    safe_requires = {
        { "lualine" },
    },
    icons = {
        platform = api.get_icons("platform", true),
        diagnostic = api.get_icons("diagnostic", true),
    },
    filter_filetype = {
        "NvimTree",
        "aerial",
        "dbui",
    },
}

function M.get_active_lsp()
    local message = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")

    local active_clients, ignore_lsp = aux_lsp.get_active_lsp_clients()

    if next(active_clients) == nil then
        return message
    end

    for _, client in ipairs(active_clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and not vim.tbl_contains(ignore_lsp, client.name) then
            return string.format("%%#LspStatusActive# %%*%s", client.name)
        end
    end

    return message
end

function M.before() end

function M.load()
    M.lualine.setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                {
                    "fileformat",
                    symbols = M.icons.platform,
                },
                {
                    "mode",
                    cond = function()
                        return not vim.tbl_contains(M.filter_filetype, vim.o.filetype)
                    end,
                },
                {
                    "filetype",
                    cond = function()
                        return vim.tbl_contains(M.filter_filetype, vim.o.filetype)
                    end,
                },
            },
            lualine_b = {
                {
                    "branch",
                },
                {
                    "diff",
                },
                {
                    "diagnostics",
                    symbols = {
                        error = M.icons.diagnostic.Error,
                        warn = M.icons.diagnostic.Warn,
                        info = M.icons.diagnostic.Info,
                        hint = M.icons.diagnostic.Hint,
                    },
                },
            },
            lualine_c = {
                {
                    "filename",
                },
            },
            lualine_x = {
                {
                    "filetype",
                },
                {
                    M.get_active_lsp,
                },
            },
            lualine_y = {
                {
                    "encoding",
                },
            },
            lualine_z = {
                {
                    "location",
                },
                {
                    "progress",
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

function M.after()
    api.hl.set("LspStatusActive", {
        fg = api.hl.get("Function", "fg"),
        bg = api.hl.get("lualine_a_inactive", "bg"),
        bold = false,
    })
end

return M
