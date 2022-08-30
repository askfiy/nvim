-- https://github.com/wbthomason/packer.nvim

local api = require("utils.api")
local options = require("core.options")

local aux_packer = {
    disable_kind = {
        -- "basic",
        -- "complete",
        -- "dap",
        -- "editor",
        -- "find",
        -- "lanaguage",
        -- "lsp",
        -- "theme",
        -- "tools",
        -- "views",
    },
}

function aux_packer.entry(plugins)
    Packer_bootstrap = (function()
        local packer_install_path = api.path.join(vim.fn.stdpath("data"), "site/pack/packer/start/packer.nvim")

        ---@diagnostic disable-next-line: missing-parameter
        if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
            local rtp_addition = string.format("%s/site/pack/*/start/*", vim.fn.stdpath("data"))
            if not string.find(vim.o.runtimepath, rtp_addition) then
                vim.o.runtimepath = string.format("%s,%s", rtp_addition, vim.o.runtimepath)
            end

            vim.notify("Download packer ...", "INFO", { title = "Packer" })

            return vim.fn.system({
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                packer_install_path,
            })
        end
    end)()

    local packer = require("packer")

    packer.init({
        git = {
            default_url_format = options.download_source .. "%s",
        },
        display = {
            working_sym = "",
            error_sym = "",
            done_sym = "",
            removed_sym = "ﮁ",
            moved_sym = "",
            header_sym = "—",
        },
    })

    packer.startup({
        function(use)
            for plugin_kind_name, plugin_kind_tbl in pairs(plugins) do
                for _, plugin_opts in ipairs(plugin_kind_tbl) do
                    local plugin_name = plugin_opts[1]

                    local require_name = string.lower(plugin_opts.as or string.match(plugin_name, "/([%w%-_]+).?"))
                    local require_path = api.path.join("config", plugin_kind_name, require_name)

                    local ok, module = pcall(require, require_path)

                    if ok then
                        if module._viml then
                            plugin_opts.setup = string.format(
                                [[
                                require('%s').before()
                                require('%s').load()
                                require('%s').after()
                                ]],
                                require_path,
                                require_path,
                                require_path
                            )
                        else
                            plugin_opts.setup = string.format(
                                [[
                                require('%s').before()
                                ]],
                                require_path
                            )

                            plugin_opts.config = string.format(
                                [[
                                require('utils.api').safe_require(require('%s'))
                                require('%s').load()
                                require('%s').after()
                                ]],
                                require_path,
                                require_path,
                                require_path
                            )
                        end
                    end
                    if not vim.tbl_contains(aux_packer.disable_kind, plugin_kind_name) then
                        use(plugin_opts)
                    end
                end
            end
            if Packer_bootstrap then
                packer.sync()
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({ border = options.float_border and "double" or "none" })
                end,
            },
        },
    })
end

return aux_packer
