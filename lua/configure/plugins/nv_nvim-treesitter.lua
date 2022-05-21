-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- https://github.com/windwp/nvim-ts-autotag

local M = {}

function M.before() end

function M.load()
    local ok, m = pcall(require, "nvim-treesitter.configs")
    if not ok then
        return
    end

    M.nvim_treesitter = m
    M.nvim_treesitter.setup({
        ensure_installed = "all",
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            use_languagetree = true,
        },
        indent = {
            enable = true,
            disable = { "yaml", "python" },
        },
        -- incremental selection
        incremental_selection = {
            enable = false,
            keymaps = {
                init_selection = "<cr>",
                node_incremental = "<cr>",
                node_decremental = "<bs>",
                scope_incremental = "<tab>",
            },
        },
        -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true,
            -- Do not enable for files with more than 1000 lines, int
            max_file_lines = 1000,
        },
        autotag = {
            enable = true,
        },
        -- nvim-ts-context-commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                -- Languages that have a single comment style
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = "",
            },
        },
    })
end

function M.after() end

return M
