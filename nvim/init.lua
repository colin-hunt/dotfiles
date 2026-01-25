require("config.lazy")
require("config.keymaps")

-- UI
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs = 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Tree-sitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldtext = ""
vim.opt.fillchars:append({ fold = "·" })
vim.opt.foldcolumn = "1"

-- Dim line numbers, emphasize folded lines
vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c6370" })
vim.api.nvim_set_hl(0, "Folded", { bg = "#2c323c", bold = true })

