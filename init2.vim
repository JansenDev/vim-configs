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
set encoding=UTF-8


"PLUGIN CONFIGS START

call plug#begin('~/.local/share/nvim/plugged')
Plug 'joshdick/onedark.vim'
"Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot' "Resaltadod e sintaxis
Plug 'tpope/vim-surround' "facilita poner/ quitar comillas, parentes,tags, etc
Plug 'jiangmiao/auto-pairs' "inserta pares de comillas
Plug 'tpope/vim-fugitive' " provee comandos de git
Plug 'airblade/vim-gitgutter' "muestra cambios hechos en el archvo en la barra de signos
Plug 'xuyuanp/nerdtree-git-plugin' "muestra el estado de los asrchivos en neerdtree
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'ryanoasis/vim-devicons'
 Plug 'preservim/nerdtree'
"Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
call plug#end()

"onedark
set termguicolors  " Activa true colors en la terminal
colorscheme onedark  " Activa tema onedark

"nerdtree
let g:NERDTREEcHdIRmODE = 2 " Cambia el directorio actual al nodo padre actual
nnoremap <leader>nt :NERDTreeToggle<CR> 

"airline
let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo

"airline-theme
let g:airline_powerline_fonts = 1  "cargar fuente powerline y simbolos
set noshowmode " No mostrar el modeo actual :
"let g:airline_theme='simple'

" indentline
let g:indentLine_fileTypeExclude = ['text','sh','help','terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*','term:.*']
let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'

"gitgutter
set updatetime=250

"autocompletado
" Activar deoplete al iniciar Neovim
"let g:deoplete#enable_at_startup = 1

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

"PLUGINS CONFIGS END

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
