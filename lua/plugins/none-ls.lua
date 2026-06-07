return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.djlint,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.formatting.erb_format,
				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.credo,
				null_ls.builtins.diagnostics.markuplint,
				null_ls.builtins.formatting.htmlbeautifier,
				null_ls.builtins.formatting.mix,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.black,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
