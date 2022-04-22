local api = require("utils.api")

local function load_html_snippets()
    local root_dir = vim.fn.getcwd()
    local dir_name = vim.fn.expand("%:p:h:t")
    -- load django template snippets
    if dir_name == "templates" and vim.fn.filereadable(api.path.join(root_dir, "manage.py")) == 1 then
        vim.cmd("let g:vsnip_filetypes.html = ['djangohtml']")
    else
        vim.cmd("let g:vsnip_filetypes.html = []")
    end
end

local function load_ejs_snippets()
    vim.bo.filetype = "html"
    vim.cmd([[
        let g:vsnip_filetypes.html = ['ejs']
    ]])
end

local function load_python_snippets()
    local root_dir = vim.fn.getcwd()
    -- load django snippets
    if vim.fn.filereadable(api.path.join(root_dir, "manage.py")) == 1 then
        vim.cmd("let g:vsnip_filetypes.python = ['django']")
    else
        vim.cmd("let g:vsnip_filetypes.python = []")
    end
end

local load_snippets = vim.api.nvim_create_augroup("load_snippets", {clear = true})

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.html"},
        group = load_snippets,
        callback = load_html_snippets
    }
)

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.ejs"},
        group = load_snippets,
        callback = load_ejs_snippets
    }
)

vim.api.nvim_create_autocmd(
    {"BufEnter"},
    {
        pattern = {"*.py"},
        group = load_snippets,
        callback = load_python_snippets
    }
)
