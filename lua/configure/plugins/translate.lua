-- https://github.com/uga-rosa/translate.nvim

-- The plugin uses the translate-shell plugin by default, so you need to install this plugin
-- https://github.com/soimort/translate-shell
-- You can also choose to use deepl for translation, but it relies on curl commands
-- https://curl.se/
-- With these tools, you can call deepl's api
-- https://www.deepl.com/en/docs-api/

require("translate").setup(
    {
        default = {
            -- default: translate_shell
            -- deepl_free
            -- deepl_pro
            command = "translate_shell",
            output = "floating",
            parse_before = "trim",
            parse_after = "replace_symbols"
        },
        preset = {
            output = {
                split = {
                    min_size = 8
                }
            }
        },
        parse_after = {
            replace_symbols = {
                cmd = function(lines)
                    for index, char in ipairs(lines) do
                        if char:find("u003d") then
                            lines[index] = char:gsub("u003d", "=")
                        end
                    end
                    return lines
                end
            }
        }
    }
)
