local hi = require("utils.api.hi")
local options = require("core.options")
local colors = require("catppuccin.api.colors").get_colors()

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
	local bufferline_bg_focused = colors.black2
	local bufferline_bg_unfocused = colors.black1
	local bufferline_fg_focused = colors.white
	local bufferline_fg_unfocused = colors.black4
	local bufferline_full_bg = colors.black0
	local bufferline_close_fg = colors.red

	local highlights = {
		-- telescope
		["TelescopeMatching"] = { fg = colors.blue, gui = "bold" },

		-- fidget
		["FidgetTitle"] = { fg = colors.blue, gui = "bold" },
		["FidgetTask"] = { fg = colors.blue },

		-- indent-blankline
		["IndentBlanklineContextChar"] = { fg = colors.blue },
		["IndentBlanklineChar"] = { fg = colors.black4 },

		-- toggleterm
		["ToggleTerm120FloatBorder"] = { fg = colors.blue },
		["ToggleTerm130FloatBorder "] = { fg = colors.blue },

		-- cmp
		["PmenuSel"] = { fg = colors.black0, bg = colors.green, gui = "NONE" },
		["CmpItemAbbrMatch"] = { fg = colors.blue, bg = "NONE" },
		["CmpItemAbbrMatchFuzzy"] = { fg = colors.blue, bg = "NONE" },

		-- diaagnostic
		["DiagnosticError"] = { bg = "NONE" },
		["DiagnosticWarn"] = { bg = "NONE" },
		["DiagnosticInfo"] = { bg = "NONE" },
		["DiagnosticHint"] = { bg = "NONE" },

		-- visual-multi
		["VM_Extend_hi"] = { fg = colors.black2, bg = colors.mauve },
		["VM_Cursor_hi"] = { fg = colors.black2, bg = colors.mauve },
		["VM_Mono_hi"] = { fg = colors.black2, bg = colors.blue },
		["VM_insert_hi"] = { fg = colors.black2, bg = colors.red },

		-- rainbowcol
		["rainbowcol1"] = { bg = "NONE" },
		["rainbowcol2"] = { bg = "NONE" },
		["rainbowcol3"] = { bg = "NONE" },
		["rainbowcol4"] = { bg = "NONE" },
		["rainbowcol5"] = { bg = "NONE" },
		["rainbowcol6"] = { bg = "NONE" },
		["rainbowcol7"] = { bg = "NONE" },

		-- bufferline
		-- offset
		["Directory"] = { gui = "bold" },

		-- blank space background
		["BufferLineFill"] = { bg = bufferline_full_bg },

		-- bufferline split symbol (line) on the left side of the current window
		["BufferLineIndicatorSelected"] = { fg = colors.peach, bg = bufferline_bg_focused },
		["BufferLineIndicator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
		["BufferLineIndicatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

		-- bufferline is not the split symbol on the left side of the current window (can also be seen in the current window, but it is very subtle)
		["BufferLineSeparatorSelected"] = { fg = colors.peach, bg = bufferline_bg_focused },
		["BufferLineSeparator"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },
		["BufferLineSeparatorVisible"] = { fg = bufferline_bg_focused, bg = bufferline_bg_unfocused },

		-- bufferline close button
		["BufferLineCloseButtonSelected"] = { fg = bufferline_close_fg, bg = bufferline_bg_focused },
		["BufferLineCloseButton"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
		["BufferLineCloseButtonVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

		-- bufferline small dots when unsaved
		["BufferLineModifiedSelected"] = { fg = colors.green, bg = bufferline_bg_focused },
		["BufferLineModified"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },
		["BufferLineModifiedVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused },

		-- bufferline serial number
		["BufferLineNumbersSelected"] = { fg = bufferline_fg_focused, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineNumbers"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineNumbersVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

		-- bufferline jump
		["BufferLinePickSelected"] = { fg = bufferline_close_fg, bg = bufferline_bg_focused, gui = "bold" },
		["BufferLinePick"] = { fg = bufferline_close_fg, bg = bufferline_bg_unfocused, gui = "bold" },
		["BufferLinePickVisible"] = { fg = bufferline_close_fg, bg = bufferline_bg_unfocused, gui = "bold" },

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
		["BufferLineBackground"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" }, -- 未选中
		["BufferLineBufferVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

		-- bufferline diagnostic information (text)
		["BufferLineHintSelected"] = { fg = colors.rosewater, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineHint"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineHintVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

		["BufferLineInfoSelected"] = { fg = colors.sky, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineInfo"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineInfoVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_focused, gui = "NONE" },

		["BufferLineWarningSelected"] = { fg = colors.yellow, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineWarning"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineWarningVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

		["BufferLineErrorSelected"] = { fg = colors.red, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineError"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineErrorVisible"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },

		-- bufferline diagnostic information (icon)
		["BufferLineHintDiagnosticSelected"] = { fg = colors.rosewater, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineHintDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineHintDiagnosticVisible"] = {
			fg = bufferline_fg_unfocused,
			bg = bufferline_bg_unfocused,
			gui = "NONE",
		},

		["BufferLineInfoDiagnosticSelected"] = { fg = colors.sky, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineInfoDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineInfoDiagnosticVisible"] = {
			fg = bufferline_fg_unfocused,
			bg = bufferline_bg_focused,
			gui = "NONE",
		},

		["BufferLineWarningDiagnosticSelected"] = { fg = colors.yellow, bg = bufferline_bg_focused, gui = "NONE" },
		["BufferLineWarningDiagnostic"] = { fg = bufferline_fg_unfocused, bg = bufferline_bg_unfocused, gui = "NONE" },
		["BufferLineWarningDiagnosticVisible"] = {
			fg = bufferline_fg_unfocused,
			bg = bufferline_bg_unfocused,
			gui = "NONE",
		},

		["BufferLineErrorDiagnosticSelected"] = { fg = colors.red, bg = bufferline_bg_focused, gui = "NONE" },
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
		-- lsp hover and diaagnostic float window
		["NormalFloat "] = { bg = "NONE" },
		-- hop no background
		["HopNextKey"] = { bg = "NONE" },
		["HopNextKey1"] = { bg = "NONE" },
		["HopNextKey2"] = { bg = "NONE" },
		["HopUnmatched"] = { bg = "NONE" },
	}
	M.apply_highlights(highlights)
end

function M.no_transparent_highlights()
	local highlights = {
		-- lsp hover and diaagnostic float window
		["NormalFloat "] = { bg = colors.black2 },
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
	return M
end

return M
