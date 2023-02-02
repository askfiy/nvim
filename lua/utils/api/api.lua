local M = {}

function M.require_all_package(module)
    if not module.requires then
        return
    end

    local replace_char = {
        ["%."] = "_",
        ["%-"] = "_",
    }

    for _, require_name in ipairs(module.requires) do
        local use_name = require_name

        for char, replace in pairs(replace_char) do
            if use_name:match(char) then
                use_name = (use_name:gsub(char, replace)):lower()
            end
        end

        module[use_name:lower()] = require(require_name)
    end
end

return M
