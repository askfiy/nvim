if not vim.fn.has("nvim-0.8") then
    assert(false, "this config require nvim-0.8")
end

require("core.setting")
require("core.options")
require("core.mapping")

require("core.plugins")
require("core.after")
