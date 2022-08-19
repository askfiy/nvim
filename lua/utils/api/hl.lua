local hl = {}

function hl.bulk_set(hls)
    for name, opts in pairs(hls) do
        hl.set(name, opts)
    end
end

function hl.set(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

function hl.get(name, style)
    local ok, result = pcall(vim.api.nvim_get_hl_by_name, name, true)

    if not ok then
        vim.notify(string.format("Failed to get highlight: %s", name), "INFO", { title = "highlight" })
        return
    end

    for _, key in pairs({ "foreground", "background", "special" }) do
        if result[key] then
            result[key] = string.format("#%06x", result[key])
        end
    end

    if style then
        if style == "fg" then
            return result["foreground"]
        elseif style == "bg" then
            return result["background"]
        else
            return result[style]
        end
    end

    return result
end

return hl
