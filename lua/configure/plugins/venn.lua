-- https://github.com/jbyuki/venn.nvim

local mapping = require("core.mapping")
local venn = require("venn")

local notify = nil

local function open_venn_notify()
    -- clear all history notify windows
    vim.notify.dismiss()
    notify =
        vim.notify(
        "Venn enabled",
        "info",
        {
            title = "Venn",
            keep = function()
                return vim.b.venn_enabled
            end,
            render = "minimal"
        }
    )
end

local function close_venn_notify()
    vim.notify(
        "Venn disable",
        "info",
        {
            title = "Venn",
            render = "minimal",
            replace = notify
        }
    )
end

function venn.toggle_venn_mode()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd [[setlocal ve=all]]
        mapping.register("buffer", "venn", 0)
        open_venn_notify()
    else
        vim.cmd [[setlocal ve=]]
        vim.cmd [[mapclear <buffer>]]
        vim.b.venn_enabled = nil
        close_venn_notify()
        local bufnr = vim.fn.bufnr("%")
        for group_name, _ in pairs(mapping.buffer) do
            if group_name ~= "venn" then
                mapping.register("buffer", group_name, bufnr)
            end
        end
    end
end
