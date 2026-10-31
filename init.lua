require("plugins")
require("options")
require("config.lsp")
require("telescope").load_extension("vimwiki")

local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn["plug#"]

-- Vimwiki Search
vim.keymap.set('n', '<leader>vs', ':VimwikiSearch /', { desc = 'Vimwiki Search (manual pattern)' })

-- Search for word under cursor
vim.keymap.set('n', '<leader>vcs', function()
  local cword = vim.fn.expand('<cword>')
  vim.cmd('VimwikiSearch /' .. cword .. '/')
end, { desc = 'Vimwiki Search word under cursor' })

-- Navigate Location List (standard for VimwikiSearch)
vim.keymap.set('n', '<C-n>', ':lnext<CR>', { silent = true, desc = "Next search result" })
vim.keymap.set('n', '<C-p>', ':lprev<CR>', { silent = true, desc = "Previous search result" })

-- Toggle the search results window open/closed
vim.keymap.set('n', '<leader>lo', ':lopen<CR>', { silent = true, desc = "Open search list" })
vim.keymap.set('n', '<leader>lc', ':lclose<CR>', { silent = true, desc = "Close search list" })

-- Change Vimwiki Headers to a specific color
vim.api.nvim_set_hl(0, "VimwikiHeader1", { fg = "#88FF00", bold = true })
vim.api.nvim_set_hl(0, "VimwikiHeader2", { fg = "#FFC800", bold = true }) -- Yellow
vim.api.nvim_set_hl(0, "VimwikiHeader3", { fg = "#49E35F", bold = true }) -- Green
vim.api.nvim_set_hl(0, "VimwikiHeader4", { fg = "#FFB400", bold = true }) -- Orange
vim.api.nvim_set_hl(0, "VimwikiHeader5", { fg = "#C300FF", bold = true }) -- Purple
vim.api.nvim_set_hl(0, "VimwikiHeader6", { fg = "#94695A", bold = true }) -- Red/Brown

-- Change styled text colors
vim.api.nvim_set_hl(0, "VimwikiBold", { fg = "#FF00A6", bold = true })
vim.api.nvim_set_hl(0, "VimwikiItalic", { fg = "#096961", italic = true })

-- Change link color
vim.api.nvim_set_hl(0, "VimwikiLink", { fg = "#00dfff", underline = true })
