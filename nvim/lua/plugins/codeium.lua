return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()

    -- Accept suggestion with Tab
    vim.keymap.set("i", "<Tab>", function()
      if neocodeium.visible() then
        neocodeium.accept()
      else
        return "<Tab>"
      end
    end, { expr = true, silent = true })

    -- Cycle through suggestions
    vim.keymap.set("i", "<M-]>", neocodeium.cycle_or_complete)     -- Alt+]
    vim.keymap.set("i", "<M-[>", function()                         -- Alt+[
      neocodeium.cycle_or_complete(-1)
    end)

    -- Clear suggestion
    vim.keymap.set("i", "<M-c>", neocodeium.clear)                  -- Alt+c
  end,
}
