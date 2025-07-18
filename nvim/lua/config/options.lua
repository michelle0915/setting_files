vim.opt.shellslash = true

-- 自動生成ファイルを生成しない
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.viminfo = ''
vim.opt.undofile = false
vim.opt.hidden = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'cp932', 'sjis' }

-- ウィンドウ表示設定
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.showtabline = 3
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.scrolloff = 2
vim.opt.textwidth = 0
vim.opt.startofline = false
vim.opt.termguicolors = true
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.re = 0

vim.opt.list = false
vim.opt.listchars = { tab = '>-', trail = '-' }

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.helplang = 'ja'

-- 対応括弧のペアを追加
vim.opt.matchpairs:append '<:>'
vim.opt.matchpairs:append '（:）'
vim.opt.matchpairs:append '【:】'
vim.opt.matchpairs:append '「:」'

-- vim.opt.iskeyword = ''
vim.opt.nrformats = ''

-- ビープ音を消す
vim.opt.visualbell = false

-- netrw.vim設定
vim.g.netrw_altfile = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_timefmt = '%Y/%m/%d(%a) %H:%M:%S'
vim.g.netrw_winsize = 30
vim.g.netrw_preview = 1
--let g:netrw_list_hide  = '\(^\|\s\s\)\zs\.\S\+'
--let g:netrw_altv  =  0
--let g:netrw_alto  =  0
--vim.g.netrw_chgwin = 2
vim.g.netrw_keepdir = 1

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = 'unnamed'

vim.g.clipboard = {
  name = 'myClipboard',
  copy = {
    ['+'] = 'win32yank.exe -i',
    ['*'] = 'win32yank.exe -i',
  },
  paste = {
    ['+'] = 'win32yank.exe -o',
    ['*'] = 'win32yank.exe -o',
  },
  cache_enabled = 1,
}

-- Float の背景透過
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })

-- VirtualText の背景透過
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn",  { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo",  { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint",  { bg = "none" })
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度
