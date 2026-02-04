return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gwrite", "Gread", "Gdiffsplit", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "[g]it [s]tatus" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "[g]it [c]ommit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "[g]it [p]ush" },
    { "<leader>gP", "<cmd>Git pull<cr>", desc = "[g]it [P]ull" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "[g]it [b]lame" },
    { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "[g]it [l]og" },
  },
}
