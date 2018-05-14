"  _         _  _            _
" (_) _ __  (_)| |_  __   __(_) _ __ ___
" | || '_ \ | || __| \ \ / /| || '_ ` _ \
" | || | | || || |_  _\ V / | || | | | | |
" |_||_| |_||_| \__|(_)\_/  |_||_| |_| |_|

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
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'sheerun/vim-polyglot'
	Plug 'w0ng/vim-hybrid'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'sebastianmarkow/deoplete-rust'
	Plug 'yggdroot/indentLine'
	Plug 'tpope/vim-unimpaired'
	" Plug 'ervandew/supertab'
call plug#end()

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/adam/.local/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/local/src/rust/src'
let g:deoplete#sources#rust#disable_keymap=1
let g:deoplete#sources#rust#documentation_max_height=20
" deoplete tab-completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Color options
syntax enable
set background=dark
colorscheme hybrid

" Airline options
set showcmd
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

" Map left and right arrows to prev/next buffer
nnoremap <silent> <Left> :bp<return>
nnoremap <silent> <Right> :bn<return>

" Set window title to open document name
set title

" YouCompleteMe settings
" let g:ycm_server_python_interpreter = "/usr/bin/python"
" let g:ycm_global_ycm_extra_conf = "~/.config/nvim/plugged/youcompleteme/third_party/ycmd/examples/.ycm_extra_conf.py"

set wildmenu
set hidden

" Automatically save and load folds
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" indentLine settings
let g:indentLine_char = '¦'
" let g:indentLine_char = '┆'
" let g:indentLine_char = '│'
let g:indentLine_enabled = 1

set mouse=a
set conceallevel=0
