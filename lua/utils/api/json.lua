local M = {}

function M.dumps(obj)
    return vim.json.encode(obj)
end

function M.loads(str, opts)
    return vim.json.decode(str, opts or {})
end

function M.dump(file_name, obj)
    local content = M.dumps(obj)
    require("utils.api.file").write(file_name, content)
end

function M.load(file_name, opts)
    local content = require("utils.api.file").read(file_name)
    return M.loads(content, opts)
end

return M
