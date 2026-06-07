return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
			vim.keymap.set("n", "<F6>", ":Lspsaga diagnostic_jump_prev<CR>", {})
			vim.keymap.set("n", "<F7>", ":Lspsaga diagnostic_jump_next<CR>", {})
			vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", {})
			vim.keymap.set("n", "<C-o>", ":Lspsaga outline<CR>", {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cssls",
					"dockerls",
					"docker_compose_language_service",
					"elixirls",
					"elmls",
					"gopls",
					"html",
					"htmx",
					"jsonls",
					"ruby_lsp",
					"sqlls",
					"ts_ls",
					"pyright",
					"rust_analyzer",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				clangd = function(_, opts)
					opts.capabilities.offsetEncoding = { "utf-16" }
				end,
			},
		},
		config = function()
			local enabled_features = {
				"documentHighlights",
				"documentSymbols",
				"foldingRanges",
				"selectionRanges",
				-- "semanticHighlighting",
				"formatting",
				"codeActions",
			}
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.elixirls.setup({
				cmd = { "elixir-ls" },
			})
			lspconfig.elmls.setup({
				capabilities = capabilities,
			})
			lspconfig.gleam.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowrk", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
			})
			lspconfig.jsonls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,

				cmd = { "bundle", "exec", "ruby-lsp" },
				filetypes = { "ruby" },
				root_dir = util.root_pattern("Gemfile", ".git"),
				init_options = {
					enabledFeatures = enabled_features,
				},
				settings = {},

				commands = {
					FormatRuby = {
						function()
							vim.lsp.buf.format({
								name = "ruby_lsp",
								async = true,
							})
						end,
						description = "Format using ruby-lsp",
					},
				},
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				diagnostic = {
					refreshSupport = false,
				},
				settings = {
					["rust-analyzer"] = {},
				},
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
		dependencies = { "nvimdev/lspsaga.nvim" },
	},
}
