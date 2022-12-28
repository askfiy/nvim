local setting = {}

setting.g = {
    mapleader = " ",
}

setting.opt = {
    ruler = false,
    showmode = false,
    swapfile = false,
    signcolumn = "yes:1",
    --[[ signcolumn = "number", ]]
    completeopt = "menuone,noselect",
    pumheight = 10,
    updatetime = 500,
    timeoutlen = 500,
    termguicolors = true,
    cursorline = true,
    numberwidth = 2,
    number = true,
    relativenumber = true,
    scrolloff = 21,
    mouse = "a",
    list = true,
    spell = true,
    spelllang = "en_us,cjk",
    ignorecase = true,
    smartcase = true,
    filetype = "plugin",
    foldmethod = "indent",
    foldlevel = 100,
    foldcolumn = "0",
    clipboard = "unnamedplus",
    smartindent = true,
    iskeyword = "@,48-57,_,192-255",
    laststatus = 3,
    linebreak = true,
    fillchars = "eob: ",
    fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
    sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
}

-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:↹ ")

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

for prefix, tbl in pairs(setting) do
    for key, value in pairs(tbl) do
        vim[prefix][key] = value
    end
end

local disable_builtin_plugins = {
    -- "netrw",
    -- "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, builtin_plugin in ipairs(disable_builtin_plugins) do
    vim.g["loaded_" .. builtin_plugin] = 1
end

return setting
