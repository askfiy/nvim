local hi = {}

function hi.set(name, opts)

    -- Set neovim highlight
    -- Example:
    --     hi.set("Comment", {fg = "Green", bg = "Black", bold = true})
    --     => nil
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

function hi.get(name, style)
    -- Get neovim highlight
    -- Example:
    --     hi.get("Comment", "fg")
    --     => "#Green"
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

function hi.link(definition_hi, link_hi)
    -- Link neovim highlight
    -- Example:
    --     hi.link("Comment", "Link")
    --     => nil
    vim.cmd("highlight link " .. definition_hi .. " " .. link_hi)
end

function hi.transparent()
    -- Clear the highlighted group defined below
    -- Defined for themes without background highlighting
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
