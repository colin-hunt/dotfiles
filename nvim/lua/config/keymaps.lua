-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fF", function()
  require("telescope.builtin").find_files({ no_ignore = true, file_ignore_patterns = {} })
end)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "//", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true sorting_strategy=ascending<CR>")
vim.keymap.set("n", "<leader>fE", "<cmd>Telescope file_browser path=%:p:h select_buffer=true sorting_strategy=ascending hidden=true<CR>")

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

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Tree-sitter
vim.keymap.set("n", "<Tab>", "za", { desc = "Toggle fold" })
vim.keymap.set("n", "<leader>zo", "zR", { desc = "Open all folds" })
vim.keymap.set("n", "<leader>zc", "zM", { desc = "Close all folds" })
vim.keymap.set("n", "]z", "zj", { desc = "Next fold" })
vim.keymap.set("n", "[z", "zk", { desc = "Previous fold" })
vim.keymap.set("n", "zT", "[z", { desc = "Top of current fold" })
vim.keymap.set("n", "zB", "]z", { desc = "Bottom of current fold" })

