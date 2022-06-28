-- some options are enabled in neovim built-in, and the settings will not be repeated here

local setting = {
    g = {
        mapleader = " ",
        do_filetype_lua = 1,
        did_load_filetypes = 0,
    },
    opt = {
        ruler = false,
        showmode = false,
        swapfile = false,
        writebackup = false,
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
        clipboard = "unnamedplus",
        smartindent = true,
        iskeyword = "@,48-57,_,192-255",
        laststatus = 3,
        linebreak = true,
        sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
        fillchars = "vert:┃,horiz:━,verthoriz:╋,horizup:┻,horizdown:┳,vertleft:┫,vertright:┣,eob: ",
    },
}

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

-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.opt.listchars:append("tab:↹ ")

vim.opt.shortmess:append("sI")
vim.opt.whichwrap:append("<>[]hl")

for prefix, tab in pairs(setting) do
    for key, value in pairs(tab) do
        vim[prefix][key] = value
    end
end

for _, builtin_plugin in ipairs(disable_builtin_plugins) do
    vim.g["loaded_" .. builtin_plugin] = 1
end

return setting
