return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		--[[ config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"angularls",
					"arduino_language_server",
					"asm_lsp",
					"bashls",
					"dockerls",
					"docker_compose_language_service",
					"elp",
					"erlangls",
					"golangci_lint_ls",
					"gopls",
					"html",
					"htmx",
					"cssls",
					"helm_ls",
					"jsonls",
					"biome",
					"jdtls",
					"java_language_server",
					"jqls",
					"remark_ls",
					"rust_analyzer",
					"sqlls",
				},
			})
		end,]]
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
			lspconfig.tsserver.setup({
        capabilities = capabilities
      })
			lspconfig.html.setup({
        capabilities = capabilities
      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
