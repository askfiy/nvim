local hi = require("utils.api.hi")
local options = require("core.options")
local colors = require("vscode.colors").generate()

local M = {
    transparent_background = options.transparent_background,
}

function M.apply_highlights(highlights)
    for name, opts in pairs(highlights) do
        hi.set(name, opts)
    end
end

-- For bufferline:
-- hi          : is the state when it is not selected
-- hi_selected : is the selected state
-- hi_visible  : selects the current Buf, but leaves it temporarily
--             (for example, after opening NvimTree in the current buffer, the cursor will move to NvimTree, then the current buffer is in the visible state)

function M.global_highlights()
    local highlights = {}
    M.apply_highlights(highlights)
end

function M.is_transparent_highlights()
    local highlights = {}
    M.apply_highlights(highlights)
end

function M.no_transparent_highlights()
    local highlights = {}
    M.apply_highlights(highlights)
end

function M.execute()
    M.global_highlights()
    if M.transparent_background then
        M.is_transparent_highlights()
    else
        M.no_transparent_highlights()
    end
end

return M
