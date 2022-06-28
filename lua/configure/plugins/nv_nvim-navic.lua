-- https://github.com/SmiteshP/nvim-navic

local api = require("utils.api")
local options = require("core.options")

local M = {
    safe_requires = {
        { "nvim-navic", "navic" },
    },
    icons = api.get_icons("lsp_kind", true),
}

function M.before()
    M.ignore_filetype = {
        "markdown",
        "NvimTree",
        "aerial",
        "undotree",
        "spectre_panel",
        "dbui",
        "toggleterm",
        "notify",
        "startuptime",
        "packer",
        "lsp-installer",
        "help",
        "terminal",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "",
    }
end

function M.load()
    M.navic.setup({
        icons = M.icons,
        highlight = true,
        separator = " > ",
    })
end

function M.after()
    if not options.show_winbar then
        return
    end

    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = M.ignore_filetype,
        callback = function()
            vim.opt_local.winbar = ""
        end,
    })

    vim.api.nvim_create_autocmd(
        { "DirChanged", "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufNewFile" },
        {
            callback = function()
                if vim.tbl_contains(M.ignore_filetype, vim.bo.filetype) then
                    vim.opt_local.winbar = ""
                    return
                end
                vim.opt_local.winbar = "%{%v:lua.require('nvim-navic').get_location()%}"
            end,
        }
    )
end

return M
