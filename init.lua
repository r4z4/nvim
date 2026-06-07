require("plugins")
require("options")
require("config.lsp")

local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn["plug#"]

-- Change Vimwiki Header 1 to a specific color
vim.api.nvim_set_hl(0, "VimwikiHeader1", { fg = "#E100FF", bold = true })

-- Change Vimwiki Header 2 to a different color
vim.api.nvim_set_hl(0, "VimwikiHeader2", { fg = "#00dfff", bold = true })

-- Give bold text a bright foreground
vim.api.nvim_set_hl(0, "VimwikiBold", { fg = "#ffff00", bold = true })

-- Change link color
vim.api.nvim_set_hl(0, "VimwikiLink", { fg = "#0073FF", underline = true })
