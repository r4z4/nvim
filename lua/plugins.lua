-- nvim/lua/plugins.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- zz to save in both modes
vim.cmd("inoremap zz <Esc>:update<cr>gi")
vim.cmd("nnoremap zz :update<cr>")
-- This will override the h register
vim.cmd("vnoremap <C-r> hy:%s/<C-r>h//gc<left><left><left>")

vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to void register" })
vim.keymap.set("n", "<leader>dd", '"_dd', { desc = "Delete to void register" })

-- Clear highlights from search
vim.keymap.set("n", "<C-c>", ":noh<CR>")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- Close lazy w/ ESC
local user_grp = vim.api.nvim_create_augroup("LazyUserGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lazy",
	desc = "Quit lazy with <esc>",
	callback = function()
		vim.keymap.set("n", "<esc>", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = true, nowait = true })
	end,
	group = user_grp,
})

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins/")
