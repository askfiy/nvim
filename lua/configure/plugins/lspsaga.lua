-- https://github.com/tami5/lspsaga.nvim

local icons = require("utils.icons")
local mapping = require("core.mapping")

require("lspsaga").setup(
    {
        -- round、single、double
        border_style = "round",
        error_sign = icons.diagnostics.error,
        warn_sign = icons.diagnostics.warning,
        infor_sign = icons.diagnostics.info,
        hint_sign = icons.diagnostics.hint,
        diagnostic_header_icon = " ",
        -- show current write line icons
        code_action_icon = " ",
        code_action_prompt = {
            -- colose current write line hint
            enable = false,
            sign = true,
            sign_priority = 40,
            virtual_text = true
        },
        code_action_keys = {
            quit = mapping.plugin.lspsaga.quit,
            exec = mapping.plugin.lspsaga.exec
        },
        rename_action_keys = {
            quit = mapping.plugin.lspsaga.quit,
            exec = mapping.plugin.lspsaga.exec
        }
    }
)
