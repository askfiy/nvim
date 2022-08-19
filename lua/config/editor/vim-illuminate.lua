-- https://github.com/RRethy/vim-illuminate

local M = {}

M._viml = true

function M.before() end

function M.load()
    vim.g.Illuminate_delay = 100
    vim.g.Illuminate_ftblacklist = {
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

function M.after() end

return M
