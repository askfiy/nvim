-- https://github.com/microsoft/pylance-release

local util = require("lspconfig.util")

local get_script_path = function()
    local scripts =
        vim.fn.expand("$HOME/.vscode/extensions/ms-python.vscode-pylance-*/dist/server.bundle.js", false, true)

    -- After an upgrade the old plugin might linger for a while.
    table.sort(scripts, function(a, b)
        return a > b
    end)

    if scripts[1] == nil then
        error("Failed to resolve path to Pylance server")
    end

    return scripts[1]
end

local cmd = { "node", get_script_path(), "--stdio" }

return {
    default_config = {
        name = "pylance",
        autostart = true,
        single_file_support = true,
        cmd = cmd,
        filetypes = { "python" },
        root_dir = function(fname)
            local markers = {
                "Pipfile",
                "pyproject.toml",
                "pyrightconfig.json",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
            }
            return util.root_pattern(unpack(markers))(fname)
                or util.find_git_ancestor(fname)
                or util.path.dirname(fname)
        end,
        settings = {
            python = {
                analysis = vim.empty_dict(),
            },
            telemetry = {
                telemetryLevel = "off",
            },
        },
        docs = {
            package_json = vim.fn.expand(
                "$HOME/.vscode/extensions/ms-python.vscode-pylance-*/package.json",
                false,
                true
            )[1],
            description = [[
      https://github.com/microsoft/pyright
      `pyright`, a static type checker and language server for python
      ]],
        },
    },
}
