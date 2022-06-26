-- https://github.com/SmiteshP/nvim-navic

local icons = require("utils.icons")
local options = require("core.options")

local M = {
    ignore_filetype = {
        "NvimTree",
        "aerial",
        "undotree",
        "spectre_panel",
        "dbui",
        "toggleterm",
        "startuptime",
        "packer",
        "help",
        "TelescopePrompt",
        "TelescopeResults",
        "",
    },
    icons = icons[options.icons_style],
}

function M.before()
    for k, v in pairs(M.icons) do
        M.icons[k] = v .. " "
    end
end

function M.load()
    local ok, m = pcall(require, "nvim-navic")
    if not ok then
        return
    end

    M.navic = m
    M.navic.setup({
        icons = M.icons,
        highlight = true,
        separator = " > ",
    })
end

function M.after()
    vim.api.nvim_create_autocmd({ "DirChanged", "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter" }, {
        callback = function()
            if vim.tbl_contains(M.ignore_filetype, vim.bo.filetype) then
                vim.opt_local.winbar = ""
                return
            end
            vim.opt_local.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
        end,
    })
end

return M
