" be iMproved, required by Vundle
set nocompatible

" required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The NERDTree is a file system explorer for the Vim editor.
Plugin 'preservim/nerdtree'

"Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plugin 'w0rp/ale'

"lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/powerline'

Plugin 'majutsushi/tagbar'

"An up-to-date Vim syntax for PHP (7.x supported)
Plugin 'stanangeloff/php.vim'

"quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'

"A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

"a code-completion engine for Vim
Plugin 'ycm-core/YouCompleteMe'

":cherry_blossom: A command-line fuzzy finder
Plugin 'junegunn/fzf'

" All of your Plugins must be added before the following line
call vundle#end()            " required by Vundle
filetype plugin indent on    " required by Vundle
" Put your non-Plugin stuff after this line

"open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

nmap <F8> :TagbarToggle<CR>

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
nmap <Leader>s :ALEToggle<CR>
nmap <Leader>d :ALEDetail<CR>
set laststatus=2

nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'default'

" 禁止生成 swap 恢复文件
" 早期计算机经常崩溃，vim 会自动创建一个 .swp 结尾的文件
" 崩溃重启后可以从 .swap 文件恢复
" 现在计算机鲜少崩溃了，可以禁用此功能
set noswapfile

" vim 内部使用的编码，默认使用 latin1，改成通用的 utf8 编码，避免乱码
set encoding=utf-8

" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
" 如果遇到解码失败，则尝试使用下一个编码
" 常见的乱码基本都是 windows 下的 gb2312, gbk, gb18030 等编码导致的
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030

" 在插入模式按回车时 vim 会自动根据上一行的缩进级别缩进
set autoindent

" 修正 vim 删除/退格键行为
" 原生的 vim 行为有点怪：
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
" 通过设置 eol, start 和 indent 可以修正上述行为
set backspace=eol,start,indent

" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2

" 高亮第 80 列，推荐
set colorcolumn=80

" 高亮光标所在行，推荐
" 有人还会高亮当前列，可以通过 set cursorcolumn 开启，但有点过了，不推荐
set cursorline

" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak

"第一行是设置行号显示，第二行是将行号设置为相对行号
set number
set relativenumber

"表示按一下<Tab>输出几个空格
set tabstop=4

"保持光标距离屏幕顶部和底部有3行的距离，如果你设置的数值特别大，比如999，那光标永远都保持在屏幕的中部
"set scrolloff=1

"hlsearch 高亮被搜索的字符，display=lastline
"在当前窗口中，如果单行长度过长，则能显示多少就显示多少，不需要将整行显示出来
set hlsearch
set display=lastline

"很聪明的查找,输入一个字符马上自动匹配,而不是输入完再查找
set incsearch

"自动匹配括号
set showmatch

" 高亮显示搜索结果
set hlsearch

" vim 自身命令行模式智能补全
set wildmenu

"设置颜色主题
syntax enable
set t_Co=256
colorscheme gruvbox
set background=dark
let g:ligthline = { 'colorscheme': 'gruvbox' }


" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

"显示空格和TAB键
set listchars=tab:>-,trail:-

"显示光标当前位置
set ruler

"VIM变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 在处理未保存或只读文件的时候，弹出确认
set confirm
