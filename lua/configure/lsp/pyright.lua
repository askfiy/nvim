return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    handlers = {
        ---@diagnostic disable-next-line: unused-vararg
        ["textDocument/publishDiagnostics"] = function(...)
        end
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
}
