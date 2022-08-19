-- https://github.com/tailwindlabs/tailwindcss-intellisense

local util = require("lspconfig.util")

local root_files = {
    "tailwind.config.js",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.ts",
}

return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname)
            or util.find_package_json_ancestor(fname)
            or util.find_node_modules_ancestor(fname)
            or util.find_git_ancestor(fname)
            or vim.fn.getcwd()
    end,
}
