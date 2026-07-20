return {
    {
        "mason-org/mason-lspconfig.nvim",
        -- Mason lspconfig automatically installs and enables the following lsps
        opts = {
            ensure_installed = { 'angularls', 'asm_lsp', 'bashls', 'clangd', 'html', 'hydra_lsp', 'jedi_language_server', 'jsonls', 'lemminx', 'lua_ls', 'rust_analyzer', 'taplo' },
        },
        dependencies = {
            -- Load Mason lsp downloader before configurator
            { "mason-org/mason.nvim", opts = {} },
            -- Load read-only default configs repo
            {
                "neovim/nvim-lspconfig",
                cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
                event = { 'BufReadPre', 'BufNewFile' },
            },
        },
    },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'enter' },

            appearance = {
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = true } },
            -- Experimental feature, maybe not needed?
            signature = {
                enabled = true,
                window = {
                    show_documentation = true,
                },
            },
            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
    }
    --[[
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- For luasnip users.
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function()
            -- Set up nvim-cmp.
            local cmp = require("cmp")
            return {
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        --vim.fn["UltiSnips#Anon"](args.body)
                    end
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                mapping = cmp.mapping.preset.insert(
                    {
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<C-e>"] = cmp.mapping.abort(),
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<C-CR>'] = cmp.mapping.confirm({ select = true }),
                        -- ['<Tab>'] = nil,
                        -- ['<S-Tab>'] = nil,
                        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-d>'] = cmp.mapping.scroll_docs(4),
                        --['<C-f>'] = cmp.luasnip_jump_forward(),
                        --['<C-b>'] = cmp.luasnip_jump_backward(),
                    }
                ),
                sources = cmp.config.sources(
                    {
                        { name = "luasnip" }, -- For luasnip users.
                        -- { name = 'ultisnips' }, -- For ultisnips users.
                        { name = "nvim_lsp" },
                    },
                    {
                        { name = "buffer" },
                    }
                )
            }
        end,
    },
    ]]
}
