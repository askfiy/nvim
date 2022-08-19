local aux_cmp = {
    -- priority when sorting by source (disabled by default)
    soruce_priority = {
        ["vsnip"] = 7,
        ["nvim_lsp"] = 6,
        ["cmp_tabnine"] = 5,
        ["buffer"] = 4,
        ["path"] = 3,
        ["cmdline"] = 2,
        ["vim-dadbod-completion"] = 1,
    },
    -- priority when sorting by kind (disabled by default)
    kind_priority = {
        ["Snippet"] = 25,
        ["Module"] = 24,
        ["Keyword"] = 23,
        ["Variable"] = 22,
        ["Text"] = 21,
        ["Class"] = 20,
        ["Function"] = 19,
        ["Field"] = 18,
        ["Method"] = 17,
        ["Property"] = 16,
        ["Constant"] = 15,
        ["Enum"] = 14,
        ["EnumMember"] = 13,
        ["Event"] = 12,
        ["Operator"] = 11,
        ["Reference"] = 10,
        ["Struct"] = 9,
        ["File"] = 8,
        ["Folder"] = 7,
        ["Color"] = 6,
        ["Constructor"] = 5,
        ["Interface"] = 4,
        ["TypeParameter"] = 3,
        ["Unit"] = 2,
        ["Value"] = 1,
    },
}

-- sort by name, lower priority if name starts with underscore
function aux_cmp.under_compare(entry1, entry2)
    -- decrease priority if suggestion starts with _
    local _, entry1_under = entry1.completion_item.label:find("^_+")
    local _, entry2_under = entry2.completion_item.label:find("^_+")

    entry1_under = entry1_under or 0
    entry2_under = entry2_under or 0

    return entry1_under < entry2_under
end

-- sort according to the specified order
function aux_cmp.kind_compare(entry1, entry2)
    -- sort by kind priority (disabled by default)
    local entry1_kind = aux_cmp.cmp.lsp.CompletionItemKind[entry1:get_kind()]
    local entry2_kind = aux_cmp.cmp.lsp.CompletionItemKind[entry2:get_kind()]

    local kind_priority1 = aux_cmp.kind_priority[entry1_kind] or 0
    local kind_priority2 = aux_cmp.kind_priority[entry2_kind] or 0

    -- desc
    return kind_priority2 < kind_priority1
end

-- sort by specified completion source
function aux_cmp.source_compare(entry1, entry2)
    -- sort by source priority (disabled by default)
    local source1 = entry1.source.name
    local source2 = entry2.source.name

    local source_priority1 = aux_cmp.soruce_priority[source1] or 0
    local source_priority2 = aux_cmp.soruce_priority[source2] or 0

    -- desc
    return source_priority2 < source_priority1
end

return aux_cmp
