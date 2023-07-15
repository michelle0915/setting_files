set shellslash

" ウインドウの幅
"set columns=100
" ウインドウの高さ
"set lines=50

" 自動生成ファイルを生成しない
set noswapfile
set nobackup
set viminfo=
set noundofile
set hidden

set encoding=utf-8
set fileencodings=utf-8,cp932,sjis

" ウィンドウ表示設定
set showcmd
set number
set hlsearch
set showtabline=3
set expandtab
set tabstop=2
set shiftwidth=2
set nowrap
set cursorline
set cursorcolumn
set scrolloff=2
set textwidth=0
set nostartofline
"set clipboard+=autoselect
"set clipboard&
"set clipboard^=unnamedplus
set termguicolors
set backspace=indent,eol,start
set re=0

set nolist
set listchars=tab:>-,trail:-

set ignorecase
set smartcase
set incsearch

set helplang=ja

" 対応括弧のペアを追加
set matchpairs&
set matchpairs+=<:>
set matchpairs+=（:）
set matchpairs+=【:】
set matchpairs+=「:」

set iskeyword&

" ビープ音を消す
set vb t_vb=

" 貼り付けモード切り替え（インデント、自動補完防止）
set pastetoggle=<f3>

" 基本操作キーマップ
nnoremap <silent> <c-d> :q<cr>
nnoremap <silent> <c-c> <esc>:nohlsearch<cr>
noremap <c-z> <nop>
nnoremap j gj
xnoremap j gj
nnoremap k gk
xnoremap k gk
noremap <c-h> ^
noremap <c-l> $
noremap <c-e> 2<c-e>
noremap <c-y> 2<c-y>
nnoremap <c-u> <c-r>
"noremap <silent> <c-k> "zyiw:let @/ = '\<' . @z . '\>'<cr>:set hlsearch<cr>
nnoremap <silent> <c-k> :call Highlight()<cr>:set hlsearch<cr>
noremap <c-n> %
nnoremap <c-z> :stop<cr>

"x でヤンクしない
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X

" クリップボードコピー＆ペースト
vnoremap <c-s-y> "*y
nnoremap <c-s-p> "*p

" leader
let mapleader="\<space>"
nnoremap <leader>s :set 
nnoremap <leader>g :vimgrep  **/*<left><left><left><left><left>
nnoremap <leader>l :ls<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>o :tabnew<cr>:e 

nnoremap BB :b#<cr>
nnoremap BN :bnext<cr>
nnoremap BP :bprevious<cr>

"noremap , <nop>
"nnoremap <silent> ,w :set wrap!<cr>
"nnoremap <silent> ,l :set list!<cr>
"nnoremap <silent> ,n :set number!<cr>
"nnoremap <silent> ,t :set expandtab!<cr>

noremap <f1> :tabnew<cr>:help function-list<cr><c-w>w:q<cr>
" vimrcを開く
noremap <f2> :tabnew<cr>:e ~/.vimrc<cr>

" 画面分割、タブ関連
"nnoremap sn gt
"nnoremap sp gT

" 大文字・小文字変換
nnoremap gu gUiw
nnoremap gl guiw

nnoremap <silent> <s-down> :call MoveLine("DOWN")<cr>
nnoremap <silent> <s-up> :call MoveLine("UP")<cr>
vnoremap <silent> <s-down> <esc>:call MoveMultiLine("DOWN")<cr>
vnoremap <silent> <s-up> <esc>:call MoveMultiLine("UP")<cr>

noremap <c-up> <c-b>
noremap <c-down> <c-f>
noremap <c-right> 3zl
noremap <c-left> 3zh

nnoremap gp :echo expand('%:p')<cr>

" 入力中キーバインド
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-d> <del>
inoremap <c-t> <c-v><tab>
inoremap <c-c> <esc>
 
" 括弧入力補完
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>

inoremap {<cr> {}<left><cr><esc><s-o>
inoremap [<cr> []<left><cr><esc><s-o>

let g:selectAfterWrap = 0
vnoremap ( <esc>:call Wrap("(", ")")<cr>
vnoremap [ <esc>:call Wrap("[", "]")<cr>
vnoremap { <esc>:call Wrap("{", "}")<cr>
vnoremap < <esc>:call Wrap("<", ">")<cr>
vnoremap " <esc>:call Wrap("\"", "\"")<cr>
vnoremap ' <esc>:call Wrap("\'", "\'")<cr>
vnoremap s <esc>:call Wrap(" ", " ")<cr>

"vnoremap * y/<c-r>"<cr>
vnoremap * :<c-u>call Vsearch()<cr>/<c-r>=@/<cr><cr>
function! Vsearch()
    let tmp = @s
    normal! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = tmp
endfunction

" vimgrep設定
autocmd QuickFixCmdPre vimgrep tabnew
autocmd QuickFixCmdPost vimgrep cwindow

let ignore_list  = ',**/.git/**,**/.svn/**,**/obj/**'
let ignore_list .= ',**/node_modules/**'
let ignore_list .= ',tags,GTAGS,GRTAGS,GPATH'
let ignore_list .= ',*.o,*.obj,*.exe,*.dll,*.bin,*.so,*.a,*.out,*.jar,*.pak'
let ignore_list .= ',*.zip,*gz,*.xz,*.bz2,*.7z,*.lha,*.lzh,*.deb,*.rpm,*.iso'
let ignore_list .= ',*.pdf,*.png,*.jp*,*.gif,*.bmp,*.mp*'
let ignore_list .= ',*.od*,*.doc*,*.xls*,*.ppt*'

if exists('+wildignore')
	autocmd QuickFixCmdPre  * execute 'setlocal wildignore+=' . ignore_list
	autocmd QuickFixCmdPost * execute 'setlocal wildignore-=' . ignore_list
endif

" 自作コマンド読み込み
":source $VIM/_mycommand.vim

" netrw.vim設定
let g:netrw_altfile=1
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
let g:netrw_winsize=30
let g:netrw_preview=1
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
"let g:netrw_altv = 0
"let g:netrw_alto = 0
let g:netrw_chgwin=2
let g:netrw_keepdir=0

" netrw refresh無効化(<c-l>にバインド)
function! ExampleUserMap(islocal)
  return 0
endfunction

function! OpenMultiWindow(islocal)
    execute "bel vnew"
    execute "bel terminal"
    call RestoreWindowSize(0)
endfunction

function! RestoreWindowSize(islocal)
    execute "normal! \<c-w>1w\<c-w>50|"
    execute "normal! \<c-w>3w\<c-w>10_"
    execute "normal! \<c-w>1w"
endfunction

let g:Netrw_UserMaps= [["<c-l>","RestoreWindowSize"], ["<c-i>","OpenMultiWindow"]]

noremap <F9> :tabnew<cr>:e .<cr>

" 最下ウィンドウにステータスバーを常に表示する
set laststatus=2
 
" ステータスバーの内容
"set statusline=%1*
set statusline =
set statusline+=\ [%n]                                     " バッファ番号
set statusline+=\ %<%t                                     " ファイル名
set statusline+=%r%H%W%m                                   " ファイルステータス
"set statusline+=\ [Type:%{strlen(&ft)?&ft:'unknown'}]      " ファイルタイプ
set statusline+=\ [Enc/Fmt:%{strlen(&fenc)?&fenc:'unknown'}/%{GetFileFormat()}]   " ファイルエンコーディング/ファイルフォーマット( 改行コード )
set statusline+=\ %{&bomb?'[BOM]':''}                      " BOM の有無
set statusline+=%=                                         " 以下、右寄せで表示
set statusline+=\ [Ascii:%03b/0x%02B]                             " ASCII コード ( 10進/16進 )
"set statusline+=\ [Pos:%03v\ %l/%L]                        " カーソル位置の列 / 行、全行数
set statusline+=\ [Line:%l/%L\ Col:%c]                             " カーソル位置の列 / 行、全行数
set statusline+=\                                          " パディング
 
" ファイルフォーマットを改行コードに変換
function! GetFileFormat()
    if &ff == 'unix'
        return 'LF'
    elseif &ff == 'dos'
        return 'CRLF'
    elseif &ff == 'mac'
        return 'CR'
    else
        return 'unknown'
    endif
endfunction

" 選択範囲の文字列を取得
function! GetSelectedString()

    let ret = ""
    let tmp = @@
    execute "normal! gvy"
    let ret = @@
    let @@ = tmp

    return ret
endfunction

" 25%/75%の位置に移動できる
" 着地点を予測しにくいため、使い勝手がイマイチ
function! ThreeQuarter(pos)
    execute "normal! H"
    let rowH = line('.')
    execute "normal! L"
    let rowL = line('.')
    execute "normal! M"
    let rowM = line('.')

    let rowMH = ( rowH + rowM ) / 2
    let rowML = ( rowL + rowM ) / 2

    if a:pos == "h"
        execute "normal! " . rowMH . "G"
    else
        execute "normal! " . rowML . "G"
    endif
endfunction

" 指定の文字で選択範囲を囲む
function! Wrap(prefix, suffix)

    " 行選択中に<が入力された場合のみ、元のインデント処理を実行
    if a:prefix == '<' && visualmode() ==# 'V'
        execute 'normal! gv<'
        return
    endif

    execute "normal! `>"
    execute "normal! a" . a:suffix . "\<esc>"
    let sufline = line('.')
    let suflength = strchars(a:suffix)

    execute "normal! `<"
    execute "normal! i" . a:prefix . "\<esc>"
    let prefline = line('.')
    let preflength = strchars(a:prefix)
    
    " 文字挿入後に範囲選択をするかどうか
    if g:selectAfterWrap == 0
        return
    endif

    let cursorshift = 0
    if prefline == sufline
        let cursorshift = preflength + suflength
    else
        let cursorshift = suflength
    endif

    execute "normal! `<v`>" . repeat('l', cursorshift)

endfunction

" カーソル位置の単語をハイライト（*の移動しない版）
function! Highlight()
    let tmp = @@

    execute "normal! viwy"
    let @/ = '\<' . @@ . '\>'
"    なぜか反応しない、呼び出し元で実行（妥協）
"    set hlsearch

    let @@ = tmp
endfunction

" コメントアウト
function! CommentOut(commentString)
    execute "normal! ^i" . a:commentString . " \<esc>"
endfunction

" コメントアウト解除
function! UnCommentOut(commentString)
    let tmp = @@

    let line = getline('.')
    if match(line, '^\s*'.a:commentString." ") == -1
        return
    endif

    execute "normal! ^" . repeat("x", len(a:commentString." "))

    let @@ = tmp
endfunction

" 複数行コメントアウト/解除
function! CommentOutMultiLine(commentString)
    call MultiLineCall('CommentOut', [a:commentString])
endfunction

function! UnCommentOutMultiLine(commentString)
    call MultiLineCall('UnCommentOut', [a:commentString])
endfunction

function! FiletypeCommentStr()
    if &ft == 'vim'
        return '"'
    elseif &ft == 'lisp'
        return ';'
    elseif &ft == 'c' || &ft == 'java' || &ft == 'javascript' || &ft == 'typescript' || &ft == 'typescriptreact' || &ft == 'php' || &ft == 'go'
        return '//'
    elseif &ft == 'sh' || &ft == 'perl' || &ft == 'python'
        return '#'
    else
        return '#'
    endif
endfunction

nnoremap <silent> - :call CommentOut(FiletypeCommentStr())<cr>
nnoremap <silent> + :call UnCommentOut(FiletypeCommentStr())<cr>
vnoremap <silent> - <esc>:call CommentOutMultiLine(FiletypeCommentStr())<cr>gv
vnoremap <silent> + <esc>:call UnCommentOutMultiLine(FiletypeCommentStr())<cr>gv

" 行移動
function! MoveLine(direction)
    let tmp = @@

    let currentLine = line(".")
    let minLine = 1
    let maxLine = line("$")

    "下移動
    if a:direction == "DOWN"
        if currentLine == maxLine
            "最下行の場合、下に新たに空行を追加して移動
            execute "normal! ddo\<ESC>p"
        else
            execute "normal! ddp"
        endif

    "上移動
    elseif a:direction == "UP"
        if currentLine == minLine
            "最上行の場合、何もしない
            return
        elseif currentLine == maxLine
            "最下行の場合、カーソル行が上にずれるため、kが必要無い
            execute "normal! ddP"
        else
            execute "normal! ddkP"
        endif
    endif

    let @@ = tmp
endfunction

" 複数行移動
function! MoveMultiLine(direction)
    let tmp = @@

    let minLine = 1
    let maxLine = line("$")

    execute "normal! `<"
    let topLine = line('.')
    execute "normal! `>"
    let bottomLine = line('.')

    "下移動
    if a:direction == "DOWN"
        if bottomLine == maxLine
            "最下行の場合、下に新たに空行を追加して移動
            execute "normal! `<V`>do\<ESC>p`[V`]"
        else
            execute "normal! `<V`>dp`[V`]"
        endif

    "上移動
    elseif a:direction == "UP"
        if topLine == minLine
            "最上行の場合、何もしない
            execute "normal! `<V`>"
            return
        elseif bottomLine == maxLine
            "最下行の場合、カーソル行が上にずれるため、kが必要無い
            execute "normal! `<V`>dP`[V`]"
        else
            execute "normal! `<V`>dkP`[V`]"
        endif
    endif

    let @@ = tmp
endfunction

" 複数行にわたる関数実行
function! MultiLineCall(funcName, args)
    execute "normal! `<"
    let startLine = line('.')
    execute "normal! `>"
    let endLine = line('.')

    let Fn = function(a:funcName, a:args)

    for eachLine in range(startLine, endLine)
        execute "normal! " . eachLine . "G"
        call Fn()
    endfor
endfunction

" ある文字を基準に、縦のラインを揃える
function! CharIndent(indexchar) range
    let lnum = a:firstline
    let maxidx = 0
    while lnum <= a:lastline
        let idx = match(getline(lnum), a:indexchar)
        if idx > maxidx
            let maxidx = idx
        endif
        let lnum = lnum + 1
    endwhile

    let lnum = a:firstline
    while lnum <= a:lastline
        let idx = match(getline(lnum), a:indexchar)
        if idx > 0
            let spacenum = maxidx - idx
            let convertedline = substitute(getline(lnum), a:indexchar, repeat(" ", spacenum).a:indexchar, "")
            call setline(lnum, convertedline)
        endif
        let lnum = lnum + 1
    endwhile
endfunction

" カンマ区切り文字列の各要素を一定の幅で表示する
function! FormatCsvLine(width)
    let line = getline('.')
    let items = split(line, ',')

    let newItems = []
    let overWidth = 0

    if line == ''
        continue
    else
        for word in items
            let wordlen = strlen(word)
            if wordlen > a:width
                let overWidth = wordlen
            endif
            call add(newItems, word . repeat(" ", a:width - wordlen))
        endfor
    endif

    call setline('.', join(newItems, ','))
"    if overWidth > 0
"        echohl WarningMsg | echo 'Warning: There are some words which is over the specified width ['.overWidth.'].' | echohl None
"    endif
    return overWidth
endfunction

" 各種言語用設定
autocmd BufRead,BufNewFile *.jsx :setlocal filetype=javascriptreact
autocmd BufRead,BufNewFile *.tsx :setlocal filetype=typescriptreact
autocmd BufRead,BufNewFile *.nml :setlocal filetype=nml

" オムニ補完
"autocmd FileType *
"\   if &l:omnifunc == ''
"\ |   setlocal omnifunc=syntaxcomplete#Complete
"\ | endif

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" タグファイル探索
se tags=.tags;/;

augroup ctags
    autocmd!
    autocmd BufWritePost * call Execute_ctags()
augroup END

function! Execute_ctags() abort
    let tag_name = '.tags'
    let tags_path = findfile(tag_name , '.;')

    if tags_path ==# ''
        return
    endif

    let tags_dirpath = fnamemodify(tags_path, ':p:h')
    execute 'silent !cd ' . tags_dirpath . ' && ctags -R -f ' . tag_name . ' 2> /dev/null &'
endfunction

augroup vimrc_auto_reload
    autocmd!
    autocmd BufWritePost *.vim,*vimrc source ~/.vimrc
augroup END

augroup templates
    autocmd!
    autocmd BufNewFile Dockerfile :0r $HOME/.vim/template/docker/Dockerfile
    autocmd BufNewFile docker-compose.yml :0r $HOME/.vim/template/docker/docker-compose.yml
augroup END

if system('uname -a | grep microsoft') != ''
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath+=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:toml_lazy = s:rc_dir . '/dein_lazy.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

"" lsp for golang
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set completeopt+=menuone


" テーマ
syntax on
filetype plugin indent on
"colorscheme molokai
"colorscheme iceberg
colorscheme hybrid
