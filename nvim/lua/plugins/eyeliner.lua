return {
  "jinh0/eyeliner.nvim",
  event = "VeryLazy",
  config = function()
    require("eyeliner").setup({
      highlight_on_key = true, -- only highlight after pressing f/F/t/T
      dim = true, -- dim all other characters when highlighting
    })
  end,
}
