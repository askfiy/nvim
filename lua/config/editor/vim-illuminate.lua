-- https://github.com/RRethy/vim-illuminate

local M = {
    requires = {
        "illuminate",
    },
}

function M.before() end

function M.load()
    M.illuminate.configure({
        delay = 100,
        under_cursor = true,
        modes_denylist = { "i" },
        providers = {
            --[[ "lsp", ]]
            "regex",
            "treesitter",
        },
        filetypes_denylist = {
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
        },
    })
end

function M.after() end

return M
