"               _                    
"    _ ____   _(_)_ __ ___  _ __ ___ 
"   | '_ \ \ / / | '_ ` _ \| '__/ __|
"  _| | | \ V /| | | | | | | | | (__ 
" (_)_| |_|\_/ |_|_| |_| |_|_|  \___|

" Tab Options
set shiftwidth=4
set tabstop=4
set noexpandtab

" Plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-sensible'
	Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	" Plug 'easymotion/vim-easymotion'
	Plug 'bling/vim-airline'
	"Plug 'bling/vim-bufferline'
	Plug 'tpope/vim-commentary'
	Plug 'sheerun/vim-polyglot'
	Plug 'w0ng/vim-hybrid'
	Plug 'valloric/youcompleteme'
call plug#end()

" Color options
syntax enable
set background=dark
colorscheme hybrid

" Airline options
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=0
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1

" Put buffer line in status bar
	" let g:bufferline_echo = 0
  " autocmd VimEnter *
  " \ let &statusline='%{bufferline#refresh_status()}'
     " \ .bufferline#get_status_string()

" Line Numbers
set number
set numberwidth=1
set cursorline
" set cursorcolumn
" set rnu

" General UI Options
set nostartofline      " when moving thru the lines, the cursor will try to stay in the previous columns
set noshowmode

" Layout
set smartindent

" Prevent arrow keys from being used (hjkl masterrace)
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<return><esc>

nnoremap <silent> <Left> :bp<return>
nnoremap <silent> <Right> :bn<return>

" Set window title to open document name
:set title

:set wildmenu
:set hidden
