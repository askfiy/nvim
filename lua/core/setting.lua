local M = {}

M.g = {
    mapleader = " ",
}

M.opt = {
    ruler = false,
    showmode = false,
    swapfile = false,
    cmdheight = 1,
    signcolumn = "yes:1",
    completeopt = "menuone,noselect",
    pumheight = 10,
    updatetime = 500,
    timeoutlen = 500,
    termguicolors = true,
    cursorline = true,
    numberwidth = 2,
    number = true,
    relativenumber = true,
    splitright = true,
    scrolloff = 21,
    smoothscroll = true,
    mouse = "a",
    list = true,
    spell = true,
    spelllang = "en_us,cjk",
    ignorecase = true,
    smartcase = true,
    filetype = "plugin",
    foldmethod = "indent",
    foldlevel = 100,
    foldlevelstart = 99,
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

vim.opt.diffopt:append("vertical")
vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

for prefix, tbl in pairs(M) do
    for key, value in pairs(tbl) do
        vim[prefix][key] = value
    end
end

return M
