M = {}

M.packer = {
    wait = {
        message = function()
            return "Please wait ... \nDownloading packer ..."
        end,
        level = "info",
        options = {
            title = "Packer"
        }
    },
    config_not_found = {
        message = function(name, config_path)
            return "Missing config file for " .. name .. ": " .. config_path
        end,
        level = "error",
        options = {
            title = "Packer"
        }
    }
}

M.language_server = {
    download = {
        message = function(server_name)
            return "Install Language Server : " .. server_name
        end,
        level = "warn",
        options = {
            title = "Language Server"
        }
    }
}

M.venn = {
    enable = {
        message = function()
            return "Venn enabled"
        end,
        level = "info",
        options = {
            title = "Venn",
            keep = function()
                return vim.b.venn_enabled
            end,
            render = "minimal"
        }
    },
    disable = {
        message = function()
            return "Venn disabled"
        end,
        level = "info",
        options = {
            title = "Venn",
            render = "minimal"
        }
    }
}
return M
