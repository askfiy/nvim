-- https://github.com/theHamsta/nvim-dap-virtual-text

local M = {
    requires = {
        "nvim-dap-virtual-text",
    },
}

function M.before() end

function M.load()
    M.nvim_dap_virtual_text.setup()
end

function M.after() end

return M
