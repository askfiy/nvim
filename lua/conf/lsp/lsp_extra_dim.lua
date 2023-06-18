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
        hooks = {
            lsp_filter = function(diagnostics, create_mark)
                return vim.tbl_filter(function(diagnostic)
                    -- python
                    if diagnostic.message:find(".*is not accessed.*") ~= nil then
                        create_mark(diagnostic)
                        return false
                    end

                    -- lua
                    if diagnostic.code == "unused-function" then
                        return false
                    end

                    return true
                end, diagnostics)
            end,
        },
    })
end

function M.after() end

return M
