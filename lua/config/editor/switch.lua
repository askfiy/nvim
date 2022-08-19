-- https://github.com/AndrewRadev/switch.vim

local api = require("utils.api")

local M = {

    word_antisense_switch = {
        { "true", "false" },
        { "on", "off" },
        { "yes", "no" },
        { "disable", "enable" },
        { "enabled", "disabled" },
        { "success", "failure" },
        { "open", "close" },
        { "in", "out" },
        { "resolve", "reject" },
        { "start", "end" },
        { "before", "after" },
        { "from", "to" },
        { "relative", "absolute" },
        { "up", "down" },
        { "left", "right" },
        { "top", "bottom" },
        { "first", "last" },
        { "next", "prev" },
        { "row", "column" },
        { "dark", "light" },
        { "inferior", "superior" },
        { "lower", "upper" },
        { "selected", "unselected" },
        { "active", "inactive" },
        { "white", "black" },
        { "get", "post" },
        { "forward", "backward" },
        { "odd", "even" },
        { "+", "-" },
        { ">", "<" },
        { "=", "!=" },
    },

    variable_style_switch = {
        {
            ["\\<[a-z0-9]\\+_\\k\\+\\>"] = {
                ["_\\(.\\)"] = "\\U\\1",
            },
        },
        {
            ["\\<[a-z0-9]\\+[A-Z]\\k\\+\\>"] = {
                ["\\([A-Z]\\)"] = "_\\l\\1",
            },
        },
    },
}

M._viml = true

function M.str_title(s)
    return (s:gsub("(%a)([%w_']*)", function(f, r)
        return f:upper() .. r:lower()
    end))
end

function M.before()
    M.register_key()
end

function M.load()
    local put_words = vim.deepcopy(M.word_antisense_switch)

    for _, value in ipairs(M.word_antisense_switch) do
        local upper_words = { string.upper(value[1]), string.upper(value[2]) }
        local title_words = { M.str_title(value[1]), M.str_title(value[2]) }
        table.insert(put_words, upper_words)
        table.insert(put_words, title_words)
    end

    vim.g.switch_custom_definitions = put_words
    vim.g.variable_style_switch_definitions = M.variable_style_switch
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "gs",
            rhs = ":Switch<cr>",
            options = { silent = true },
            description = "Switch the opposite meaning of the word",
        },
        {
            mode = { "n" },
            lhs = "gS",
            rhs = function()
                vim.fn["switch#Switch"]({ definitions = vim.g.variable_style_switch_definitions })
            end,
            options = { silent = true },
            description = "Switch variable naming style",
        },
    })
end

return M
