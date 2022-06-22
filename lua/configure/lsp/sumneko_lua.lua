-- https://github.com/sumneko/lua-language-server
-- https://github.com/folke/lua-dev.nvim

-- https://github.com/sumneko/vscode-lua/blob/master/setting/schema.json
-- https://github.com/xiyaowong/coc-sumneko-lua/blob/main/settings.md

local util = require("lspconfig.util")

local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lua_dev = require("lua-dev")

local root_files = {
    ".luarc.json",
    ".luacheckrc",
    ".stylua.toml",
    "selene.toml",
}

return vim.tbl_deep_extend("keep", lua_dev.setup(), {
    -- cmd = { "lua-language-server", "--locale=zh-CN" },
    filetypes = { "lua" },
    single_file_support = true,
    cmd = { "lua-language-server" },
    root_dir = function(fname)
        ---@diagnostic disable-next-line: deprecated
        return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname)
    end,
    log_level = 2,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            hover = {
                previewFields = vim.o.lines,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
