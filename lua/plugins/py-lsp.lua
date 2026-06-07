return {
	"HallerPatrick/py_lsp.nvim",
	dependencies = { "dharmx/toml.nvim" },
	config = function()
		require("py_lsp").setup({
			host_python = "/home/ar3rz/miniconda3/lib/python3.11",
			default_venv_name = "tf_orig",
		})
	end,
}
