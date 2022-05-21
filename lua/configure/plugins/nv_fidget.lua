-- https://github.com/j-hui/fidget.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "fidget")
    if not ok then
        return
    end

    M.fidget = m
    M.fidget.setup({
        window = {
            -- Window transparent
            blend = 0,
        },
    })
end

function M.after() end

return M
