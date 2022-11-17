local map = {}

function map.register(key_map)
    key_map.options.desc = key_map.description

    if not key_map.options.force then
        vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
    else
        key_map.options.force = nil
        if type(key_map.mode) == "string" then
            vim.api.nvim_set_keymap(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
        else
            for _, mode in ipairs(key_map.mode) do
                vim.api.nvim_set_keymap(mode, key_map.lhs, key_map.rhs, key_map.options)
            end
        end
    end
end

function map.unregister(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

function map.bulk_register(group_keymap)
    for _, key_map in pairs(group_keymap) do
        map.register(key_map)
    end
end

return map
