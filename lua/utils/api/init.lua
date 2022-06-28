local icons = require("utils.icons")

local api = {
    hl = require("utils.api.hl"),
    map = require("utils.api.map"),
    path = require("utils.api.path"),
}

-- safely load all dependent plugins
function api.safe_load(M)
    if not M.safe_requires then
        return
    end

    for _, plugin_table in ipairs(M.safe_requires) do
        local load_name = plugin_table[1]
        local plug_name = plugin_table[2] or load_name

        local ok, plugin = pcall(require, load_name)
        if not ok then
            vim.notify(string.format("Faild to load plugin: %s", load_name), "WARN", { title = "plugin" })
            return
        end

        M[plug_name] = plugin
    end
end

-- get the icon, if fill is true, return the filled icon (2 characters wide), otherwise return the original icon (1 character width)
function api.get_icons(name, fill)
    if not fill then
        return icons[name]
    end

    local fill_icons = {}
    for icon_name, icon_value in pairs(icons[name]) do
        fill_icons[icon_name] = string.format("%s ", icon_value)
    end

    return fill_icons
end

return api
