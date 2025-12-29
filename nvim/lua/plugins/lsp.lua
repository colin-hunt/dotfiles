return {
  {
    "mason-org/mason.nvim",
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "pyright",
        "jsonls",
        "html",
      },
      automatic_installation = true,
    },
  },
  { "neovim/nvim-lspconfig" },
}
