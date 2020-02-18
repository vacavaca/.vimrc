" Run CSAprox for better theming in terminal
"if (&term == 'xterm' || &term =~? '^screen')
"    set t_Co=256
"    let g:CSApprox_konsole = 1
"endif

set mouse=a
command! E Explore

" Ctrl-P

let g:ctrlp_custom_ignore = 'node_modules\|dist\|build\|git'
let g:ctrlp_max_files=0

" Racer setup
set hidden

" VUNDLE setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'udalov/javap-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'rust-lang/rust.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

" Syntax
set tabstop=4
set shiftwidth=4
set expandtab
set omnifunc=syntaxcomplete#Complete
set nonumber
set list lcs=trail:·,tab:»·

" Explorer
let g:netrw_liststyle=3

" Nerdtree

autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
:let g:NERDTreeIgnore=['__pycache__', '*.pyc']

" Easymotion

let g:EasyMotion_keys='hklyuiopnmqwertzxcvbasdgjf'

" Theme
colorscheme default

syntax on
set laststatus=1

colorscheme wombat256

" GUI

set guioptions-=M
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Mappings
map <ESC>[5D <C-Left>
map <ESC>[5C <C-Right>
map! <ESC>[5D <C-Left>
map! <ESC>[5C <C-Right>

cnoreabbrev W w

command Wt execute "%s/\\s\\+$//g"
cnoreabbrev wt Wt

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map <C-n> :NERDTreeToggle<CR>

command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? '<f-args> removed' : 'ERROR')
cnoreabbrev rm Remove

cnoreabbrev ag Ag

"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

"let g:limelight_conceal_ctermfg = 242
"let g:limelight_default_coefficient = 0.7

set visualbell
set noerrorbells

set exrc
set secure
