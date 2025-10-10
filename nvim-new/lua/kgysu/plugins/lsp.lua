local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
      }
    })
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities
          }
        end,

        zls = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
              zls = {
                enable_inlay_hints = true,
                enable_snippets = true,
                warn_style = true,
              },
            },
          })
          vim.g.zig_fmt_parse_errors = 0
          vim.g.zig_fmt_autosave = 0
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                format = {
                  enable = true,
                  -- Put format options here
                  -- NOTE: the value should be STRING!!
                  defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                  }
                },
              }
            }
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
        autocomplete = false,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-l>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}





-- return {
--   -- LSP Plugins
--   {
--     'folke/lazydev.nvim',
--     ft = 'lua',
--     opts = {
--       library = {
--         { path = 'luvit-meta/library', words = { 'vim%.uv' } },
--       },
--     },
--   },
--   { 'Bilal2453/luvit-meta', lazy = true },
--   {
--     -- Main LSP Configuration
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       -- Automatically install LSPs and related tools to stdpath for Neovim
--       { 'williamboman/mason.nvim', config = true },
--       'williamboman/mason-lspconfig.nvim',
--       'WhoIsSethDaniel/mason-tool-installer.nvim',
--
--       -- Useful status updates for LSP.
--       { 'j-hui/fidget.nvim',       opts = {} },
--
--       -- Allows extra capabilities provided by nvim-cmp
--       'hrsh7th/cmp-nvim-lsp',
--     },
--     config = function()
--       vim.api.nvim_create_autocmd('LspAttach', {
--         group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
--         callback = function(event)
--           local map = function(keys, func, desc, mode)
--             mode = mode or 'n'
--             vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
--           end
--
--           --  To jump back, press <C-t>.
--           map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--           map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--           map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--           map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--
--           map('<leader>vrn', vim.lsp.buf.rename, '[R]e[n]ame')
--           map('<leader>vca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
--           map('<leader>vws', vim.lsp.buf.workspace_symbol, 'Workspace symbol')
--           map('<leader>vd', vim.diagnostic.open_float, 'Diagnostic open')
--           map('<leader>vrr', vim.lsp.buf.references, 'References')
--           map('[d', vim.diagnostic.goto_next, 'next diagnostics')
--           map(']d', vim.diagnostic.goto_prev, 'prev diagnostics')
--
--           -- The following two autocommands are used to highlight references of the
--           -- word under your cursor when your cursor rests there for a little while.
--           --    See `:help CursorHold` for information about when this is executed
--           --
--           -- When you move your cursor, the highlights will be cleared (the second autocommand).
--           local client = vim.lsp.get_client_by_id(event.data.client_id)
--           if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
--             local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
--             vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.document_highlight,
--             })
--
--             vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
--               buffer = event.buf,
--               group = highlight_augroup,
--               callback = vim.lsp.buf.clear_references,
--             })
--
--             vim.api.nvim_create_autocmd('LspDetach', {
--               group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
--               callback = function(event2)
--                 vim.lsp.buf.clear_references()
--                 vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
--               end,
--             })
--           end
--         end,
--       })
--
--       -- Change diagnostic symbols in the sign column (gutter)
--       if vim.g.have_nerd_font then
--         local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
--         local diagnostic_signs = {}
--         for type, icon in pairs(signs) do
--           diagnostic_signs[vim.diagnostic.severity[type]] = icon
--         end
--         vim.diagnostic.config { signs = { text = diagnostic_signs } }
--       end
--
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--       local servers = {
--         clangd = {},
--         gopls = {},
--
--         lua_ls = {
--           settings = {
--             Lua = {
--               completion = {
--                 callSnippet = 'Replace',
--               },
--               -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--               -- diagnostics = { disable = { 'missing-fields' } },
--             },
--           },
--         },
--
--         jdtls = { filetypes = { 'java' } },
--       }
--
--       require('mason').setup()
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         'stylua', -- Used to format Lua code
--         'java-test',
--         'java-debug-adapter',
--       })
--       require('mason-tool-installer').setup { ensure_installed = ensure_installed }
--
--       require('mason-lspconfig').setup {
--         handlers = {
--           function(server_name)
--             if server_name ~= 'jdtls' then
--               local server = servers[server_name] or {}
--               server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--               require('lspconfig')[server_name].setup(server)
--             end
--           end,
--         },
--         ensure_installed = {},
--         automatic_installation = false,
--       }
--     end,
--   },
-- }
