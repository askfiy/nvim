-- https://github.com/rcarriga/nvim-notify

local api = require("utils.api")
local options = require("core.options")
local public = require("utils.public")
local icons = public.get_icons("diagnostic", true)

local M = {
    requires = {
        "notify",
    },
}

function M.before()
    M.register_key()

    M.echo_message = {
        -- DAP
        "could not find file",
        "Debug adapter disconnected",
        "No stopped threads. Cannot move",
        -- TODO-command
        "Invalid buffer id: %d*",
    }

    M.ignore_message = {
        -- navic
        'nvim%-navic: Server ".*" does not support documentSymbols.',
        -- LSP
        "%[LSP%]%[.+%] timeout",
        "LSP%[id=%d*%] client has shut down after sending Log",
        "LSP%[id=%d*%] client has shut down during progress update",
        "LSP%[id=%d*%] client has shut down while creating progress report",
        "LSP%[%d*%] client has shut down after sending a workspace/configuration request",
        "method textDocument/signatureHelp is not supported by any of the servers registered for the current buffer",
        "method textDocument/documentSymbol is not supported by any of the servers registered for the current buffer",
    }
end

function M.load()
    local notify_options = {
        stages = "fade",
        timeout = 3000,
        fps = 120,
        icons = {
            ERROR = icons.Error,
            WARN = icons.Warn,
            INFO = icons.Hint,
        },
    }

    if options.transparent then
        notify_options.background_colour = "#1E1E2E"
    end

    M.notify.setup(notify_options)

    vim.notify = setmetatable({}, {
        ---@diagnostic disable-next-line: unused-local
        __call = function(self, message, ...)
            for _, v in ipairs(M.ignore_message) do
                if message:match(v) then
                    return
                end
            end

            for _, v in ipairs(M.echo_message) do
                if message:match(v) then
                    vim.api.nvim_echo({ { message, "MoreMsg" } }, false, {})
                    return
                end
            end

            return M.notify(message, ...)
        end,

        __index = M.notify,
    })
end

function M.after() end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<leader>fn",
            rhs = ":Notifications<cr>",
            options = { silent = true },
            description = "Find notices history",
        },
    })
end

return M
