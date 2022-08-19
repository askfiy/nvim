-- load different code snippets under different conditions
-- now supports detection:
-- * djangohtml
-- * django

local api = require("utils.api")

local function load_snippet(filetype, snippet)
    local temporary_vsnip_filetypes = vim.g.vsnip_filetypes
    if temporary_vsnip_filetypes[filetype] then
        if not vim.tbl_contains(temporary_vsnip_filetypes[filetype], snippet) then
            table.insert(temporary_vsnip_filetypes[filetype], snippet)
        end
    else
        temporary_vsnip_filetypes[filetype] = { snippet }
    end
    vim.g.vsnip_filetypes = temporary_vsnip_filetypes
end

local function unload_snippet(filetype, snippet)
    local temporary_vsnip_filetypes = vim.g.vsnip_filetypes
    if temporary_vsnip_filetypes[filetype] then
        if vim.tbl_contains(temporary_vsnip_filetypes[filetype], snippet) then
            for i, v in ipairs(temporary_vsnip_filetypes[filetype]) do
                if v == snippet then
                    table.remove(temporary_vsnip_filetypes[filetype], i)
                    break
                end
            end
        end
    end
    vim.g.vsnip_filetypes = temporary_vsnip_filetypes
end

local function load_html_snippets()
    local root_dir = vim.fn.getcwd()
    ---@diagnostic disable-next-line: missing-parameter
    local dir_name = vim.fn.expand("%:p:h:t")
    if dir_name == "templates" and api.path.exists(api.path.join(root_dir, "manage.py")) then
        load_snippet("html", "djangohtml")
    else
        unload_snippet("html", "djangohtml")
    end
end

local function load_python_snippets()
    local root_dir = vim.fn.getcwd()
    if api.path.exists(api.path.join(root_dir, "manage.py")) then
        load_snippet("python", "django")
    else
        unload_snippet("python", "django")
    end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.html" },
    callback = load_html_snippets,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.py" },
    callback = load_python_snippets,
})
