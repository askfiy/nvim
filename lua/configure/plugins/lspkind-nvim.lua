-- https://github.com/onsails/lspkind-nvim

local options = require("core.options")

require("lspkind").init(
    {
        symbol_map = options.kind_icons
    }
)
