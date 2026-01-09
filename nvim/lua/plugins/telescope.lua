return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = (vim.fn.executable("make") == 1) and "make"
        or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      cond = function()
        return vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules/", "%.git/", "dist/", "build/", "coverage/", "target/" },
        layout_strategy = "vertical",
        layout_config = { height = 0.95 },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })
    pcall(telescope.load_extension, "fzf")
  end,
}

