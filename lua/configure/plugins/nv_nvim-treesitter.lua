-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
-- https://github.com/windwp/nvim-ts-autotag

local options = require("core.options")

local M = {
    safe_requires = {
        { "nvim-treesitter.configs", "nvim_treesitter" },
    },
}

function M.download_source_settings()
    if options.download_source ~= "https://github.com/" then
        for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
            config.install_info.url = config.install_info.url:gsub("https://github.com/", options.download_source)
        end
    end
end

function M.before() end

function M.load()
    M.nvim_treesitter.setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            disable = { "yaml", "python", "html" },
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
