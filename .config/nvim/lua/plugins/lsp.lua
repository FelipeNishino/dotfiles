return {
    {
        "mason-org/mason-lspconfig.nvim",
        -- Mason lspconfig automatically installs and enables the following lsps
        opts = {
            ensure_installed = { 'asm_lsp', 'bashls', 'clangd', 'html', 'hydra_lsp', 'jedi_language_server', 'jsonls', 'lemminx', 'lua_ls', 'rust_analyzer', 'taplo' },
        },
        dependencies = {
            -- Load Mason lsp downloader before configurator
            { "mason-org/mason.nvim", opts = {} },
            -- Load read-only default configs repo
            {
                "neovim/nvim-lspconfig",
                cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
                event = { 'BufReadPre', 'BufNewFile' },
                dependencies = {
                    { 'hrsh7th/cmp-nvim-lsp' },
                },
            },
        },
    },
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
}
