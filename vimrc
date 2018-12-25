                                      
"set cscope                           
"""                                   
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>

nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"set vim-instant-markdown
"
" -------g:instant_markdown_slow----------------
" -- by default, vim-instant-markdown will 
" -- update the display in realtime, if that
" -- taxes system too much, you can specify it.
" -----------------------------------------------
" 1. no keys have been pressed for a while.
" 2. a while after you leave insert mode.
" 3. you save the file being edited.
" let g:instant_markdown_slow = 1

"append set
"set txt format
"au BufRead,BufNewFile * setfiletype txt

"set tags for stl
"you can set tags for other third aspect library.
set tags+=~/document/ldoc/src/source_code/libev/libev-tags
set tags+=~/document/ldoc/src/source_code/linux-headers-4.15.0-33/linux-tags
" set tags+=~/document/ldoc/src/source_code/glibc-2.2.3/glibc-tags
"set omnicppcomplete
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"set taglist
let Tlist_Show_One_File=1    " 只展示一个文件的taglist
let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
let Tlist_Sort_Type="name"   " tag按名字排序
map <C-l> :TlistToggle<CR>

"set mini buffer explorer size
let g:miniBufExplMaxSize = 2

"set NERDTree
map <C-n> :NERDTree<CR>

"set  pathogen
execute pathogen#infect()

"set the language of help file to Chinese
set helplang=cn

"Show line number, command, status line and so on.
set history=1000
set ruler
set number
set showcmd
set showmode
set laststatus=2
set cmdheight=2
set scrolloff=3
" set linespace=6

"Fill space between windows
set fillchars=stl:\ ,stlnc:\ ,vert:\

"Turn off annoying error sound
set noerrorbells
set novisualbell
set t_vb=

"Turn off splash screen
set shortmess=atI

"syntax and theme
syntax enable
syntax on
colorscheme desert
set background=dark
""""""""""""""""""""""""""""""""""""""""""""""""
""此处语句用于高亮光标所在行列
"set cursorline
"set cursorcolumn
"highlight CursorLine cterm=underline ctermbg=Black 
"highlight CursorColumn cterm=none ctermbg=Black


"Configure backspace to be able to across two lines.
set backspace=2
set whichwrap+=<,>h,l

"Tab and indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set cindent

"Files, backups and encoding
set nobackup
set noswapfile
set autoread
set autowrite
set autochdir
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936,gb18030,gbk,gb2312,latin-1
set fileformats=unix,dos,mac
filetype plugin on
filetype indent on

"Text search and replace
set showmatch 
set matchtime=2
set hlsearch
"增量查找功能
set incsearch
"set ignorecase
set smartcase
set magic
set lazyredraw
"只在当前光标位置至文档结尾的范围内查找，而不绕回文档继续查找
"set nowrapscan
set iskeyword+=_,$,@,%,#,-,.

"Gvim config
if has("gui_running")
    colorscheme murphy " solarized
endif
"set guifont=DejaVu\ Sans\ Mono\ 12
set guifont=DejaVu\ Sans\ Mono\ 14
set guioptions=aegic

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

"符号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>

:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"附加的一些快捷方式
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xtime <c-r>=strftime("20%y.%m.%d.%H.%M(%A) ")<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"附加的一些功能
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Mydict()  
    let expl=system('sdcv -n ' .  
    \  expand("<cword>"))  
    windo if  
    \ expand("%")=="diCt-tmp" |  
    \ q!|endif  
    25vsp diCt-tmp  
    setlocal buftype=nofile bufhidden=hide noswapfile  
    1s/^/\=expl/  
    1  
endfunction  
nmap D :call Mydict()<CR>  
" shift+f 查取单词  
"nmap:!sdcv=expand("")
"nmap KK:call My_sdcv("that word")<CR>
command -nargs=1 FY call My_sdcv("<args>")
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif
