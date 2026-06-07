return {
	{
		"vimwiki/vimwiki",
		init = function()
			-- Vimwiki must know about your wikis before it loads
			vim.g.vimwiki_list = { {
				path = "~/vimwiki/",
				syntax = "default",
				ext = ".wiki",
			} }
		end,
	},
}
