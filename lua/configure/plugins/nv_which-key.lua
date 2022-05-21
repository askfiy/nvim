-- https://github.com/folke/which-key.nvim

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "which-key")
    if not ok then
        return
    end

    M.which_key = m

    -- FIX: <telescope c-r> bug
    local show = M.which_key.show
    M.which_key.show = function(keys, opts)
        if vim.bo.filetype == "TelescopePrompt" then
            return
        end
        show(keys, opts)
    end

    M.which_key.setup({
        plugins = {
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
        icons = {
            breadcrumb = " ",
            separator = " ",
            group = " ",
        },
    })
end

function M.after()
    -- global leader
    M.which_key.register({
        b = { name = "Buffers" },
        c = { name = "Code" },
        d = { name = "Debug" },
        f = { name = "Find" },
        g = { name = "Git" },
        r = { name = "Replace" },
        s = { name = "Session" },
        u = { name = "Upload" },
        t = {
            name = "Terminal | Translate",
            c = "Translate English to Chinese",
            e = "Translate Chinese to English",
        },
    }, { prefix = "<leader>" })

    -- comment
    M.which_key.register({
        c = {
            name = "Toggle line comment",
            c = "Toggle line comment",
            b = "Toggle block comment",
            a = "Insert line comment to line end",
            j = "Insert line comment to next line",
            k = "Insert line comment to previous line",
        },
        b = {
            name = "Switch the specified line to a block comment",
        },
    }, { prefix = "g" })

    -- surround
    M.which_key.register({
        q = "Switch Surround",
        s = "Change Surround",
    }, { prefix = "c" })

    M.which_key.register({
        s = "Delete Surround",
    }, { prefix = "d" })

    M.which_key.register({
        s = "Add Surround",
    }, { prefix = "y" })
end

return M
