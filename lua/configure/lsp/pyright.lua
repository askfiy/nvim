-- https://github.com/microsoft/pyright

local function filter(arr, func)
	local new_index = 1
	local size_orig = #arr
	for old_index, v in ipairs(arr) do
		if func(v, old_index) then
			arr[new_index] = v
			new_index = new_index + 1
		end
	end
	for i = new_index, size_orig do
		arr[i] = nil
	end
end

local function filter_diagnostics(diagnostic)
	if diagnostic.message == '"kwargs" is not accessed' then
		return false
	end

	if diagnostic.message == '"args" is not accessed' then
		return false
	end

	return true
end

local function custom_on_publish_diagnostics(a, params, client_id, c, config)
	filter(params.diagnostics, filter_diagnostics)
	---@diagnostic disable-next-line: redundant-parameter
	vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

return {
	hooks = {
		---@diagnostic disable-next-line: unused-local
		attach = function(client, bufnr) end,
	},
	options = {

		root_dir = function()
			return vim.fn.getcwd()
		end,

		handlers = {
			["textDocument/publishDiagnostics"] = function(...) end,

			-- If you want to disable pyright from diagnosing unused parameters, turn on the function below
			-- ["textDocument/publishDiagnostics"] = vim.lsp.with(custom_on_publish_diagnostics, {}),
		},
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic", -- off, basic, strict
					useLibraryCodeForTypes = true,
					autoImportCompletions = true,
					diagnosticSeverityOverrides = {
						reportUndefinedVariable = "error",
						reportMissingTypeStubs = "none",
						reportIncompleteStub = "none",
						reportInvalidStubStatement = "none",
					},
				},
			},
		},
	},
}
