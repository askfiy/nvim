local path = {}

path.join = function(...)
	-- Join paths together.
	-- Example:
	--   utils.path.join("/foo", "bar")
	--   => "/foo/bar"
	local str = ""
	for _, p in ipairs({ ... }) do
		str = str .. p .. "/"
	end
	return str:sub(1, #str - 1)
end

path.is_exists = function(p)
	-- Check if a path exists.
	-- Example:
	--     utils.path.is_exists("/foo/bar")
	--     => true
	return vim.fn.filereadable(p) == 1
end

return path
