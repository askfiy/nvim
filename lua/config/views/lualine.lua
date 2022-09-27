-- https://github.com/nvim-lualine/lualine.nvim

local M = {
    requires = {
        "lualine",
        "swenv.api",
    },
}

local function get_venv()
    local res = M.swenv_api.get_current_venv()
    return string.format("virtualenv: %s", res and res.name or "none")
end

function M.before() end

function M.load()
    M.lualine.setup({
        options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                { "mode" },
            },
            lualine_b = {
                "branch",
                "diff",
                "diagnostics",
            },
            lualine_c = {
                "filename",
            },
            lualine_x = {
                "encoding",
                "fileformat",
                "filetype",
                {
                    get_venv,
                    cond = function()
                        return vim.bo.filetype == "python"
                    end,
                },
            },
            lualine_y = {
                "progress",
            },
            lualine_z = { "location" },
        },
    })
end

function M.after() end

return M
