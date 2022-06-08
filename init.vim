let mapleader=" "
set mouse=a
set showmatch
set number
set clipboard=unnamedplus
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set wildmode=list:longest,longest:full   " Better command line completion

set background=dark

"My Configs

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <silent> <leader>so :so %<CR>
nnoremap <leader>e :e $HOME\AppData\Local\nvim\init.vim<CR>

let $LANG='es'
set relativenumber
set numberwidth=1
set number
set ignorecase
set langmenu=on
set si
set wrap
set title
set cursorline
set noswapfile
set nobackup
set nowritebackup
set nowb
set tabstop=2
set expandtab
set smarttab

"jumps entre ventanas
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Buffers
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>d :bdelete<CR>
 
"no use arrows
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
"rezise
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Left> :vertical resize -5<CR>
nnoremap <Down> :resize +5<CR>
nnoremap <Up> :resize -5<CR>

"terminal
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
inoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

