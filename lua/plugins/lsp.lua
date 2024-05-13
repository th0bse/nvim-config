return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "folke/neodev.nvim",
        "mfussenegger/nvim-jdtls",
    },

    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("neodev").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "jdtls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
				    runtime = { version = "LuaJIT" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                -- ignore jdtls here, we want that to be handled by nvim-jdtls plugin
                ["jdtls"] = function()
                    return true
                end,
            },
        })

        -- used for copilot completions, make tab fall back to indenting if no 
        -- character was actually typed
        local has_words_before = function()
          if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
        end

        local luasnip = require("luasnip")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = {
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        elseif cmp.get_active_entry() then
                            cmp.confirm({
                                select = true,
                            })
                        else
                            fallback()
                        end
                    else
                        fallback()
                    end
                end),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() and has_words_before() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-k>"] = cmp.mapping.scroll_docs(-1),
                ["<C-j>"] = cmp.mapping.scroll_docs(1),
            },

            sources = {
                { name = "path" },
                { name = "nvim_lsp" },
                { name = "copilot" },
                { name = "buffer", keyworld_length = 3 },
                { name = "luasnip", keyword_length = 2 },
            },

            sorting = {
                priority_weight = 2,
                comparators = {
                    require("copilot_cmp.comparators").prioritize,
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            formatting = {
                fields = { "menu", "abbr", "kind" },
                format = function(entry, item)
                    local name = entry.source.name
                    if name == "nvim_lsp" then
                        item.menu = "[LSP]"
                    elseif name == "nvim_lua" then
                        item.menu = "[nvim]"
                    else
                        item.menu = string.format("[%s]", name)
                    end

                    return item
                end,
                expandable_indicator = true,
                },
        })
    end
}
