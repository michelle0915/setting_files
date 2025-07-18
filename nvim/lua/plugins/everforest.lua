return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.everforest_background = 'hard'
    vim.opt.background = 'dark'
    vim.cmd("colorscheme everforest")
  end,
}
