-- https://github.com/theHamsta/nvim-dap-virtual-text

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-dap-virtual-text")
    if not ok then
        return
    end

    M.nvim_dap_virtual_text = m
    M.nvim_dap_virtual_text.setup()
end

function M.after() end

return M
