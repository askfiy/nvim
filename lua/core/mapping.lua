vim.g.mapleader = " "

local mapping = {}

mapping.register = function(range, gruop_name, bufnr)
    local group_keymap = mapping[range][gruop_name]
    for _, key_map in ipairs(group_keymap) do
        -- noremap : default = true
        local options = {
            buffer = bufnr
        }
        if key_map[4] then
            for opt in vim.gsplit(key_map[4], "|", true) do
                options[opt] = true
            end
        end
        vim.keymap.set(key_map[1], key_map[2], key_map[3], options)
    end
end

mapping.global = {
    basic = {
        {{"i"}, "jj", "<esc>", "silent"},
        {{"t"}, "<esc>", "<c-\\><c-n>", "silent"},
        {{"n"}, "\\\\", ":qa!<cr>", "silent"},
        {{"n"}, "<esc>", ":nohlsearch<cr>", "silent"},
        {{"n"}, "<c-u>", "10k", "silent"},
        {{"n"}, "<c-d>", "10j", "silent"},
        {{"n"}, "<m-k>", "<c-w>-", "silent"},
        {{"n"}, "<m-j>", "<c-w>+", "silent"},
        {{"n"}, "<m-h>", "<c-w><", "silent"},
        {{"n"}, "<m-l>", "<c-w>>", "silent"},
        {{"n"}, "<leader>cs", "<cmd>set spell!<cr>", "silent"},
        {{"i", "c", "t"}, "<m-w>", "<c-right>"},
        {{"i", "c", "t"}, "<m-b>", "<c-left>"},
        {{"i", "c", "t"}, "<m-k>", "<up>"},
        {{"i", "c", "t"}, "<m-j>", "<down>"},
        {{"i", "c", "t"}, "<m-h>", "<left>"},
        {{"i", "c", "t"}, "<m-l>", "<right>"},
        {
            {"n", "x"},
            "j",
            function()
                return vim.v.count > 0 and "j" or "gj"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "k",
            function()
                return vim.v.count > 0 and "k" or "gk"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "H",
            function()
                return vim.v.count > 0 and "^" or "g^"
            end,
            "silent|expr"
        },
        {
            {"n", "x"},
            "L",
            function()
                return vim.v.count > 0 and "$" or "g$"
            end,
            "silent|expr"
        }
    },
    nvim_window_picker = {
        {{"n"}, "<c-w>w", "<cmd>lua require('window-picker').goto_window()<cr>", "silent"}
    },
    nvim_picgo = {
        {{"n"}, "<leader>uc", "<cmd>lua require'nvim-picgo'.upload_clipboard()<cr>", "silent"},
        {{"n"}, "<leader>uf", "<cmd>lua require'nvim-picgo'.upload_imagefile()<cr>", "silent"}
    },
    nvim_tree = {
        {{"n"}, "<leader>1", "<cmd>NvimTreeToggle<cr>", "silent"},
        {{"n"}, "<leader>fc", "<cmd>NvimTreeFindFile<cr>", "silent"}
    },
    undotree = {
        {{"n"}, "<leader>3", ":UndotreeToggle<cr>", "silent"}
    },
    vim_dadbod_ui = {
        {{"n"}, "<leader>4", ":DBUIToggle<cr>", "silent"}
    },
    venn = {
        {"n", "<leader>5", "<cmd>lua require('venn').toggle_venn_mode()<cr>", "silent"}
    },
    todo_comments = {
        {"n", "<leader>fd", "<cmd>TodoTelescope theme=dropdown<cr>", "silent"}
    },
    neoformat = {
        {{"n"}, "<leader>cf", "<cmd>Neoformat<cr>", "silent"}
    },
    copilot = {
        {{"i"}, "<c-l>", "copilot#Accept('')", "expr|silent"}
    },
    switch = {
        {{"n"}, "gs", ":Switch<cr>", "silent"}
    },
    vim_vsnip = {
        {{"i", "s"}, "<s-tab>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "expr|silent"},
        {{"i", "s"}, "<tab>", "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'", "expr|silent"}
    },
    hop = {
        {{"n", "v"}, "ss", "<cmd>HopWord<cr>", "silent"},
        {{"n", "v"}, "sl", "<cmd>HopLine<cr>", "silent"},
        {{"n", "v"}, "sc", "<cmd>HopChar1<cr>", "silent"}
    },
    persisted = {
        {{"n"}, "<leader>sl", "<cmd>lua require('persisted').load_session_all()<cr>", "silent"},
        {{"n"}, "<leader>ss", "<cmd>SessionSave<cr>"},
        {{"n"}, "<leader>sd", "<cmd>SessionDelete<cr>"}
    },
    nvim_spectre = {
        {{"n"}, "<leader>rp", "<cmd>lua require('spectre').open()<cr>", "silent"},
        {{"n"}, "<leader>rf", "viw:lua require('spectre').open_file_search()<cr>", "silent"},
        {{"n"}, "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "silent"}
    },
    toggleterm = {
        {{"n"}, "<leader>tt", "<cmd>lua require('toggleterm').term_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tv", "<cmd>lua require('toggleterm').vertical_toggle()<cr>", "silent"},
        {{"n"}, "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<cr>", "silent"},
        {{"n"}, "<leader>ta", "<cmd>lua require('toggleterm').toggle_all_term()<cr>", "silent"}
    },
    bufferline = {
        {{"n"}, "<c-q>", "<cmd>Bdelete!<cr>", "silent"},
        {{"n"}, "<c-h>", "<cmd>BufferLineCyclePrev<cr>", "silent"},
        {{"n"}, "<c-l>", "<cmd>BufferLineCycleNext<cr>", "silent"},
        {{"n"}, "<c-e>", "<cmd>BufferLineMovePrev<cr>", "silent"},
        {{"n"}, "<c-y>", "<cmd>BufferLineMoveNext<cr>", "silent"},
        {{"n"}, "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "silent"},
        {{"n"}, "<leader>bl", "<cmd>BufferLineCloseRight<cr>", "silent"},
        {{"n"}, "<leader>bo", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "silent"},
        {{"n"}, "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", "silent"},
        {{"n"}, "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", "silent"},
        {{"n"}, "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", "silent"},
        {{"n"}, "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", "silent"},
        {{"n"}, "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", "silent"},
        {{"n"}, "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", "silent"},
        {{"n"}, "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", "silent"},
        {{"n"}, "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", "silent"},
        {{"n"}, "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", "silent"},
        {{"n"}, "<leader>bt", "<cmd>BufferLinePick<cr>", "silent"},
        {{"n"}, "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", "silent"}
    },
    translator = {
        {{"n", "x"}, "<leader>tcs", ":Translate ZH -source=EN -output=split<cr>", "silent"},
        {{"n", "x"}, "<leader>tcr", ":Translate ZH -source=EN -output=replace<cr>", "silent"},
        {{"n", "x"}, "<leader>tcf", ":Translate ZH -source=EN -output=floating<cr>", "silent"},
        {{"n", "x"}, "<leader>tci", ":Translate ZH -source=EN -output=insert<cr>", "silent"},
        {{"n", "x"}, "<leader>tes", ":Translate EN -source=ZH -output=split<cr>", "silent"},
        {{"n", "x"}, "<leader>ter", ":Translate EN -source=ZH -output=replace<cr>", "silent"},
        {{"n", "x"}, "<leader>tef", ":Translate EN -source=ZH -output=floating<cr>", "silent"},
        {{"n", "x"}, "<leader>tei", ":Translate EN -source=ZH -output=insert<cr>", "silent"},
        {{"n"}, "<leader>tcF", ":Translate ZH -source=EN -output=floating -comment<cr>", "silent"},
        {{"n"}, "<leader>tcR", ":Translate ZH -source=EN -output=replace -comment<cr>", "silent"},
        {{"n"}, "<leader>teF", ":Translate EN -source=ZH -output=floating -comment<cr>", "silent"},
        {{"n"}, "<leader>teR", ":Translate EN -source=ZH -output=replace -comment<cr>", "silent"}
    },
    packer = {
        {{"n"}, "<leader>ps", "<cmd>PackerSync<cr>", "silent"},
        {{"n"}, "<leader>pS", "<cmd>PackerStatus<cr>", "silent"},
        {{"n"}, "<leader>pc", "<cmd>PackerClean<cr>", "silent"},
        {{"n"}, "<leader>pu", "<cmd>PackerUpdate<cr>", "silent"},
        {{"n"}, "<leader>pi", "<cmd>PackerInstall<cr>", "silent"},
        {{"n"}, "<leader>pr", "<cmd>PackerCompile<cr>", "silent"}
    },
    nvim_dap = {
        {{"n"}, "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "silent"},
        {
            {"n"},
            "<leader>dB",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
            "silent"
        },
        {{"n"}, "<leader>dc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", "silent"},
        {{"n"}, "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "silent"},
        {{"n"}, "<leader>dh", "<cmd>lua require'dapui'.eval()<cr>", "silent"},
        {{"n"}, "<F5>", "<cmd>lua require'dap'.continue()<cr>", "silent"},
        {{"n"}, "<F6>", "<cmd>lua require'dap'.step_into()<cr>", "silent"},
        {{"n"}, "<F7>", "<cmd>lua require'dap'.step_over()<cr>", "silent"},
        {{"n"}, "<F8>", "<cmd>lua require'dap'.step_out()<cr>", "silent"},
        {{"n"}, "<F9>", "<cmd>lua require'dap'.run_last()<cr>", "silent"},
        {{"n"}, "<F10>", "<cmd>lua require'dap'.terminate()<cr>", "silent"}
    },
    nvim_hlslens = {
        {
            {"n"},
            "n",
            "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
            "silent"
        },
        {
            {"n"},
            "N",
            "<cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
            "silent"
        },
        {{"n"}, "*", "*<cmd>lua require('hlslens').start()<CR>", "silent"},
        {{"n"}, "#", "#<cmd>lua require('hlslens').start()<cr>", "silent"},
        {{"n"}, "g*", "g*<cmd>lua require('hlslens').start()<cr>", "silent"},
        {{"n"}, "g#", "g#<cmd>lua require('hlslens').start()<cr>", "silent"}
    },
    vim_carbon_now_sh = {
        {{"v"}, "<leader>ch", ":CarbonNowSh<cr>", "silent"},
        {{"n"}, "<leader>ch", "ggVG:CarbonNowSh<cr><c-o>", "silent"}
    },
    nvim_neoclip = {
        {
            {"n"},
            "<leader>fy",
            "<cmd>lua require('telescope').extensions.neoclip.default(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    },
    nvim_notify = {
        {
            {"n"},
            "<leader>fn",
            "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    },
    telescope = {
        {
            {"n"},
            "<leader>ff",
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fg",
            "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fo",
            "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fh",
            "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>ft",
            "<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fm",
            "<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fi",
            "<cmd>lua require('telescope.builtin').highlights(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fb",
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>fp",
            "<cmd>lua require('telescope.builtin').pickers(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>f/",
            "<cmd>lua require('telescope.builtin').search_history(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>f:",
            "<cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        }
    }
}

mapping.buffer = {
    nvim_lsp_installer = {
        {
            {"n"},
            "gd",
            "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "gr",
            "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "go",
            "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {
            {"n"},
            "<leader>ca",
            "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
            "silent"
        },
        {{"n"}, "gh", "<cmd>Lspsaga hover_doc<cr>", "silent"},
        {{"n"}, "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "silent"},
        {{"n"}, "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", "silent"},
        {{"n"}, "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", "silent"},
        {{"n"}, "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", "silent"},
        {{"n"}, "<leader>cn", "<cmd>Lspsaga rename<cr>", "silent"}
    },
    aerial = {
        {{"n"}, "<leader>2", "<cmd>AerialToggle! right<cr>", "silent"},
        {{"n"}, "{", "<cmd>AerialPrev<cr>", "silent"},
        {{"n"}, "}", "<cmd>AerialNext<cr>", "silent"},
        {{"n"}, "[[", "<cmd>AerialPrevUp<cr>", "silent"},
        {{"n"}, "]]", "<cmd>AerialNextUp<cr>", "silent"}
    },
    gitsigns = {
        {{"n"}, "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", "expr|silent"},
        {{"n"}, "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", "expr|silent"},
        {{"n"}, "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "silent"},
        {{"n"}, "<leader>gh", "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>", "silent"},
        {{"n"}, "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", "silent"},
        {{"n"}, "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", "silent"},
        {{"n"}, "<leader>gv", "<cmd>Gitsigns diffthis<cr>", "silent"},
        {{"n", "v"}, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "silent"}
    },
    venn = {
        {{"n"}, "<c-j>", "<C-v>j:VBox<CR>", "silent"},
        {{"n"}, "<c-k>", "<C-v>k:VBox<CR>", "silent"},
        {{"n"}, "<c-l>", "<C-v>l:VBox<CR>", "silent"},
        {{"n"}, "<c-h>", "<C-v>h:VBox<CR>", "silent"},
        {{"v"}, "b", ":VBox<CR>", "silent"},
        {{"v"}, "f", ":VFill<CR>", "silent"}
    }
}

mapping.plugin = {
    lsp_signature = {
        toggle_key = "<c-j>"
    },
    lspsaga = {
        quit = "<esc>",
        exec = "<cr>"
    },
    telescope_buffer = {
        insert_del_buf = "<c-d>",
        noremal_del_buf = "dd"
    },
    nvim_neoclip = {
        confirm_select = "<cr>",
        insert_delete_yank = "<c-d>",
        noremal_delete_yank = "dd"
    },
    nvim_cmp = {
        prev_item = "<c-p>",
        next_item = "<c-n>",
        confirm = "<cr>",
        next_item_or_confirm = "<tab>",
        prev_5_item = "<c-u>",
        next_5_item = "<c-d>",
        toggle_complete = "<c-k>",
        prev_scroll = "<c-b>",
        next_scroll = "<c-f>"
    },
    nvim_treesitter = {
        init_selection = "<cr>",
        node_incremental = "<cr>",
        node_decremental = "<bs>",
        scope_incremental = "<tab>"
    },
    nvim_spectre = {
        toggle_line = "dd",
        select_entry = "<cr>",
        show_option_menu = "<leader>o",
        run_replace = "<leader>r",
        change_view_mode = "<leader>v"
    },
    comment = {
        normal_line_toggle = "gcc",
        normal_block_toggle = "gCC",
        normal_prev_rows = "gcO",
        normal_next_rows = "gco",
        noremal_end_line = "gcA",
        visual_line_toggle = "gc",
        visual_block_toggle = "gC"
    },
    toggleterm = {
        exit_insert = "<esc>",
        lazy_git_exit_insert = "q",
        float_exit_insert = "<esc>"
    },
    vim_visual_multi = {
        {{"n"}, "<tab>", ":call b:VM_Selection.Global.change_mode(1)<cr>", "silent"},
        {{"n"}, "<c-n>", ":call vm#commands#ctrln(v:count1)<cr>", "silent"},
        {{"n"}, "<c-s>", ":call vm#commands#skip(0)<cr>", "silent"},
        {{"n"}, "<c-p>", ":call vm#commands#skip(1)<cr>", "silent"},
        {{"n"}, "<m-p>", ":call vm#commands#add_cursor_up(0, v:count1)<cr>", "silent"},
        {{"n"}, "<m-n>", ":call vm#commands#add_cursor_down(0, v:count1)<cr>", "silent"}
    }
}

return mapping
