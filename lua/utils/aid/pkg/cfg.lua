local M = {
    _aid_conf = nil,
}

function M.get_aid_config()
    if not M._aid_conf then
        local api = require("utils.api")
        local aid_conf_path = api.path.join(vim.fn.stdpath("config"), "lua", "utils", "aid", "conf", "config.json")
        M._aid_conf = vim.json.decode(api.file.read(aid_conf_path))
    end
    return M._aid_conf
end

function M.get_database_conf()
    return M.get_aid_config()["database_config"] or {}
end

function M.get_plugins_filetype_conf()
    return M.get_aid_config()["plugins_disable_filetype"] or {}
end

function M.get_plugins_filetype_conf_by_name(plugin_name)
    local result_tables = {}
    for filetype, plugin_opts in pairs(M.get_plugins_filetype_conf()) do
        if plugin_opts[plugin_name] then
            table.insert(result_tables, filetype)
        end
    end
    return result_tables
end

return M
