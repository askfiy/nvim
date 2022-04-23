vim.g.mapleader = " "

local mapping = {}

mapping.register = function(range, gruop_name, bufnr)
    local group_keymap = mapping[range][gruop_name]
    for _, key_map in ipairs(group_keymap) do
        local options = {}
        if bufnr then
            options.buffer = bufnr
        end
        for _, key_opts in ipairs(vim.split(key_map[4], "|", true)) do
            options[key_opts] = true
        end
        vim.keymap.set(key_map[1], key_map[2], key_map[3], options)
    end
end

mapping.global = {
    basic = {
        {{"i"}, "jj", "<esc>", "noremap|silent"},
        {{"t"}, "<esc>", "<c-\\><c-n>", "noremap|silent"},
        {{"n"}, "\\\\", ":qa!<cr>", "noremap|silent"},
        {{"n"}, "<esc>", ":nohlsearch<cr>", "noremap|silent"},
        {{"n"}, "<c-u>", "10k", "noremap|silent"},
        {{"n"}, "<c-d>", "10j", "noremap|silent"},
        {{"n"}, "<m-k>", "<c-w>-", "noremap|silent"},
        {{"n"}, "<m-j>", "<c-w>+", "noremap|silent"},
        {{"n"}, "<m-h>", "<c-w><", "noremap|silent"},
        {{"n"}, "<m-l>", "<c-w>>", "noremap|silent"},
        {{"n"}, "<leader>cs", "<cmd>set spell!<cr>", "noremap|silent"},
        {{"i", "c", "t"}, "<m-w>", "<c-right>", "noremap"},
        {{"i", "c", "t"}, "<m-b>", "<c-left>", "noremap"},
        {{"i", "c", "t"}, "<m-k>", "<up>", "noremap"},
        {{"i", "c", "t"}, "<m-j>", "<down>", "noremap"},
        {{"i", "c", "t"}, "<m-h>", "<left>", "noremap"},
        {{"i", "c", "t"}, "<m-l>", "<right>", "noremap"},
        {
            {"n", "x"},
            "j",
            function()
                return vim.v.count > 0 and "j" or "gj"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "k",
            function()
                return vim.v.count > 0 and "k" or "gk"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "H",
            function()
                return vim.v.count > 0 and "^" or "g^"
            end,
            "noremap|silent|expr"
        },
        {
            {"n", "x"},
            "L",
            function()
                return vim.v.count > 0 and "$" or "g$"
            end,
            "noremap|silent|expr"
        }
    },
    nvim_tree = {
        {{"n"}, "<leader>1", "<cmd>NvimTreeToggle<cr>", "noremap|silent"},
        {{"n"}, "<leader>fc", "<cmd>NvimTreeFindFile<cr>", "noremap|silent"}
    },
    undotree = {
        {{"n"}, "<leader>3", ":UndotreeToggle<cr>", "noremap|silent"}
    },
    vim_dadbod_ui = {
        {{"n"}, "<leader>4", ":DBUIToggle<cr>", "noremap|silent"}
    },
    venn = {
        {"n", "<leader>5", "<cmd>lua require('venn').toggle_venn_mode()<cr>", "noremap|silent"}
    },
    todo_comments = {
        {"n", "<leader>ft", "<cmd>TodoTelescope theme=dropdown<cr>", "noremap|silent"}
    },
    neoformat = {
        {{"n"}, "<leader>cf", "<cmd>Neoformat<cr>", "noremap|silent"}
    },
    copilot = {
        {{"i"}, "<c-l>", "copilot#Accept('')", "expr|silent"}
    },
    switch = {
        {{"n"}, "gs", ":Switch<cr>", "noremap|silent"}
    },
    vim_vsnip = {
        {{"i", "s"}, "<s-tab>", "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<s-tab>'", "expr|silent"},
        {{"i", "s"}, "<tab>", "vsnip#jumpable(1)? '<Plug>(vsnip-jump-next)':'<tab>'", "expr|silent"}
    },
    hop = {
        {{"n", "v"}, "ss", "<cmd>HopWord<cr>", "noremap|silent"},
        {{"n", "v"}, "sl", "<cmd>HopLine<cr>", "noremap|silent"},
        {{"n", "v"}, "sc", "<cmd>HopChar1<cr>", "noremap|silent"}
    },
    persisted = {
        {{"n"}, "<leader>sl", "<cmd>lua require('persisted').load_session_all()<cr>", "noremap|silent"},
        {{"n"}, "<leader>ss", "<cmd>SessionSave<cr>", "noremap"},
        {{"n"}, "<leader>sd", "<cmd>SessionDelete<cr>", "noremap"}
    },
    nvim_spectre = {
        {{"n"}, "<leader>rp", "<cmd>lua require('spectre').open()<cr>", "noremap|silent"},
        {{"n"}, "<leader>rf", "viw:lua require('spectre').open_file_search()<cr>", "noremap|silent"},
        {{"n"}, "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "noremap|silent"}
    },
    toggleterm = {
        {{"n"}, "<leader>tt", "<cmd>lua require('toggleterm').term_toggle()<cr>", "noremap|silent"},
        {{"n"}, "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<cr>", "noremap|silent"},
        {{"n"}, "<leader>tv", "<cmd>lua require('toggleterm').vertical_toggle()<cr>", "noremap|silent"},
        {{"n"}, "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<cr>", "noremap|silent"},
        {{"n"}, "<leader>ta", "<cmd>lua require('toggleterm').toggle_all_term()<cr>", "noremap|silent"}
    },
    bufferline = {
        {{"n"}, "<c-q>", "<cmd>Bdelete!<cr>", "noremap|silent"},
        {{"n"}, "<c-h>", "<cmd>BufferLineCyclePrev<cr>", "noremap|silent"},
        {{"n"}, "<c-l>", "<cmd>BufferLineCycleNext<cr>", "noremap|silent"},
        {{"n"}, "<c-e>", "<cmd>BufferLineMovePrev<cr>", "noremap|silent"},
        {{"n"}, "<c-y>", "<cmd>BufferLineMoveNext<cr>", "noremap|silent"},
        {{"n"}, "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", "noremap|silent"},
        {{"n"}, "<leader>bl", "<cmd>BufferLineCloseRight<cr>", "noremap|silent"},
        {{"n"}, "<leader>bo", "<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>", "noremap|silent"},
        {{"n"}, "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", "noremap|silent"},
        {{"n"}, "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", "noremap|silent"},
        {{"n"}, "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", "noremap|silent"},
        {{"n"}, "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", "noremap|silent"},
        {{"n"}, "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", "noremap|silent"},
        {{"n"}, "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", "noremap|silent"},
        {{"n"}, "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", "noremap|silent"},
        {{"n"}, "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", "noremap|silent"},
        {{"n"}, "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", "noremap|silent"},
        {{"n"}, "<leader>bt", "<cmd>BufferLinePick<cr>", "noremap|silent"},
        {{"n"}, "<leader>bs", "<cmd>BufferLineSortByExtension<cr>", "noremap|silent"}
    },
    translator = {
        {{"n", "x"}, "<leader>tcs", ":Translate ZH -source=EN -output=split<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tcr", ":Translate ZH -source=EN -output=replace<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tcf", ":Translate ZH -source=EN -output=floating<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tci", ":Translate ZH -source=EN -output=insert<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tes", ":Translate EN -source=ZH -output=split<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>ter", ":Translate EN -source=ZH -output=replace<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tef", ":Translate EN -source=ZH -output=floating<cr>", "noremap|silent"},
        {{"n", "x"}, "<leader>tei", ":Translate EN -source=ZH -output=insert<cr>", "noremap|silent"}
    },
    packer = {
        {{"n"}, "<leader>ps", "<cmd>PackerSync<cr>", "noremap|silent"},
        {{"n"}, "<leader>pS", "<cmd>PackerStatus<cr>", "noremap|silent"},
        {{"n"}, "<leader>pc", "<cmd>PackerClean<cr>", "noremap|silent"},
        {{"n"}, "<leader>pu", "<cmd>PackerUpdate<cr>", "noremap|silent"},
        {{"n"}, "<leader>pi", "<cmd>PackerInstall<cr>", "noremap|silent"},
        {{"n"}, "<leader>pr", "<cmd>PackerCompile<cr>", "noremap|silent"}
    },
    nvim_dap = {
        {{"n"}, "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "noremap|silent"},
        {
            {"n"},
            "<leader>dB",
            "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>",
            "noremap|silent"
        },
        {{"n"}, "<leader>dc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", "noremap|silent"},
        {{"n"}, "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", "noremap|silent"},
        {{"n"}, "<leader>dh", "<cmd>lua require'dapui'.eval()<cr>", "noremap|silent"},
        {{"n"}, "<F5>", "<cmd>lua require'dap'.continue()<cr>", "noremap|silent"},
        {{"n"}, "<F6>", "<cmd>lua require'dap'.step_into()<cr>", "noremap|silent"},
        {{"n"}, "<F7>", "<cmd>lua require'dap'.step_over()<cr>", "noremap|silent"},
        {{"n"}, "<F8>", "<cmd>lua require'dap'.step_out()<cr>", "noremap|silent"},
        {{"n"}, "<F9>", "<cmd>lua require'dap'.run_last()<cr>", "noremap|silent"},
        {{"n"}, "<F10>", "<cmd>lua require'dap'.terminate()<cr>", "noremap|silent"}
    },
    nvim_hlslens = {
        {
            {"n"},
            "n",
            "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "N",
            "<cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>",
            "noremap|silent"
        },
        {{"n"}, "*", "*<cmd>lua require('hlslens').start()<CR>", "noremap|silent"},
        {{"n"}, "#", "#<cmd>lua require('hlslens').start()<cr>", "noremap|silent"},
        {{"n"}, "g*", "g*<cmd>lua require('hlslens').start()<cr>", "noremap|silent"},
        {{"n"}, "g#", "g#<cmd>lua require('hlslens').start()<cr>", "noremap|silent"}
    },
    vim_carbon_now_sh = {
        {{"v"}, "<leader>ch", ":CarbonNowSh<cr>", "noremap|silent"},
        {{"n"}, "<leader>ch", "ggVG:CarbonNowSh<cr><c-o>", "noremap|silent"}
    },
    nvim_neoclip = {
        {
            {"n"},
            "<leader>fy",
            "<cmd>lua require('telescope').extensions.neoclip.default(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        }
    },
    nvim_notify = {
        {
            {"n"},
            "<leader>fn",
            "<cmd>lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        }
    },
    telescope = {
        {
            {"n"},
            "<leader>ff",
            "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fg",
            "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fo",
            "<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fh",
            "<cmd>lua require('telescope.builtin').resume(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fm",
            "<cmd>lua require('telescope.builtin').marks(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fi",
            "<cmd>lua require('telescope.builtin').highlights(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fb",
            "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>fp",
            "<cmd>lua require('telescope.builtin').pickers(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>f/",
            "<cmd>lua require('telescope.builtin').search_history(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>f:",
            "<cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        }
    }
}

mapping.buffer = {
    nvim_lsp_installer = {
        {
            {"n"},
            "gd",
            "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "gr",
            "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "go",
            "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {
            {"n"},
            "<leader>ca",
            "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
            "noremap|silent"
        },
        {{"n"}, "gh", "<cmd>Lspsaga hover_doc<cr>", "noremap|silent"},
        {{"n"}, "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", "noremap|silent"},
        {{"n"}, "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", "noremap|silent"},
        {{"n"}, "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", "noremap|silent"},
        {{"n"}, "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", "noremap|silent"},
        {{"n"}, "<leader>cn", "<cmd>Lspsaga rename<cr>", "noremap|silent"}
    },
    aerial = {
        {{"n"}, "<leader>2", "<cmd>AerialToggle! right<cr>", "noremap|silent"},
        {{"n"}, "{", "<cmd>AerialPrev<cr>", "noremap|silent"},
        {{"n"}, "}", "<cmd>AerialNext<cr>", "noremap|silent"},
        {{"n"}, "[[", "<cmd>AerialPrevUp<cr>", "noremap|silent"},
        {{"n"}, "]]", "<cmd>AerialNextUp<cr>", "noremap|silent"}
    },
    gitsigns = {
        {{"n"}, "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<cr>'", "expr|silent"},
        {{"n"}, "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<cr>'", "expr|silent"},
        {{"n"}, "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "noremap|silent"},
        {{"n"}, "<leader>gh", "<cmd>lua require'gitsigns'.blame_line{full=true}<cr>", "noremap|silent"},
        {{"n"}, "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<cr>", "noremap|silent"},
        {{"n"}, "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", "noremap|silent"},
        {{"n"}, "<leader>gv", "<cmd>Gitsigns diffthis<cr>", "noremap|silent"},
        {{"n", "v"}, "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "noremap|silent"}
    },
    venn = {
        {{"n"}, "<c-j>", "<C-v>j:VBox<CR>", "noremap|silent"},
        {{"n"}, "<c-k>", "<C-v>k:VBox<CR>", "noremap|silent"},
        {{"n"}, "<c-l>", "<C-v>l:VBox<CR>", "noremap|silent"},
        {{"n"}, "<c-h>", "<C-v>h:VBox<CR>", "noremap|silent"},
        {{"v"}, "b", ":VBox<CR>", "noremap|silent"},
        {{"v"}, "f", ":VFill<CR>", "noremap|silent"}
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
        {{"n"}, "<tab>", ":call b:VM_Selection.Global.change_mode(1)<cr>", "noremap|silent"},
        {{"n"}, "<c-n>", ":call vm#commands#ctrln(v:count1)<cr>", "noremap|silent"},
        {{"n"}, "<c-s>", ":call vm#commands#skip(0)<cr>", "noremap|silent"},
        {{"n"}, "<c-p>", ":call vm#commands#skip(1)<cr>", "noremap|silent"},
        {{"n"}, "<m-p>", ":call vm#commands#add_cursor_up(0, v:count1)<cr>", "noremap|silent"},
        {{"n"}, "<m-n>", ":call vm#commands#add_cursor_down(0, v:count1)<cr>", "noremap|silent"}
    }
}

return mapping
