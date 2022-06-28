-- https://github.com/uga-rosa/translate.nvim

local api = require("utils.api")
local options = require("core.options")

local M = {
    safe_requires = {
        { "translate" },
    },
    replace_char = {
        ["u003d"] = "=",
        ["＃"] = "#",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.translate.setup({
        default = {
            command = "translate_shell",
            output = "floating",
            parse_before = "trim",
            parse_after = "replace_symbols",
        },
        preset = {
            output = {
                split = {
                    min_size = 8,
                },
                floating = {
                    border =  options.float_border and "single" or "none",
                },
            },
        },
        parse_after = {
            replace_symbols = {
                cmd = function(lines)
                    -- replace some special symbols
                    for i, line in ipairs(lines) do
                        for char, rep in pairs(M.replace_char) do
                            if line:match(char) then
                                lines[i] = line:gsub(char, rep)
                            end
                        end
                    end

                    return lines
                end,
            },
        },
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n", "v" },
            lhs = "<leader>tcs",
            rhs = ":Translate ZH -source=EN -output=split<cr>",
            options = { silent = true },
            description = "Translate English to Chinese and open in split window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tcr",
            rhs = ":Translate ZH -source=EN -output=replace<cr>",
            options = { silent = true },
            description = "Translate English to Chinese and replace English",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tcf",
            rhs = ":Translate ZH -source=EN -output=floating<cr>",
            options = { silent = true },
            description = "Translate English to Chinese and open in float window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tci",
            rhs = ":Translate ZH -source=EN -output=insert<cr>",
            options = { silent = true },
            description = "Translate English to Chinese and insert to next line",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tcc",
            rhs = ":Translate ZH -source=EN -output=register<cr>",
            options = { silent = true },
            description = "Translate English to Chinese and copy result to clipboard",
        },
        {
            mode = { "n" },
            lhs = "<leader>tcb",
            rhs = ":Translate ZH -source=EN -output=floating -comment<cr>",
            options = { silent = true },
            description = "Translate English comment to Chinese and open in float window",
        },
        {
            mode = { "n" },
            lhs = "<leader>tcw",
            rhs = ":normal! viw<cr>:Translate ZH -source=EN -output=floating<cr>",
            options = { silent = true },
            description = "Translate English word to Chinese and open in float window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tes",
            rhs = ":Translate EN -source=ZH -output=split<cr>",
            options = { silent = true },
            description = "Translate Chinese to English and open in split window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>ter",
            rhs = ":Translate EN -source=ZH -output=replace<cr>",
            options = { silent = true },
            description = "Translate Chinese to English and replace Chinese",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tef",
            rhs = ":Translate EN -source=ZH -output=floating<cr>",
            options = { silent = true },
            description = "Translate Chinese to English and open in float window",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tei",
            rhs = ":Translate EN -source=ZH -output=insert<cr>",
            options = { silent = true },
            description = "Translate Chinese to English and insert to next line",
        },
        {
            mode = { "n", "v" },
            lhs = "<leader>tec",
            rhs = ":Translate EN -source=ZH -output=register<cr>",
            options = { silent = true },
            description = "Translate Chinese to English and copy result to clipboard",
        },
        {
            mode = { "n" },
            lhs = "<leader>teb",
            rhs = ":Translate EN -source=ZH -output=floating -comment<cr>",
            options = { silent = true },
            description = "Translate Chinese comment to English and open in float window",
        },
        {
            mode = { "n" },
            lhs = "<leader>tew",
            rhs = ":normal! viw<cr>:Translate EN -source=ZH -output=floating<cr>",
            options = { silent = true },
            description = "Translate Chinese word to English and open in float window",
        },
    })
end

return M
