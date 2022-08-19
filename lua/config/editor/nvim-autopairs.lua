-- https://github.com/windwp/nvim-autopairs

local M = {
    requires = {
        "nvim-autopairs"
    }
}

function M.before() end

function M.load()
    M.nvim_autopairs.setup({
        map_c_h = true,
        map_c_w = true
    })
end

function M.after() end

return M


