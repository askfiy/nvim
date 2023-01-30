-- https://github.com/askfiy/starlight

local options = require("core.options")

local M = {
    requires = {
        "starlight",
    },
}

function M.before() end

function M.load()
    M.starlight.setup({
        preset = true,
        transparent = options.transparent,
        style = {
            comments = { italic = true },
            functions = { italic = true },
            keywords = { italic = true },
            strings = { italic = true },
            variables = { italic = true },
        },
        extend = {
            hop = true,
            lazy = true,
            packer = false,
            aerial = true,
            fidget = true,
            nvim_cmp = true,
            gitsigns = true,
            markdown = true,
            which_key = true,
            nvim_tree = true,
            lspconfig = true,
            telescope = true,
            bufferline = true,
            nvim_navic = true,
            nvim_notify = true,
            vim_illuminate = true,
            nvim_scrollview = true,
            nvim_treesitter = true,
            nvim_ts_rainbow = true,
            indent_blankline = true,
            vim_visual_multi = true,
        },
        hooks = {
            ---@diagnostic disable-next-line: unused-local
            before = function(utils, colors) end,
            after = function(utils, colors)
                if not options.float_border then
                    utils.hl.bulk_set_highlight({
                        Pmenu = { bg = colors.black1 },
                        NormalFloat = { fg = colors.white, bg = colors.black1 },
                        DiagnosticFloatingError = { fg = colors.red, bg = colors.black1 },
                        DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.black1 },
                        DiagnosticFloatingInfo = { fg = colors.blue, bg = colors.black1 },
                        DiagnosticFloatingHint = { fg = colors.blue, bg = colors.black1 },
                    })
                end
            end,
        },
    })
end

function M.after() end

return M
