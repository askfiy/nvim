-- https://github.com/askfiy/lsp_extra_dim

local M = {
    requires = {
        "lsp_extra_dim",
    },
}

function M.before() end

function M.load()
    M.lsp_extra_dim.setup({
        disable_diagnostic_style = {
            "parameter",
        },
    })
end

function M.after() end

return M
