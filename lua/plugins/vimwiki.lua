return {
	{
		"vimwiki/vimwiki",
		init = function()
			-- Vimwiki must know about your wikis before it loads
			vim.g.vimwiki_list = { {
				path = "~/vimwiki/",
				syntax = "markdown",
				ext = ".md",
			} }
			vim.g.vimwiki_browser = "cmd.exe /C start brave.exe" -- Doesn't work
		end,
	},
}
