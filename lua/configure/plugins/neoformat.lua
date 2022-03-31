-- https://github.com/sbdchd/neoformat

-- WARN: neoformat install the formatter manually
-- https://github.com/sbdchd/neoformat#supported-filetypes

-- npm install -g lua-fmt
-- npm install -g prettier
-- npm install -g gofmt
-- pip3 install autopep8
-- pip3 install sqlformat

-- When no formatter is found, it will be automatically formatted as follows

-- 1. auto align
vim.g.neoformat_basic_format_align = 1
-- 2. automatically remove trailing whitespace
vim.g.neoformat_basic_format_trim = 1
-- 3. replace tabs with spaces
vim.g.neoformat_basic_format_retab = 0

-- only show error messages
vim.g.neoformat_only_msg_on_error = 1
