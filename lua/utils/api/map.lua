local map = {}

-- wrapper function for vim.keymap.set
function map.register(key_map)
    key_map.options.desc = key_map.description
    vim.keymap.set(key_map.mode, key_map.lhs, key_map.rhs, key_map.options)
end

-- wrapper function for vim.keymap.del
function map.unregister(mode, lhs, opts)
    vim.keymap.del(mode, lhs, opts)
end

-- bulk registration shortcuts
function map.bulk_register(group_keymap)
    for _, key_map in pairs(group_keymap) do
        map.register(key_map)
    end
end

return map
