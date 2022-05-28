-- https://github.com/AndrewRadev/switch.vim

local str = require("utils.api.str")
local mapping = require("core.mapping")

local M = {
    word_antisense_switch = {
        { "true", "false" },
        { "on", "off" },
        { "yes", "no" },
        { "disable", "enable" },
        { "open", "close" },
        { "in", "out" },
        { "resolve", "reject" },
        { "start", "end" },
        { "before", "after" },
        { "from", "to" },
        { "relative", "absolute" },
        { "up", "down" },
        { "left", "right" },
        { "row", "column" },
        { "drak", "light" },
        { "white", "black" },
        { "get", "post" },
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

function M.entrance()
    M.register_global_key()

    local put_words = vim.deepcopy(M.word_antisense_switch)

    for _, value in ipairs(M.word_antisense_switch) do
        local upper_words = { string.upper(value[1]), string.upper(value[2]) }
        local title_words = { str.title(value[1]), str.title(value[2]) }
        table.insert(put_words, upper_words)
        table.insert(put_words, title_words)
    end

    vim.g.switch_custom_definitions = put_words
    vim.g.variable_style_switch_definitions = M.variable_style_switch
end

function M.register_global_key()
    mapping.register({
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
