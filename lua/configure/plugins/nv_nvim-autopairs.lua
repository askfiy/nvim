-- https://github.com/windwp/nvim-autopairs

local M = {
    safe_requires = {
        { "nvim-autopairs", "autopairs" },
    },
}

function M.before() end

function M.load()
    M.autopairs.setup()
end

function M.after() end

return M
