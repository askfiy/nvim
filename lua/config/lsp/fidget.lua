-- https://github.com/j-hui/fidget.nvim

local M = {
    requires = {
        "fidget",
    },
}

function M.before() end

function M.load()
    M.fidget.setup({
        window = {
            blend = 0,
        },
    })
end

function M.after() end

return M
