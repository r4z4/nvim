return {
	{
		"ElPiloto/telescope-vimwiki.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>vwfg", ":Telescope vimwiki live_grep<CR>", {})
			vim.keymap.set("n", "<leader>vwff", ":Telescope vimwiki<CR>", {})
		end,
	},
}
