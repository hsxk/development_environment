set nocompatible
filetype off
set rtp+=/root/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'
Plugin 'preservim/tagbar'
Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/fzf'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

autocmd vimenter * NERDtree
let NURDTreeShowHidden=1

nmap <F2> :TagbarToggle<CR>

let g:ale_sign_column_always=1
let g:ale_set_highlights=0
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>s :ALEToggle<CR>
nmap <Leader>d :ALEDetail<CR>

set laststatus=2
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1

syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark
let g:ligthline={'colorscheme':'gruvbox'}

let mapleader="\<Space>"
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,gb18030
set autoindent
set backspace=eol,start,indent
set cursorline
set cursorcolumn
set linebreak
set number
set relativenumber
set tabstop=4
set incsearch
set hlsearch
set display=lastline
set showmatch
set wildmenu
set listchars=tab:>-,trail:-
set ruler
set confirm
set vb t_vb=
