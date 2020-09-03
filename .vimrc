" Run CSAprox for better theming in terminal
"if (&term == 'xterm' || &term =~? '^screen')
"    set t_Co=256
"    let g:CSApprox_konsole = 1
"endif

syntax on

command! E Explore

" VUNDLE setup
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'tpope/vim-sleuth' " auto tabs
Plugin 'junegunn/fzf' " Needs many things
Plugin 'junegunn/fzf.vim' " needs many things

call vundle#end()

filetype plugin indent on

" Syntax
set tabstop=4
set shiftwidth=4
set expandtab
set omnifunc=syntaxcomplete#Complete
set nonumber
set list lcs=trail:·,tab:»·
set laststatus=1
set mouse=a
set guioptions-=M
set guioptions-=T
set guioptions-=r
set guioptions-=L
set visualbell
set noerrorbells
set hidden
set nocompatible
set textwidth=0
set scrolloff=3
set foldcolumn=1

" Ctrl-P

let g:ctrlp_custom_ignore = 'node_modules\|dist\|build\|git'

" Explorer
let g:netrw_liststyle=3

" Nerdtree
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
:let g:NERDTreeIgnore=['__pycache__', '*.pyc']

" Easymotion

let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'

colorscheme apprentice

" Mappings

map <ESC>[5D <C-Left>
map <ESC>[5C <C-Right>
map <C-n> :NERDTreeToggle<CR>
map  / <Plug>(easymotion-sn)

map! <ESC>[5D <C-Left>
map! <ESC>[5C <C-Right>

omap / <Plug>(easymotion-tn)

cnoreabbrev W w
cnoreabbrev wt Wt
cnoreabbrev ag Ag

command Wt execute "%s/\\s\\+$//g"
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? '<f-args> removed' : 'ERROR')

hi NonText ctermbg=NONE
