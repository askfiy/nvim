-- https://github.com/dstein64/nvim-scrollview

local aid = require("utils.aid")

local M = {
    requires = {
        "scrollview",
    },
}

function M.before() end

function M.load()
    M.scrollview.setup({
        -- only show in current window
        current_only = true,
        -- transparency
        winblend = 0,
        -- offset
        base = "right",
        column = 1,
        character = "",
        excluded_filetypes = aid.get_plugins_filetype_conf_by_name("nvim-scrollview"),
    })
end

function M.after() end

return M
