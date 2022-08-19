local api = {}

function api.safe_require(M)
    if not M.requires then
        return
    end

    local replace_char = {
        ["%."] = "_",
        ["%-"] = "_",
    }

    for _, use_name in ipairs(M.requires) do
        local require_name = use_name

        for char, replace in pairs(replace_char) do
            if use_name:match(char) then
                use_name = string.lower(use_name:gsub(char, replace))
            end
        end

        M[string.lower(use_name)] = require(require_name)
    end
end

return api
