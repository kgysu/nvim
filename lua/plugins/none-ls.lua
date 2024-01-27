return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				null_ls.builtins.formatting.goimports,
				--				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.asmfmt,
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.formatting.biome,
				null_ls.builtins.formatting.eslint,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.formatting.yq,
				null_ls.builtins.formatting.trim_whitespace,
				null_ls.builtins.formatting.trim_newlines,
				null_ls.builtins.formatting.rustfmt,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "format file" })
	end,
}
