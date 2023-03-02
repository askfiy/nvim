-- https://github.com/askfiy/visual_studio_code

local options = require("core.options")

local M = {
    requires = {
        "visual_studio_code",
    },
}

function M.before() end

function M.load()
    M.visual_studio_code.setup({
        mode = "dark",
        preset = true,
        transparent = options.transparent,
        expands = {
            hop = true,
            lazy = true,
            aerial = true,
            fidget = true,
            null_ls = true,
            nvim_cmp = true,
            gitsigns = true,
            which_key = true,
            nvim_tree = true,
            lspconfig = true,
            telescope = true,
            bufferline = true,
            nvim_navic = true,
            nvim_notify = true,
            vim_illuminate = true,
            nvim_treesitter = true,
            nvim_ts_rainbow = true,
            nvim_scrollview = true,
            indent_blankline = true,
            vim_visual_multi = true,
        },
        hooks = {
            ---@diagnostic disable-next-line: unused-local
            before = function(conf, colors, utils) end,
            ---@diagnostic disable-next-line: unused-local
            after = function(conf, colors, utils) end,
        },
    })
end

function M.after() end

return M
