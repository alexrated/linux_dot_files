" VIM CONFIGURATION FILE
" _______________________

" You'd better create the following directory structure at /home:
" mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged

" 1. COLOR SCHEME

" Do not forget to do: 
" curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
" In the ~/.vim/colors/ directory

colorscheme nord

" 2. SECTIONS

" Do not forget that:
" zo opens a single fold under de cursor
" zc closes it
" zR opens all folds
" zM close them all

" GENERAL ---------------------------------------------------------------- {{{ 

set laststatus=0

" Syntax, line number and relative line number on:
syntax on
set number
set relativenumber

" Disable compatibility with vi (recomended):
set nocompatible

" Enable type file detection and load plugin for detected file type:
filetype on
filetype plugin on

" Load an indent file for the detected file type:
filetype indent on

" Highlight cursor line underneath the cursor horizontally & vertically:
set cursorline
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"set encoding for the nerd font:
set encoding=utf8

" set nerd font for vim:
set guifont=FiraCodeMono\ Nerd\ Font\ 11

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

" To install vim-plug plugin manager just do this:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Do not forget to save the file and do a :source ~/.vimrc after installing a plugin!
" Do not forget, either, to do a :PlugInstall to get a succefully installation!

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'arcticicestudio/nord-vim'
Plug 'luochen1990/rainbow'
" Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'maxboisvert/vim-simple-complete'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" }}}

" PLUGINS-CONF ----------------------------------------------------------- {{{

" ********** Lightline configuration begins **********
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Blue',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex', 'asciivalue' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': 'hex: 0x%B',
      \   'asciivalue': 'ascii: %b' 
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Activate lightline
set laststatus=2
call lightline#init()
set noshowmode
" ********* End of lightline configurations **********


" ********* Rainbow parentheses configuration ********
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
      \ 'guifgs' : ['#B22222', '#B22222', '#C0FF3E', '#EEC900', '#9A32CD', '#EE7600', '#98fb98', '#686868'],
      \ 'ctermfgs': 'xterm-256color' == $TERM ? ['226', '87', '82', '208', '129', '166', '85', '237'] : ['green', 'red', 'yellow', 'blue', 'lightgreen'],
      \ 'css': 0, 
      \ 'nerdtree': 0,
      \ }
" ********* End Rainbow parentheses configuration ****

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Use jj to replace scape key:
inoremap jj <esc>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <c-n> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif


" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" If you do not want to use a plugin for the status line, just do (uncomment):

" Clear status line when vimrc is reloaded.
" set statusline=

" Status line left side.
" set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
" set statusline+=%=

" Status line right side.
" set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
" set laststatus=2

" }}}
