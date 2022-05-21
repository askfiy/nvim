local path = require("utils.api.path")

-- When the file is opened in a different environment, the code snippet of the file is automatically loaded

-- You can also use add or remove and extend to add or remove fragments
-- see :h list

local function load_html_snippets()
    local root_dir = vim.fn.getcwd()
    ---@diagnostic disable-next-line: missing-parameter
    local dir_name = vim.fn.expand("%:p:h:t")
    -- load django template snippets
    if dir_name == "templates" and path.is_exists(path.join(root_dir, "manage.py")) then
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
    if vim.fn.filereadable(path.join(root_dir, "manage.py")) then
        vim.cmd("let g:vsnip_filetypes.python = ['django']")
    else
        vim.cmd("let g:vsnip_filetypes.python = []")
    end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.html" },
    callback = load_html_snippets,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.ejs" },
    callback = load_ejs_snippets,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.py" },
    callback = load_python_snippets,
})
