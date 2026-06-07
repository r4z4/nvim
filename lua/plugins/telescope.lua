return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
				{}
			)
			vim.keymap.set("n", "<leader>tF", ":Telescope treesitter<CR>", {})
			vim.keymap.set("n", "<leader>gC", ":Telescope git_commits<CR>", {})
			vim.keymap.set("n", "<leader>gS", ":Telescope git_status<CR>", {})
			vim.keymap.set("n", "<leader>gH", ":Telescope git_stash<CR>", {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, {}, { desc = "LSP Rename" })
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"
			)
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("live_grep_args")
		end,
	},
	{
		"jemag/telescope-diff.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("telescope").load_extension("diff")
			vim.keymap.set("n", "<leader>sC", function()
				require("telescope").extensions.diff.diff_files({ hidden = true })
			end, { desc = "Compare 2 files" })

			vim.keymap.set("n", "<leader>sc", function()
				require("telescope").extensions.diff.diff_current({ hidden = true })
			end, { desc = "Compare file with current" })
		end,
	},
}
