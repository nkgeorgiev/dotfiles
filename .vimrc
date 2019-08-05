set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'		"https://github.com/scrooloose/nerdtree
Plug 'bling/vim-airline' 		"https://github.com/vim-airline/vim-airline
Plug 'Valloric/YouCompleteMe'		"https://github.com/Valloric/YouCompleteMe
Plug 'SirVer/ultisnips' 		"https://github.com/SirVer/ultisnips
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'	"https://github.com/scrooloose/nerdcommenter

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

"nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" fzf + ripgrep

set rtp+=~/.fzf


" https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
 let g:rg_command = '
     \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
     \ -g "*.{ts,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst}"
     \ -g "!{.config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" 
     \ -g "!build-clang/*"'

 command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)





"some tab settings
set tabstop=3
set softtabstop=3
set shiftwidth=3
set expandtab

set si
set wrap

"http://stevelosh.com/projects/badwolf/ to ~/.vim/colors
"colorscheme badwolf
highligh ColorColumn ctermbg=darkgray


"from hiki
 if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time


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

"nerdcommenter
" <leader>cc - comment
" <leader>cu - uncomment
" <leader>ci - toggle comment
"

