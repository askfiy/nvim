-- https://github.com/AckslD/nvim-neoclip.lua

local mapping = require("core.mapping")

local function is_whitespace(line)
    return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
    for _, entry in ipairs(tbl) do
        if not check(entry) then
            return false
        end
    end
    return true
end

require("neoclip").setup(
    {
        filter = function(data)
            return not all(data.event.regcontents, is_whitespace)
        end,
        keys = {
            telescope = {
                i = {
                    select = "<nop>",
                    paste = mapping.plugin.nvim_neoclip.confirm_select,
                    paste_behind = "<nop>",
                    replay = "<nop>", -- replay a macro
                    delete = mapping.plugin.nvim_neoclip.insert_delete_yank,
                    custom = {}
                },
                n = {
                    select = "<nop>",
                    paste = mapping.plugin.nvim_neoclip.confirm_select,
                    paste_behind = "<nop>",
                    replay = "<nop>",
                    delete = mapping.plugin.nvim_neoclip.noremal_delete_yank,
                    custom = {}
                }
            }
        }
    }
)
