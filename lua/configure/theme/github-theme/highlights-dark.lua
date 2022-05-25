local hi = require("utils.api.hi")
local options = require("core.options")
local colors = require("github-theme.palette.dark")()

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
    local border_colors = colors.red

    local rainbow_level_1 = "#FFD700"
    local rainbow_level_2 = "#DA70BF"
    local rainbow_level_3 = "#87CEFA"

    local bufferline_full_bg = "#1F252A"

    local bufferline_bg_focused = colors.bg
    local bufferline_bg_unfocused = colors.bg_visual
    local bufferline_fg_focused = colors.fg
    local bufferline_fg_unfocused = colors.fg

    local bufferline_close_fg = colors.fg
    local bufferline_indicator_fg = colors.bg
    local bufferline_separator_fg = colors.bg
    local bufferline_modfiy_fg = colors.fg
    local bufferline_pick_fg = colors.red

    local bufferline_hint_fg = colors.hint
    local bufferline_info_fg = colors.info
    local bufferline_warn_fg = colors.warning
    local bufferline_error_fg = colors.error

    local highlights = {
        -- split
        ["VertSplit"] = { bg = "NONE" },

        -- NvimTree
        ["NvimTreeWinSeparator"] = { fg = colors.bg, bg = colors.bg },

        -- search
        ["Search"] = { bg = colors.line_nr },

        -- wildmenu
        ["WildMenu"] = { bg = colors.line_nr },

        -- float border
        ["FloatBorder"] = { fg = border_colors },

        -- scrollview
        ["ScrollView"] = { bg = colors.bg_visual_selection },

        -- fidget
        ["FidgetTitle"] = { fg = colors.bright_blue, gui = "bold" },
        ["FidgetTask"] = { fg = colors.bright_blue },

        -- hop
        ["HopNextKey"] = { fg = rainbow_level_1, bg = "NONE", gui = "bold" },
        ["HopNextKey1"] = { fg = rainbow_level_3, bg = "NONE", gui = "bold" },
        ["HopNextKey2"] = { fg = rainbow_level_2, bg = "NONE", gui = "bold,italic" },

        -- cmp
        ["PmenuSel"] = { fg = colors.bg, bg = colors.magenta, gui = "NONE" },
        ["PmenuThumb"] = { bg = colors.bg_visual_selection },
        ["CmpItemAbbrMatch"] = { fg = colors.blue, bg = "NONE", gui = "bold" },
        ["CmpItemAbbrMatchFuzzy"] = { fg = colors.blue, bg = "NONE", gui = "bold" },

        -- telescope
        ["TelescopeBorder"] = { fg = border_colors },
        ["TelescopePreviewBorder"] = { fg = border_colors },
        ["TelescopePromptBorder"] = { fg = border_colors },
        ["TelescopeResultsBorder"] = { fg = border_colors },

        -- visual-multi
        ["VM_Extend_hi"] = { fg = colors.fg, bg = colors.blue },
        ["VM_Cursor_hi"] = { fg = colors.fg, bg = colors.blue },
        ["VM_Mono_hi"] = { fg = colors.fg, bg = colors.orange },
        ["VM_insert_hi"] = { fg = colors.fg, bg = colors.red },

        -- rainbowcol
        ["rainbowcol1"] = { fg = rainbow_level_1, bg = "NONE" },
        ["rainbowcol2"] = { fg = rainbow_level_2, bg = "NONE" },
        ["rainbowcol3"] = { fg = rainbow_level_3, bg = "NONE" },
        ["rainbowcol4"] = { fg = rainbow_level_1, bg = "NONE" },
        ["rainbowcol5"] = { fg = rainbow_level_2, bg = "NONE" },
        ["rainbowcol6"] = { fg = rainbow_level_3, bg = "NONE" },
        ["rainbowcol7"] = { fg = rainbow_level_1, bg = "NONE" },

        -- bufferline
        -- offset
        ["Directory"] = { bg = colors.bg2, gui = "bold" },

        -- blank space background
        ["BufferLineFill"] = { fg = "NONE", bg = bufferline_full_bg, gui = "NONE" },

        -- bufferline split symbol (line) on the left side of the current window
        ["BufferLineIndicatorSelected"] = { fg = bufferline_indicator_fg, bg = bufferline_bg_focused },
        ["BufferLineIndicator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineIndicatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

        -- bufferline is not the split symbol on the left side of the current window (can also be seen in the current window, but it is very subtle)
        ["BufferLineSeparatorSelected"] = { fg = bufferline_separator_fg, bg = bufferline_bg_focused },
        ["BufferLineSeparator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
        ["BufferLineSeparatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

        -- bufferline close button
        ["BufferLineCloseButtonSelected"] = { fg = bufferline_close_fg, bg = bufferline_bg_focused },
        ["BufferLineCloseButton"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
        ["BufferLineCloseButtonVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

        -- bufferline small dots when unsaved
        ["BufferLineModifiedSelected"] = { fg = bufferline_modfiy_fg, bg = bufferline_bg_focused },
        ["BufferLineModified"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
        ["BufferLineModifiedVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

        -- bufferline serial number
        ["BufferLineNumbersSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineNumbers"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineNumbersVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline jump
        ["BufferLinePickSelected"] = { fg = bufferline_pick_fg, bg = bufferline_bg_focused, gui = "bold" },
        ["BufferLinePick"] = { fg = bufferline_pick_fg, bg = bufferline_bg_unfocused, gui = "bold" },
        ["BufferLinePickVisible"] = { fg = bufferline_pick_fg, bg = bufferline_bg_unfocused, gui = "bold" },

        -- bufferline tab
        ["BufferLineTabSelected"] = { fg = bufferline_bg_unfocused, bg = bufferline_bg_unfocused }, -- currently selected
        ["BufferLineTab"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused }, -- Unselected
        ["BufferLineTabClose"] = { fg = bufferline_close_fg, bg = bufferline_full_bg }, -- Right close button

        -- bufferline file with the same name
        ["BufferlineDuplicateSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "italic" },
        ["BufferlineDuplicate"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "italic" },
        ["BufferlineDuplicateVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "italic",
        },

        -- bufferline currently open buffer (when no diagnostics)
        ["BufferLineBufferSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineBackground"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" }, -- unchecked
        ["BufferLineBufferVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline diagnostic information (text)
        ["BufferLineHintSelected"] = { fg = bufferline_hint_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineHint"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineHintVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        ["BufferLineInfoSelected"] = { fg = bufferline_info_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineInfo"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineInfoVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_focused, gui = "NONE" },

        ["BufferLineWarningSelected"] = { fg = bufferline_warn_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineWarning"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineWarningVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        ["BufferLineErrorSelected"] = { fg = bufferline_error_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineError"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineErrorVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

        -- bufferline diagnostic information (icon)
        ["BufferLineHintDiagnosticSelected"] = { fg = bufferline_hint_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineHintDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineHintDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },

        ["BufferLineInfoDiagnosticSelected"] = { fg = bufferline_info_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineInfoDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineInfoDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_focused,
            gui = "NONE",
        },

        ["BufferLineWarningDiagnosticSelected"] = {
            fg = bufferline_warn_fg,
            bg = bufferline_bg_focused,
            gui = "NONE",
        },
        ["BufferLineWarningDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineWarningDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },

        ["BufferLineErrorDiagnosticSelected"] = { fg = bufferline_error_fg, bg = bufferline_bg_focused, gui = "NONE" },
        ["BufferLineErrorDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
        ["BufferLineErrorDiagnosticVisible"] = {
            fg = bufferline_fg_unfocused,
            bg = bufferline_bg_unfocused,
            gui = "NONE",
        },
    }

    M.apply_highlights(highlights)
end

function M.is_transparent_highlights()
    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = "NONE" },

        -- NvimTree split
        ["Directory"] = { bg = "NONE", gui = "bold" },

        -- bufferline offset
        ["NvimTreeVertSplit"] = { fg = "NONE", bg = "NONE" },
    }
    M.apply_highlights(highlights)
end

function M.no_transparent_highlights()
    local highlights = {
        -- lsp hover and diagnostic float window
        ["NormalFloat "] = { bg = colors.bg },
    }
    M.apply_highlights(highlights)
end

function M.execute()
    M.global_highlights()
    if M.transparent_background then
        M.is_transparent_highlights()
    else
        M.no_transparent_highlights()
    end
    -- The theme does not have built-in transparency, you need to define it yourself
    if options.transparent_background then
        hi.transparent()
    end
end

return M
