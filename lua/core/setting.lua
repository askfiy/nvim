-- There are some settings, which are automatically configured in neovim
-- you can view it with :h vim-differences

local settings = {
	w = {
		foldcolumn = 0,
	},
	o = {
		syntax = "enable",
		background = "dark",
		encoding = "utf-8",
		signcolumn = "yes:1",
		filetype = "plugin",
		updatetime = 100,
		timeoutlen = 500,
		showcmd = true,
		hidden = true,
		termguicolors = true,
		cursorline = true,
		number = true,
		relativenumber = true,
		scrolloff = 21,
		mouse = "a",
		list = true,
		incsearch = true,
		hlsearch = true,
		wrapscan = true,
		showmatch = true,
		spell = true,
		spelllang = "en_us,cjk",
		matchtime = 2,
		wildmenu = true,
		ignorecase = true,
		smartcase = true,
		foldenable = true,
		foldmethod = "indent",
		foldlevel = 100,
		linebreak = true,
		clipboard = "unnamedplus",
		autoread = true,
		autoindent = true,
		cmdheight = 1,
		iskeyword = "@,48-57,_,192-255",
		laststatus = 3,
		fillchars = "vert:┃,horiz:━,verthoriz:╋,horizup:┻,horizdown:┳,vertleft:┫,vertright:┣",
	},
}

vim.opt_local.formatoptions = vim.opt_local.formatoptions - { "c", "r", "o" }

for prefix, tab in pairs(settings) do
	for key, value in pairs(tab) do
		vim[prefix][key] = value
	end
end

return settings
