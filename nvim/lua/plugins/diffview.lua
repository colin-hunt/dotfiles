return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    {
      "<leader>gd",
      function()
        if next(require("diffview.lib").views) then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle [g]it [d]iffview",
    },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "[g]it file [h]istory" },
  },
  config = function()
    require("diffview").setup({
      view = {
        default = {
          layout = "diff2_vertical",
        },
      },
      hooks = {
        view_opened = function()
          vim.opt.showtabline = 0
        end,
        view_closed = function()
          vim.opt.showtabline = 2
        end,
      },
    })
  end,
}
