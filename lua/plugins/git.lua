return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", {})
			vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk)
			vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk)
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
			vim.keymap.set("i", "kj", "<ESC>", {})
		end,
	},
}
