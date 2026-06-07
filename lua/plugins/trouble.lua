local prefix = "<leader>x"

return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Touble" },
	keys = {
		{ prefix, desc = "Trouble" },
		{ prefix .. "X", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
		{ prefix .. "x", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Document Diagnostics" },
		{ prefix .. "q", "<cmd>Trouble qflist toggle<CR>", desc = "QuickFix List (Trouble)" },
	},
	opts = {
		use_diagnostic_signs = true,
		action_keys = {
			close = { "q", "<esc>" },
			cancel = "<c-e>",
		},
	},
}
