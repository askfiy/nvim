-- https://github.com/kosayoda/nvim-lightbulb

local M = {
    requires = {
        "nvim-lightbulb",
    },
}

function M.before() end

function M.load()
    -- only enable display in symbol column
    M.nvim_lightbulb.setup({
        ignore = {},
        sign = {
            enabled = true,
            priority = 15,
        },
        float = {
            enabled = false,
            text = "💡",
            win_opts = {},
        },
        virtual_text = {
            enabled = false,
            text = "💡",
            hl_mode = "replace",
        },
        status_text = {
            enabled = false,
            text = "💡",
            text_unavailable = "",
        },
    })
end

function M.after()
    -- set the highlight in the symbol column
    vim.fn.sign_define("LightBulbSign", { text = "💡", texthl = "DiagnosticSignWarn", linehl = "", numhl = "" })

    -- create an autocommand that displays a small light bulb when code actions are available
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI"}, {
        pattern = { "*" },
        callback = function()
            M.nvim_lightbulb.update_lightbulb()
        end,
    })
end

return M
