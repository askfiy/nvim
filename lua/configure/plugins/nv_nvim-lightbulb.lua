-- https://github.com/kosayoda/nvim-lightbulb

local icons = require("utils.icons")

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-lightbulb")
    if not ok then
        return
    end

    M.nvim_lightbulb = m
    -- Only enable display in symbol column
    M.nvim_lightbulb.setup({
        ignore = {},
        sign = {
            enabled = true,
            priority = 15,
        },
        float = {
            enabled = false,
            text = icons.lsp_hover.Action,
            win_opts = {},
        },
        virtual_text = {
            enabled = false,
            text = icons.lsp_hover.Action,
            hl_mode = "replace",
        },
        status_text = {
            enabled = false,
            text = icons.lsp_hover.Action,
            text_unavailable = "",
        },
    })
end

function M.after()
    -- Set the highlight in the symbol column
    vim.fn.sign_define(
        "LightBulbSign",
        { text = icons.lsp_hover.Action, texthl = "DiagnosticSignWarn", linehl = "", numhl = "" }
    )

    -- Create an autocommand that displays a small light bulb when code actions are available
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        pattern = { "*" },
        callback = function()
            require("nvim-lightbulb").update_lightbulb()
        end,
    })
end

return M
