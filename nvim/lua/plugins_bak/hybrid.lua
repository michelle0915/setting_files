return {
  'w0ng/vim-hybrid',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd('colorscheme hybrid')
    vim.opt.background = 'dark'
  end,
}
