-- https://github.com/theHamsta/nvim-dap-virtual-text

local M = {
    safe_requires = {
        { "nvim-dap-virtual-text", "nvim_dap_virtual_text" },
    },
}

function M.before() end

function M.load()
    M.nvim_dap_virtual_text.setup()
end

function M.after() end

return M
