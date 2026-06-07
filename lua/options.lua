-- nvim/lua/options.lua
-- assign leader key to space
-- you can then think of <leader> in keybindings as space

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = "a"

-- Delete not cut. "_d -> Blackhole register
vim.keymap.set("n", "d", '"_d')
-- vim.keymap.set('n', '<bs>', '"_d')
-- vim.api.nvim_set_option("clipboard", "unnamed")
-- vim.opt.clipboard = "unnamed,unnamedplus"

vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {

		group = vim.api.nvim_create_augroup("Yank", { clear = true }),

		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end

-- Panicked because I was in VIM and did not have this, but I guess this is a different way to do it.
-- local is_wsl = vim.fn.system("uname -r"):find("WSL")
-- if is_wsl then
-- 	vim.g.clipboard = {
-- 		name = "WslClipboard",
-- 		copy = {
-- 			["+"] = { "clip.exe" },
-- 			["*"] = { "clip.exe" },
-- 		},
-- 		paste = {
-- 			["+"] = {
-- 				"/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe",
-- 				"-c",
-- 				'[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 			},
-- 			["*"] = {
-- 				"/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe",
-- 				"-c",
-- 				'[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
-- 			},
-- 		},
-- 		cache_enabled = false,
-- 	}
-- end
