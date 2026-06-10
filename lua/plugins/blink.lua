return {
    "L3MON4D3/LuaSnip",
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = {
                    ["<CR>"] = { "accept", "fallback" },
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<CR>"] = { "accept", "fallback" },
                    },
                },
                completion = {
                    keyword = {
                        -- Разрешаем блинку открывать меню, даже если мы ввели всего 1 символ
                        -- (важно для знака '<' или эммет-класса '.btn')
                        range = 'prefix',
                    },
                    trigger = {
                        -- По умолчанию blink может блокировать авто-шоу в html, выключаем ручной режим
                        prefetch_on_insert = true,
                        show_on_trigger_character = true,
                        show_on_insert_on_trigger_character = true,

                        -- ЖЕСТКИЙ ПИНКИЛЬ: Принудительно запускаем авто-показ на эти символы
                        -- во всех файлах, чтобы эммет и теги вылетали мгновенно
                        show_on_x_blocked_trigger_characters = {},
                    },
                    list = {
                        selection = {
                            preselect = true,
                            auto_insert = true,
                        }
                    },
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
