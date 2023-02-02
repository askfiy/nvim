-- https://github.com/kevinhwang91/nvim-ufo

local api = require("utils.api")

local M = {
    requires = {
        "ufo",
    },
    filetype_fold_config = {
        markdown = { "treesitter", "indent" },
    },
}

function M.before() end

function M.load()
    M.ufo.setup({
        open_fold_hl_timeout = 0,
        close_fold_kinds = {},
        ---@diagnostic disable-next-line: unused-local
        provider_selector = function(bufnr, filetype, buftype)
            return M.filetype_fold_config[filetype] or { "lsp", "indent" }
        end,
        fold_virt_text_handler = M.fold_virtual_text_handler,
    })
end

function M.fold_virtual_text_handler(virtual_text, lnum, end_lnum, width, truncate)
    local new_virtual_text = {}
    local suffix = ("   %d"):format(end_lnum - lnum)
    local suffix_width = vim.fn.strdisplaywidth(suffix)
    local target_width = width - suffix_width
    local current_width = 0
    for _, chunk in ipairs(virtual_text) do
        local chunk_text = chunk[1]
        local chunk_width = vim.fn.strdisplaywidth(chunk_text)
        if target_width > current_width + chunk_width then
            table.insert(new_virtual_text, chunk)
        else
            chunk_text = truncate(chunk_text, target_width - current_width)
            local hlGroup = chunk[2]
            table.insert(new_virtual_text, { chunk_text, hlGroup })
            chunk_width = vim.fn.strdisplaywidth(chunk_text)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if current_width + chunk_width < target_width then
                suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
            end
            break
        end
        current_width = current_width + chunk_width
    end
    table.insert(new_virtual_text, { suffix, "MoreMsg" })
    return new_virtual_text
end

function M.after()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "zR",
            rhs = function()
                require("ufo").openAllFolds()
            end,
            options = { silent = true },
            descriptions = "Open all folds",
        },
        {
            mode = { "n" },
            lhs = "zM",
            rhs = function()
                require("ufo").closeAllFolds()
            end,
            options = { silent = true },
            descriptions = "Close all folds",
        },
        {
            mode = { "n" },
            lhs = "zr",
            rhs = function()
                require("ufo").openFoldsExceptKinds()
            end,
            options = { silent = true },
            descriptions = "Fold less",
        },
        {
            mode = { "n" },
            lhs = "zm",
            rhs = function()
                require("ufo").closeFoldsWith()
            end,
            options = { silent = true },
            descriptions = "Fold more",
        },
    })
end

return M
