return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "FF", function() require("telescope.builtin").find_files() end },
    { "FR", function() require("telescope.builtin").live_grep() end },
    { "FH", function() require("telescope.builtin").buffers() end },
  },
  config = function()
    require('telescope').setup{
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        file_ignore_patterns = {
          "%.git/",
          "%venv",
          "%node_modules",
          "%__py_cache__",
        },
      },
    }
  end,
}
