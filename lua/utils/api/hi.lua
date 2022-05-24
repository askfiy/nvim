local hi = {}

--[[
Set neovim highlight
Example:
     hi.set("Comment", {fg = "Green", bg = "Black", bold = true})
     => nil
]]
function hi.set(name, opts)
    local command = "highlight! " .. name
    for k, v in pairs(opts) do
        if k ~= "gui" then
            command = command .. " gui" .. k .. "=" .. v
        else
            command = command .. " " .. k .. "=" .. v
        end
    end
    vim.cmd(command)
end

--[[
Get neovim highlight
Example:
    hi.get("Comment", "fg")
    => "#Green"
]]
function hi.get(name, style)
    local opts = {}
    local output = vim.fn.execute("highlight " .. name)
    local lines = vim.fn.trim(output)
    for k, v in lines:gmatch("(%a+)=(#?%w+)") do
        opts[k] = v
    end
    if style ~= "gui" then
        return opts["gui" .. style]
    end
    return opts[style]
end

--[[
Link neovim highlight
Example:
   hi.link("Comment", "Link")
   => nil
]]
function hi.link(definition_hi, link_hi)
    vim.cmd("highlight link " .. definition_hi .. " " .. link_hi)
end

--[[
Clear preset highlights
Defined for themes without background highlighting
]]
function hi.transparent()
    local clear_hi = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        -- nvim-tree
        "NvimTreeNormal",
        "NvimTreeVertSplit",
    }

    for _, group in ipairs(clear_hi) do
        vim.cmd(string.format("hi %s ctermbg=NONE guibg=NONE", group))
    end
end

return hi
