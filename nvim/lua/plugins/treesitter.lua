return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    vim.filetype.add({ extension = { tsx = "typescriptreact" } })
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua","javascript","typescript","tsx","json","yaml",
        "bash","markdown","markdown_inline","html","css","regex","python",
      },
      auto_install = true,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = false },
    })
  end,
}
