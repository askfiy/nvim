-- https://github.com/onsails/lspkind-nvim

local utils = require("utils")
local options = require("core.options")

require("lspkind").init(
    {
        symbol_map = utils.icons[options.icons]
    }
)
