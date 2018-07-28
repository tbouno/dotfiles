if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

" プラグイン以外のその他設定が続く


"-------基本設定--------
"タイトルをバッファ名に変更しない
set notitle
set shortmess+=I

"ターミナル接続を高速にする
set ttyfast

"ターミナルで256色表示を使う
set t_Co=256

if has ("viminfo")
"フォールド設定(未使用)
"set foldmethod=indent
set foldmethod=manual
"set foldopen=all
"set foldclose=all
endif

"複数ファイルの編集を可能にする
set hidden

"内容が変更されたら自動的に再読み込み
set autoread

"Swapを作るまでの時間m秒
set updatetime=0

"Unicodeで行末が変になる問題を解決
set ambiwidth=double

"行間をでシームレスに移動する
"set whichwrap+=h,l,<,>,[,],b,s

"カーソルを常に画面の中央に表示させる
"set scrolloff=999

"バックスペースキーで行頭を削除する
set backspace=indent,eol,start

"カッコを閉じたとき対応するカッコに一時的に移動
set nostartofline

"C-X,C-Aを強制的に10進数認識させる
set nrformats=
"set nrformats=alpha

"titleを変更しない
set notitle

"コマンドラインでTABで補完できるようにする
set wildchar=<C-Z>

"改行後に「Backspace」キーを押すと上行末尾の文字を1文字消す
set backspace=2

"C-vの矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

"コマンド、検索パターンを50まで保存
set history=500

"履歴に保存する各種設定
set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!

"バックアップを作成しない
set nobackup

"-------Search--------
"インクリメンタルサーチを有効にする
set incsearch

"大文字小文字を区別しない
set ignorecase

"大文字で検索されたら対象を大文字限定にする
set smartcase

"行末まで検索したら行頭に戻る
set wrapscan

"-------Format--------
"自動インデントを有効化する
set smartindent
set autoindent

"フォーマット揃えをコメント以外有効にする
set formatoptions-=c

"括弧の対応をハイライト
set showmatch

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ターミナル上からの張り付けを許可
"set paste

"http://peace-pipe.blogspot.com/2006/05/vimrc-vim.html
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab

"-------Look&Feel-----
"TAB,EOFなどを可視化する
set list
set listchars=tab:>-,extends:<,trail:-,eol:<

"検索結果をハイライトする
set hlsearch

"ルーラー,行番号を表示
set ruler
set number

"コマンドラインの高さ
set cmdheight=1

"マクロなどの途中経過を描写しない
set lazyredraw

"カーソルラインを表示する
set cursorline

"ウインドウタイトルを設定する
set title

"自動文字数カウント
augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

"ステータスラインにコマンドを表示
set showcmd
"ステータスラインを常に表示
set laststatus=2
"ファイルナンバー表示
set statusline=[%n]
"ホスト名表示
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"ファイル名表示
set statusline+=%<%F
"変更のチェック表示
set statusline+=%m
"読み込み専用かどうか表示
set statusline+=%r
"ヘルプページなら[HELP]と表示
set statusline+=%h
"プレビューウインドウなら[Prevew]と表示
set statusline+=%w
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y
"ここからツールバー右側
set statusline+=%=
"skk.vimの状態
set statusline+=%{exists('*SkkGetModeStr')?SkkGetModeStr():''}
"文字バイト数/カラム番号
set statusline+=[%{col('.')-1}=ASCII=%B,HEX=%c]
"現在文字列/全体列表示
set statusline+=[C=%c/%{col('$')-1}]
"現在文字行/全体行表示
set statusline+=[L=%l/%L]
"現在のファイルの文字数をカウント
set statusline+=[WC=%{exists('*WordCount')?WordCount():[]}]
"現在行が全体行の何%目か表示
set statusline+=[%p%%]
"レジスタの中身を表示
"set statusline+=[RG=\"%{getreg()}\"]

"-------エンコード------
"エンコード設定
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

"ファイルタイプに応じて挙動,色を変える
syntax on
filetype plugin on
filetype indent on


" 検索結果のハイライトと取り消し
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>

" インサートモードから抜ける時に便利なキーバインド時に便利なキーバインド
inoremap <silent> jj <ESC>

" 全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" set clipboard=unnamed,autoselect

