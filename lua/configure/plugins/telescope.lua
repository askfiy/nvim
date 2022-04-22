-- https://github.com/nvim-telescope/telescope.nvim

-- WARN: telescope manual installation depends on fd and repgrep
-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep

local mapping = require("core.mapping")

require("telescope").setup(
    {
        pickers = {
            buffers = {
                mappings = {
                    i = {
                        [mapping.plugin.telescope_buffer.insert_del_buf] = "delete_buffer"
                    },
                    n = {
                        [mapping.plugin.telescope_buffer.noremal_del_buf] = "delete_buffer"
                    }
                }
            }
        }
    }
)
