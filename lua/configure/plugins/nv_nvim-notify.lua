-- https://github.com/rcarriga/nvim-notify

local api = require("utils.api")
local options = require("core.options")

local M = {
    safe_requires = {
        { "notify" },
    },
    icons = api.get_icons("diagnostic", true),
    ignore_message = {
        -- LSP
        "%[LSP%]%[sumneko_lua%] timeout",
        "LSP%[id=%d*%] client has shut down after sending Log",
        "LSP%[id=%d*%] client has shut down during progress update",
        "LSP%[id=%d*%] client has shut down while creating progress report",
        "LSP%[%d*%] client has shut down after sending a workspace/configuration request",
        "method textDocument/documentSymbol is not supported by any of the servers registered for the current buffer",
        "nvim%-navic: Server \"%w*\" does not support documentSymbols."
    },
    echo_message = {
        -- DAP
        "Debug adapter disconnected",
        "could not find file",
        "No stopped thread. Cannot move",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    local notify_options = {
        stages = "fade",
        timeout = 3000,
        fps = 120,
        icons = {
            ERROR = M.icons.Error,
            WARN = M.icons.Warn,
            INFO = M.icons.Hint,
            DEBUG = " ",
            TRACE = "✎ ",
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
            rhs = function()
                require("telescope").extensions.notify.notify()
            end,
            options = { silent = true },
            description = "Find notices history",
        },
    })
end

return M
