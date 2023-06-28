-- https://github.com/rust-lang/rust-analyzer

-- You must install rust-analyzer using the rustup tool
-- `rustup component add rust-analyzer`

local util = require("lspconfig.util")

local root_files = {
    "Cargo.toml",
}

return {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = util.root_pattern(unpack(root_files)),
    settings = {
        ["rust-analyzer"] = {
            allFeatures = true,
        },
    },
}
