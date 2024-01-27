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
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsserver",
					"bashls",
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					--          "delve",
					"html",
					"htmx",
					"cssls",
					"helm_ls",
					"jsonls",
					"biome",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Open Docs on cursor" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to reference" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "open code actions" })
		end,
	},
}
