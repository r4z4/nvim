return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = "rounded",
			enable_git_status = true,
		})
		vim.keymap.set("n", "<C-p>h", "<CMD>split<CR>", {})
		vim.keymap.set("n", "<C-p>v", "<CMD>vsplit<CR>", {})
		vim.keymap.set("n", "<C-t>", "<CMD>Neotree toggle<CR>", {})
	end,
}
