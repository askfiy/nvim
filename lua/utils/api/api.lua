---@diagnostic disable: undefined-field

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

function M.get_importable_subfiles(dir)
    local api_path = require("utils.api.path")
    local require_path = {}
    local files_table = api_path.listdir_by_filetype(api_path.join(vim.fn.stdpath("config"), "lua", dir), "lua")

    ---@diagnostic disable-next-line: param-type-mismatch
    for _, file_path in ipairs(files_table) do
        local file_name = vim.fn.fnamemodify(file_path, ":t:r")
        -- Exclude entry files
        if file_name ~= "init" then
            table.insert(require_path, ("%s/%s"):format(dir, file_name))
        end
    end

    return require_path
end

-- Creating a simple setTimeout wrapper
function M.setTimeout(timeout, callback)
    local timer = vim.loop.new_timer()
    timer:start(timeout, 0, function()
        timer:stop()
        timer:close()
        callback()
    end)
    return timer
end

-- Creating a simple setInterval wrapper
function M.setInterval(interval, callback)
    local timer = vim.loop.new_timer()
    timer:start(interval, interval, function()
        callback()
    end)
    return timer
end

-- And clearInterval
function M.clearInterval(timer)
    timer:stop()
    timer:close()
end

return M
