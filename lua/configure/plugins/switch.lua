-- https://github.com/AndrewRadev/switch.vim

local api = require("utils.api")

local words1 = {
    -- status
    {"true", "false"},
    {"on", "off"},
    {"yes", "no"},
    {"disable", "enable"},
    {"open", "close"},
    {"in", "out"},
    {"resolve", "reject"},
    -- event
    {"start", "end"},
    {"before", "after"},
    {"from", "to"},
    {"relative", "absolute"},
    -- direction
    {"up", "down"},
    {"left", "right"},
    {"row", "column"},
    -- color
    {"drak", "light"},
    {"white", "black"},
    -- network
    {"get", "post"},
    -- symbol
    {"+", "-"},
    {">", "<"},
    {"=", "!="}
}

local words2 = vim.deepcopy(words1)

for _, value in ipairs(words1) do
    local upper_words = {string.upper(value[1]), string.upper(value[2])}
    local title_words = {api.string.title(value[1]), api.string.title(value[2])}
    table.insert(words2, upper_words)
    table.insert(words2, title_words)
end

vim.g.switch_custom_definitions = words2
