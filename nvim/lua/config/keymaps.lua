-- 基本操作キーマップ
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<c-d>', ':q<cr>', opts)
vim.keymap.set('n', '<c-c>', '<esc>:nohlsearch<cr>', opts)
vim.keymap.set('n', '<c-z>', '<nop>', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('x', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('x', 'k', 'gk', opts)
vim.keymap.set('', '<c-h>', '^', opts)
vim.keymap.set('', '<c-l>', '$', opts)
vim.keymap.set('', '<c-e>', '2<c-e>', opts)
vim.keymap.set('', '<c-y>', '2<c-y>', opts)
vim.keymap.set('n', '<c-u>', '<c-r>', opts)
vim.keymap.set('n', '<c-k>', ':lua Highlight()<cr>:set hlsearch<cr>', opts)
vim.keymap.set('n', '<c-n>', '%', opts)
vim.keymap.set('v', '<c-n>', '%', opts)
vim.keymap.set('n', '<c-z>', ':stop<cr>', opts)

--x でヤンクしない
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('v', 'x', '"_x', opts)
vim.keymap.set('n', 'X', '"_X', opts)
vim.keymap.set('v', 'X', '"_X', opts)

-- leader
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>l', ':ls<cr>', opts)
vim.keymap.set('n', '<leader>w', ':w<cr>', opts)

vim.keymap.set('n', 'BB', ':b#<cr>', opts)
vim.keymap.set('n', 'BN', ':bnext<cr>', opts)
vim.keymap.set('n', 'BP', ':bprevious<cr>', opts)

-- 大文字・小文字変換
vim.keymap.set('n', 'gu', 'gUiw', opts)
vim.keymap.set('n', 'gl', 'guiw', opts)

vim.keymap.set('n', 'gp', ':echo expand("%:p")<cr>', opts)

-- 入力中キーバインド
vim.keymap.set('i', '<c-f>', '<right>', opts)
vim.keymap.set('i', '<c-b>', '<left>', opts)
vim.keymap.set('i', '<c-d>', '<del>', opts)
vim.keymap.set('i', '<c-t>', '<c-v><tab>', opts)
vim.keymap.set('i', '<c-c>', '<esc>', opts)

-- 括弧入力補完
vim.keymap.set('i', '(', '()<left>', opts)
vim.keymap.set('i', '[', '[]<left>', opts)
vim.keymap.set('i', '{', '{}<left>', opts)
vim.keymap.set('i', '"', '""<left>', opts)
vim.keymap.set('i', '\'', '\'\'<left>', opts)

vim.keymap.set('i', '{<cr>', '{}<left><cr><esc><s-o>', opts)
vim.keymap.set('i', '[<cr>', '[]<left><cr><esc><s-o>', opts)

vim.g.selectAfterWrap = 0
vim.keymap.set('v', '(', '<esc>:lua Wrap("(", ")")<cr>', opts)
vim.keymap.set('v', '[', '<esc>:lua Wrap("[", "]")<cr>', opts)
vim.keymap.set('v', '{', '<esc>:lua Wrap("{", "}")<cr>', opts)
vim.keymap.set('v', '"', '<esc>:lua Wrap("\\"", "\\"")<cr>', opts)
vim.keymap.set('v', "'", '<esc>:lua Wrap("\'", "\'")<cr>', opts)
vim.keymap.set('v', 's', '<esc>:lua Wrap(" ", " ")<cr>', opts)

vim.keymap.set('v', '*', ':<c-u>lua Vsearch()<cr>/<c-r>=@/<cr><cr>', opts)
function Vsearch()
  local tmp = vim.fn.getreg('"s')
  vim.cmd('normal! gv"sy')

  local text = vim.fn.getreg('s')
  text = vim.fn.escape(text, '/\\')
  text = text:gsub('\n', '\\n')
  vim.fn.setreg('/', '\\V' .. text)

  vim.fn.setreg('s', tmp)
end

-- ファイルフォーマットを改行コードに変換
function GetFileFormat()
  local ff = vim.bo.fileformat
  if ff == 'unix' then
    return 'LF'
  elseif ff == 'dos' then
    return 'CRLF'
  elseif ff == 'mac' then
    return 'CR'
  else
    return 'unknown'
  end
end

-- 選択範囲の文字列を取得
function GetSelectedString()
    local ret = ''
    local tmp = vim.fn.getreg('"')
    vim.cmd('normal! gvy')
    ret = vim.fn.getreg('"')
    vim.fn.setreg('"', tmp)
    return ret
end

vim.keymap.set('v', '<', '<esc>:lua Indent("<")<cr>', opts)
vim.keymap.set('v', '>', '<esc>:lua Indent(">")<cr>', opts)

function Indent(key)
  local mode = vim.fn.visualmode()
  if mode == 'V' then
    vim.cmd('normal! gv' .. key .. 'gv')
  else
    vim.cmd('normal! ' .. key)
  end
end

-- 指定の文字で選択範囲を囲む
function Wrap(prefix, suffix)
  vim.cmd('normal! `>')
  vim.cmd('normal! a' .. suffix)
  vim.cmd('normal! `<')
  vim.cmd('normal! i' .. prefix)
end

-- カーソル位置の単語をハイライト（*の移動しない版）
function Highlight()
  local tmp = vim.fn.getreg('"')
  vim.cmd('normal! viwy')
  vim.fn.setreg('/', '\\<' .. vim.fn.getreg('"') .. '\\>')
  vim.fn.setreg('"', tmp)
end

-- コメントアウト
function CommentOut(commentString)
  vim.cmd('normal! ^i' .. commentString .. ' ')
end

-- コメントアウト解除
function UnCommentOut(commentString)
  local tmp = vim.fn.getreg('"')

  local line = vim.api.nvim_get_current_line()
  local pattern = [[^\s*]] .. vim.fn.escape(commentString, [[\]])
  if not string.find(line, pattern) then
    return
  end

  local delete_count = #commentString + 1
  vim.cmd('normal! ^' .. string.rep('x', delete_count))

  vim.fn.setreg('"', tmp)
end

function FiletypeCommentStr()
  local ft = vim.bo.filetype
  local map = {
    vim = '"', lua = '--', lisp = ';',
    c = '//', java = '//', javascript = '//',
    typescript = '//', typescriptreact = '//',
    php = '//', go = '//',
    sh = '#', perl = '#', python = '#',
  }
  return map[ft] or '#'
end

vim.keymap.set('n', '-', ':lua CommentOut(FiletypeCommentStr())<cr>', opts)
vim.keymap.set('n', '+', ':lua UnCommentOut(FiletypeCommentStr())<cr>', opts)

-- 各種言語用設定
-- autocmd BufRead,BufNewFile *.jsx :setlocal filetype=javascriptreact
-- autocmd BufRead,BufNewFile *.tsx :setlocal filetype=typescriptreact

-- オムニ補完
--autocmd FileType *
--\   if &l:omnifunc == ''
--\ |   setlocal omnifunc=syntaxcomplete#Complete
--\ | endif

vim.opt.guicursor = {
  "n-v-c:block",     -- ノーマル/ビジュアル/コマンドモード: ブロック
  "i-ci:ver25",      -- 挿入・カーソル移動: 縦棒（25%の太さ）
  "r-cr:hor20",      -- 置換モード: 横線（20%の太さ）
}

if vim.fn.system('uname -a'):match('microsoft') then
  vim.api.nvim_create_augroup('myYank', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = 'myYank',
    pattern = '*',
    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
  })
end
