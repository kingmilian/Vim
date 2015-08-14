""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" FileName : .vimrc
" Author   : king
" Desc     : Vim configuration file for work
"
" Use Vundle to manage the plugins, Perform the following steps
" 1. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" 2. Launch vim and run :PluginInstall
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source /etc/vimrc

" The following contents are prohibited to modify
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add Plugins here
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'SuperTab'
Plugin 'DoxygenToolkit.vim'
Plugin 'kingmilian/AuthorInfo'
Plugin 'neocomplcache'
Plugin 'OmniCppComplete'
Plugin 'grep.vim'
Plugin 'The-NERD-Commenter'
Plugin 'winmanager'
Plugin 'vcscommand.vim'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set number
set nocursorline
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set ruler
set nowrap
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set nobackup
set ignorecase smartcase
set nowrapscan
set incsearch
set hlsearch
set showmatch
set matchtime=2
set magic
set hidden
set smartindent
set smarttab
set backspace=indent,eol,start
set cmdheight=1
set laststatus=2
set mouse=a
set fileencodings=utf-8,gb18030,gb2312,gbk,latin1,cp936,ru
set encoding=utf-8
set termencoding=utf-8
set foldmethod=syntax
set foldlevel=100
set tags=.tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open = 1
"let g:Tlist_GainFocus_On_ToggleOpen=1
"let g:Tlist_Show_One_File=1
nmap l :Tlist<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCppComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let OmniCpp_DefaultNamespaces = ["std"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,longest
let g:SuperTabRetainCompletionType = 0
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DoxygenToolkit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_authorName="king"
let g:DoxygenToolkit_blockTag = "@name \t"
let g:DoxygenToolkit_briefTag_pre = "@brief \t"
let g:DoxygenToolkit_paramTag_pre = "@param \t"
let g:DoxygenToolkit_returnTag = "@return\t =0  success"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
map fg : Dox<cr>
map lg : DoxLic<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AuthorInfo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimrc_author='king'
let g:vimrc_email='kingmilian@gmail.com'
map <F4> :AuthorInfoDetect<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore=['\.o$','\~$','\.a$','\.bak$','\.d$','\.ko$'] 
let NERDTreeWinPos='right' 
map ee :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_disable_auto_complete = 1
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=5
highlight PmenuSbar ctermbg=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F3> :Rgrep<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The-NERD-Commenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
map <silent> jj ,c<space>
map <silent> jk ,cm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vcscommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ll :VCSLog<CR>
map ff :VCSDiff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap 1 1gt
nmap 2 2gt
nmap 3 3gt
nmap 4 4gt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" astyle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func CodeFormat()
    "取得当前光标所在行号
    let lineNum = line(".")
        "C源程序
    if &filetype == 'c'
        "执行调用外部程序的命令
        exec "!astyle -A1 -s4 -n -z2 -K -S %"
    "H头文件(文件类型识别为cpp)，CPP源程序
    elseif &filetype == 'cpp'
        "执行调用外部程序的命令
        exec "!astyle -A1 -s4 -n -z2 -K -S %"
    "JAVA源程序
    elseif &filetype == 'java'
        "执行调用外部程序的命令
        exec "!astyle -A1 -s4 -n -z2 -K -S %"
    else 
        "提示信息
        echo "不支持".&filetype."文件类型。"
    endif
    "返回先前光标所在行
    exec lineNum
endfunc
"映射代码美化函数到Shift+f快捷键
map <S-F> <Esc>:call CodeFormat()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use both cscope and ctag
set cscopetag

" Show msg when cscope db added
set cscopeverbose

" Use tags for definition search first
set cscopetagorder=0

" Use quickfix window to show cscope results
"set cscopequickfix=s-,c-,d-,i-,t-,e-

let g:autocscope_menus=0

" add any database in current dir
if filereadable(".cscope.out")
    silent cs add .cscope.out
else
    let cscope_file=findfile(".cscope.out", ".;")
    let cscope_pre=matchstr(cscope_file, ".*/")
    if !empty(cscope_file) && filereadable(cscope_file)
        exe "silent cs add" cscope_file cscope_pre
    endif
endif

" Cscope mappings
nnoremap <C-w>\ :scs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

