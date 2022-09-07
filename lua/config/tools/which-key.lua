local M = {
    requires = {
        "which-key",
    },
}

function M.before() end

function M.load()
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
        r = { name = "Replace", w = "Replace Word To ..." },
        s = { name = "Session" },
        u = { name = "Upload" },
        t = {
            name = "Terminal | Translate",
            c = "Translate English to Chinese",
            e = "Translate Chinese to English",
        },
    }, { prefix = "<leader>", mode = "n" })

    -- comment
    M.which_key.register({
        c = {
            name = "Comment",
            c = "Toggle line comment",
            b = "Toggle block comment",
            a = "Insert line comment to line end",
            j = "Insert line comment to next line",
            k = "Insert line comment to previous line",
        },
    }, { prefix = "g", mode = "n" })

    M.which_key.register({
        c = "Switch the specified line to a line comment",
        b = "Switch the specified line to a block comment",
    }, { prefix = "g", mode = "v" })

    -- surround
    M.which_key.register({
        q = "Switch Surround",
        s = "Change Surround",
    }, { prefix = "c", mode = "n" })

    M.which_key.register({
        s = "Delete Surround",
    }, { prefix = "d", mode = "n" })

    M.which_key.register({
        s = "Add Surround",
    }, { prefix = "y", mode = "n" })
end

return M
