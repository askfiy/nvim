local M = {}

function M.read(file_name)
    local fp = assert(io.open(file_name, "r"))
    local content = fp:read("*all")
    fp:close()
    return content
end

function M.read_lines(file_name)
    local fp = assert(io.open(file_name, "r"))
    local content = fp:read("*line")
    fp:close()
    return content
end

function M.write(file_name, content)
    local fp = assert(io.open(file_name, "w"))
    fp:write(content)
    fp:close()
end

function M.append_write(file_name, content)
    local fp = assert(io.open(file_name, "a"))
    fp:write(content)
    fp:close()
end

return M
