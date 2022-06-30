local hl = {}

-- bulk set highlight group
-- it only overwrites the highlighted group, it can't be updated
function hl.bulk_set(hls)
    for name, opts in pairs(hls) do
        hl.set(name, opts)
    end
end

-- set highlight group
-- it only overwrites the highlighted group, it can't be updated
function hl.set(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

-- Get the attributes of the highlighted group
function hl.get(name, style)
    local ok, result = pcall(vim.api.nvim_get_hl_by_name, name, true)

    if not ok then
        vim.notify(string.format("Failed to get hilight: %s", name), "INFO", { title = "hilight" })
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
