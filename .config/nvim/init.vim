"  ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"  ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"  ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"  ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

" Editor {{{
set number relativenumber
set tabstop=2     " 2 space tab
set expandtab     " use spaces for tabs
set softtabstop=2 " 2 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent

set cursorline
set lazyredraw
set showmatch " highlight matching ({[]})
" define where splits go
set splitbelow
set splitright
" }}}
" Searching {{{
set ignorecase " ignore case when searching
set smartcase  " use case if upper is used
set incsearch  " search as characters are entered
set hlsearch   " highlight all matches
" }}}
" Folding {{{
set foldmethod=syntax " fold based on syntax
set foldnestmax=1
" }}}
" Leader Shortcuts {{{
nnoremap <space> <nop>
let mapleader = " "
" Toggle folds
nmap <leader>f za
" Edit and source vimrc
nnoremap <leader><space>ev :vsp $MYVIMRC<CR>
nnoremap <leader><space>sv :source $MYVIMRC<CR>
" }}}
" Key Mapping {{{
" Line Shortcuts
nnoremap j gj
nnoremap k gk
" Clear highlighting
nnoremap <silent><esc> :noh<CR>
" nnoremap <esc>[ <esc>[ (add if weird issues with escape)
" Retain previous yank when pasting
xnoremap p pgvy
" Format indents on paste
nnoremap p p=`]
nnoremap P P=`]
" Y acts like C and D
nnoremap Y y$
" Swap : and ;
nnoremap ; :
" Macro over visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
" Wrappers
inoremap {} {}<Esc>i
inoremap () ()<Esc>i
inoremap [] []<Esc>i
inoremap "" ""<Esc>i
inoremap '' ''<Esc>i
inoremap `` ``<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap (<CR> (<CR>)<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko
" Split Nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Right> :bn<CR>
nnoremap <Left> :bp<CR>
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'                   " Syntax theme
" {{{
" let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 1
let g:gruvbox_sign_column = 'bg0' " set column color
" }}}
Plug 'vim-airline/vim-airline'           " Status line
" {{{
let g:airline#extensions#tabline#enabled = 1               " show tabs/buffers
let g:airline#extensions#tabline#formatter = 'unique_tail' " only show file name
" }}}
Plug 'jeffkreeftmeijer/vim-numbertoggle' " Toggles relative numbers
Plug 'christoomey/vim-tmux-navigator'    " Tmux integration
Plug 'qpkorr/vim-bufkill'                " Better buffer commands
" {{{
map <C-c> :BD<cr>
" }}}
" }
Plug 'junegunn/vim-easy-align'           " Align things
" {{{
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)
" }}}
Plug 'tpope/vim-commentary'              " Comment things
" {{{
nmap <leader>c <Plug>Commentary
xmap <leader>c <Plug>Commentary
omap <leader>c <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
" }}}
Plug 'pangloss/vim-javascript'           " Javascript syntax
Plug 'elzr/vim-json'                     " JSON syntax
" {{{
let g:vim_json_syntax_conceal = 0
" }}}
Plug 'mxw/vim-jsx'                       " JSX syntax
Plug 'mattn/emmet-vim'                   " Emmet
" {{{
let g:user_emmet_expandabbr_key = '<S-Tab>'
" }}}
Plug 'w0rp/ale'                          " Linter
" {{{
let g:ale_fixers = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" }}}
Plug 'tpope/vim-rails'                   " Rails
Plug 'tpope/vim-endwise'                 " Ends for Ruby
Plug 'tpope/vim-surround'                " Wrap things
Plug 'tpope/vim-repeat'                  " Repeating for some plugins
Plug 'tpope/vim-fugitive'                " Git wrapper
Plug 'AndrewRadev/splitjoin.vim'         " Split blocks gS, join gJ
Plug 'simeji/winresizer'                 " Easier window resizing
Plug 'machakann/vim-highlightedyank'     " Highlight yank
" {{{
let g:highlightedyank_highlight_duration = 250
" }}}
Plug 'rhysd/clever-f.vim'                " Use f to repeat f
Plug 'justinmk/vim-sneak'                " Better easy motion
" {{{
let g:sneak#s_next = 1
" }}}
Plug 'scrooloose/nerdtree'               " File tree
" {{{
nmap <silent> <leader>n :NERDTreeToggle<CR>
" }}}
" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
" {{{
let g:deoplete#enable_at_startup = 1
" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" }}}
Plug 'brookhong/ag.vim'                  " Ag integration
" {{{
nnoremap <leader>a :Ag!<space>
" }}}
Plug 'ctrlpvim/ctrlp.vim'                " Fuzzy file finder
" {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrl_use_caching = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
nmap <leader>p :CtrlP<CR>
" }}}
Plug 'airblade/vim-gitgutter'            " Git changes
" {{{
let g:gitgutter_override_sign_column_highlight = 0 " allow colorscheme to define column color
" }}}
Plug 'Yggdroot/indentLine'               " Add indent guides
" {{{
let g:indentLine_char = '┆'
" }}}
Plug 'ntpeters/vim-better-whitespace'    " Remove trailing whitespace on save
" {{{
let g:better_whitespace_enabled = 0 " don't highlight whitespace
let g:strip_whitespace_on_save = 1
" }}}
call plug#end()
" }}}
" Appearance {{{
syntax enable
set termguicolors
set background=dark
colorscheme gruvbox
" }}}
" Auto Comands {{{
" autocmd Syntax ruby,javascript normal zR
" }}}
" Custom Functions {{{
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}

" vim: foldenable:foldmethod=marker:foldlevel=0
