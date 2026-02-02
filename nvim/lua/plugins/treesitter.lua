return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
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
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
        },
      },
    })

    -- Explicit keymaps for function navigation
    local ts_move = require("nvim-treesitter.textobjects.move")
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      ts_move.goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next function" })
    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      ts_move.goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Previous function" })
  end,
}
