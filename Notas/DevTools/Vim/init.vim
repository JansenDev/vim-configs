" !!$SHELL<CR>
"     _
"    | | __ _ _ __  ___ ___  ___ _ __  
" _  | |/ _` | '_ \/ __/ __|/ _ \ '_ \ 
"| |_| | (_| | | | \__ \__ \  __/ | | |
" \___/ \__,_|_| |_|___/___/\___|_| |_|
"                                    
"                                    
syntax on
let g:mapleader = " "
set number
set relativenumber
set autoindent
set expandtab
set cursorline
set showcmd
set showmode
set showmatch
set mouse=a
set ignorecase
set wrap
set smartcase
set incsearch
set textwidth=100
set ruler
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set clipboard=unnamedplus
"no backup
set noswapfile
set undofile
"No errors
set noerrorbells
"set visualbell
set numberwidth=1

call plug#begin('~/.vim/plugged')
Plug 'eiiches/vim-rainbowbrackets' 
Plug 'townk/vim-autoclose'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'ayu-theme/ayu-vim'
Plug 'mattn/emmet-vim'
Plug 'yggdroot/indentline'
Plug 'lilydjwg/colorizer'
Plug 'kabbamine/vcoolor.vim'
Plug 'vim-python/python-syntax'
Plug 'chun-yang/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"NerdTree
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#bufferline#enabled = 1

"let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '' 
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
"let g:airline#extensions#tabline#formatter = 'default'

"BufferLine
"let g:bufferline_active_highlight = 'StatusLine'

"airlineTheme
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

"set t_Co=256
"bufferline
"
"AYU
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<C-y>'

"vCoolor
"Alt-R> you can insert a rgb color anywhere (NORMAL and INSERT modes).
"<Alt-V> you can insert a hsl color anywhere (NORMAL and INSERT modes).
"<Alt-W> you can insert a rgba color anywhere (NORMAL and INSERT modes).

"coc 

"conf
"guardado
nnoremap <leader>w :w<CR>
nnoremap <leader>so :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>install :PlugInstall<CR> 
"buffers
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprevious<CR>
nnoremap <leader>q :bdelete<CR>
"deplazamiento en ventanas
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
"comandos de consola en nvim
nnoremap Q !!$SHELL<Enter>

"Bloquear teclas de flecha"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"redimencionar la ventana
nnoremap <silent> <right> :vertical resize +5<CR> 
nnoremap <silent> <left> :vertical resize -5<CR> 
nnoremap <silent> <up> :resize +5<CR> 
nnoremap <silent> <down> :resize -5<CR> 
nnoremap <leader>e :e $MYVIMRC<CR>
 "sp = split horizontal, vsp= vertical split 
nnoremap <leader>vs :vsp<CR>
nnoremap <leader>sp :p<CR>
"Abrir terminal
nnoremap<c-t> :split<CR>:ter<CR>
vnoremap<c-t> :split<CR>:ter<CR>











