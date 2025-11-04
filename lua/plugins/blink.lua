return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- or omit to track latest
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    opts = {
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      keymap = { preset = "default", ["<C-Space>"] = { "show" } },
      signature = { enabled = true },
      appearance = { nerd_font_variant = "mono" },
    },
  },
}
