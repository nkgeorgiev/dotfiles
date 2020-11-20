set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on


" install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'		"https://github.com/scrooloose/nerdtree
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-airline' 		"https://github.com/vim-airline/vim-airline
"Plugin 'scrooloose/syntastic'		"https://github.com/vim-syntastic/syntastic
Plug 'Valloric/YouCompleteMe'		"https://github.com/Valloric/YouCompleteMe
Plug 'SirVer/ultisnips' 		"https://github.com/SirVer/ultisnips
Plug 'honza/vim-snippets'
Plug 'xolox/vim-easytags' 		"https://github.com/xolox/vim-easytags
Plug 'xolox/vim-misc'
Plug 'scrooloose/nerdcommenter'	"https://github.com/scrooloose/nerdcommenter
Plug 'severin-lemaignan/vim-minimap'
Plug 'lyuts/vim-rtags'
Plug 'majutsushi/tagbar'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rhysd/vim-clang-format'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

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


let g:rg_command = 'rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --color "always" -g"!build-clang" -g"!build/obj-x64" '
"-tcpp -tc -tpython -tjava -txml -t yaml-tmd -g "!build/obj-x64/*"-g "!build-clang/*"-g "!docs/*"'

 command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

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

let g:clang_format_path = "/dbc/sof4-dbc302/ngeorgiev/llvm-tools/usr/bin/clang-format"
"noremap <C-K> :pyf ~/.vim/plugins/clang-format.py<cr>
" inoremap <C-K> <c-o>:pyf ~/.vim/plugins/clang-format.py<cr>


autocmd FileType c,cpp,objc nnoremap <buffer><C-K> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><C-K> :ClangFormat<CR>


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


nnoremap <f12> :YcmCompleter GoToImprecise<cr>
nnoremap <f11> :YcmCompleter GoTo<cr>
nnoremap <f10> :YcmCompleter GoToInclude<cr>
nnoremap <f5> :YcmForceCompileAndDiagnostics<cr>
nnoremap <C-f> :YcmCompleter FixIt<CR>
nnoremap <leader>o :lopen<CR>
nnoremap <leader>c :lclose<CR>

nmap <c-h> <c-w>h<BAR>
nmap <c-l> <c-w>l<BAR>

map <C-P> :Files<CR>

nmap <F8> :TagbarToggle<CR>

" f9 toggles folding
" set foldmethod=syntax
" set nofoldenable
" inoremap <F9> <C-O>za
" nnoremap <F9> za
" onoremap <F9> <C-C>za
" vnoremap <F9> zf
" " Unfuck my screen
" nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
"nerdcommenter
" <leader>cc - comment
" <leader>cu - uncomment
" <leader>ci - toggle comment
"

