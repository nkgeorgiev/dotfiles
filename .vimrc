set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'            "https://github.com/scrooloose/nerdtree
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'              "https://github.com/vim-airline/vim-airline
Plugin 'scrooloose/syntastic'           "https://github.com/vim-syntastic/syntastic
Plugin 'Valloric/YouCompleteMe'         "https://github.com/Valloric/YouCompleteMe
Plugin 'SirVer/ultisnips'               "https://github.com/SirVer/ultisnips
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-easytags'             "https://github.com/xolox/vim-easytags
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdcommenter'       "https://github.com/scrooloose/nerdcommenter
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'rdnetto/YCM-Generator'
Plugin 'lyuts/vim-rtags'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set runtimepath^=~/.vim/bundle/ctrlp.vim

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_root_markers = ['.p4config']


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
"NERDTree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"YCM
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_always_populate_location_list = 1

"Utilsnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-tab>"

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" fzf + ripgrep

set rtp+=~/.fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1,<bang>0)
"some tab settings
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

set si
set wrap

"http://stevelosh.com/projects/badwolf/ to ~/.vim/colors
colorscheme badwolf
highligh ColorColumn ctermbg=darkgray


"from hiki
 if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set bs=indent,eol,start         " allow backspacing over everything in insert mode
"set ai                 " always set autoindenting on
"set backup             " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
set autoindent
set nu


set number
set hidden

set colorcolumn=89
let c_space_errors = 1

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"Copy/paste from system clipboard
map <C-v> "+p
map <C-c> "+y


nnoremap <F12> :YcmCompleter GoToImprecise<CR>
nnoremap <F11> :YcmCompleter GoTo<CR>
nnoremap <F10> :YcmCompleter GoToInclude<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>o :lopen<CR>
nnoremap <leader>c :lclose<CR>
nnoremap <C-f> :YcmCompleter FixIt<CR>

nmap <c-h> <c-w>h<BAR>
nmap <c-l> <c-w>l<BAR>

map <C-P> :Files<CR>
