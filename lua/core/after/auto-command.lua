local options = require("core.options")

local function auto_save()
	vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
		pattern = { "*" },
		command = "silent! write",
		nested = true,
	})
end

local function hiden_cursor()
	vim.api.nvim_create_autocmd("BufEnter", {
		pattern = { "*" },
		callback = (function()
			local cursor_hidden_ft = {
				"NvimTree",
				"aerial",
			}
			return function()
				if vim.tbl_contains(cursor_hidden_ft, vim.bo.filetype) then
					vim.o.guicursor = "n-v:hor1-Cursorline,"
				else
					vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
				end
			end
		end)(),
	})

	vim.api.nvim_create_autocmd("ExitPre", {
		pattern = { "*" },
		callback = function()
			vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
		end,
	})
end

local function switch_input()
	if vim.bo.fileformat == "unix" then
		vim.api.nvim_create_autocmd({ "InsertLeave" }, {
			pattern = { "*" },
			callback = function()
				local input_status = tonumber(vim.fn.system("fcitx5-remote"))
				if input_status == 2 then
					vim.fn.system("fcitx5-remote -c")
				end
			end,
		})
	else
	end
end

if options.hidden_cursor_on_view then
	hiden_cursor()
end

if options.auto_save_buffer then
	auto_save()
end

if options.auto_switch_input then
	switch_input()
end
