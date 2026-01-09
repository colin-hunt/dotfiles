-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fF", function()
  require("telescope.builtin").find_files({ no_ignore = true, file_ignore_patterns = {} })
end)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "//", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- LSP
local opts = { silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)        -- show diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- already built-in but override to silent
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- list diagnostics

-- Tree-sitter
vim.keymap.set("n", "<leader>z", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<leader>zo", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>zc", "zM", { desc = "Close all folds" })

