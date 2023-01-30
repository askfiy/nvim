-- https://github.com/RRethy/vim-illuminate

local aid = require("utils.aid")

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
        filetypes_denylist = aid.get_plugins_filetype_conf_by_name("vim-illuminate"),
    })
end

function M.after() end

return M
