" Vim Version: 8.0
" =================================================================
"
" Vim-plug Initialization {{{

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" }}}
" Active plugins {{{
call plug#begin('~/.vim/plugged')
" Plugins from github repos:

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'NLKNguyen/papercolor-theme' 
" vimwiki - Personal Wiki for Vim
Plug 'vimwiki/vimwiki'
Plug 'suan/vim-instant-markdown'
" vim-pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 
" vim-markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" vim + tmux; send from vin to console
Plug 'jpalardy/vim-slime'
" LaTeX plugins for Vim
Plug 'lervag/vimtex'
" color schemes
"Plug 'christophermca/meta5'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
" Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
" Plug 'mattn/emmet-vim'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
" Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
" Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Plug 'rosenfeld/conque-term'
" Pending tasks list
" Plug 'fisadev/FixedTaskList.vim'
" Surround
" Plug 'tpope/vim-surround'
" Autoclose
" Plug 'Townk/vim-autoclose'
" Indent text object
" Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
" Plug 'jeetsukumaran/vim-indentwise'
" Python autocompletion, go to definition.
"Plug 'davidhalter/jedi-vim'
" Better autocompletion
"Plug 'Shougo/neocomplcache.vim'
" Snippets manager (SnipMate), dependencies, and snippets repo
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'MarcWeber/vim-addon-manager'
"Plug 'tomtom/tlib_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
" Plug 'mhinz/vim-signify'
" Automatically sort python imports
" Plug 'fisadev/vim-isort'
" Drag visual blocks arround
" Plug 'fisadev/dragvisuals.vim'
" Window chooser
" Plug 't9md/vim-choosewin'
" Python and other languages code checker
" Plug 'scrooloose/syntastic'
" Paint css colors with the real color
" Plug 'lilydjwg/colorizer'
" Ack code search (requires ack installed in the system)
" Plug 'mileszs/ack.vim'
if has('python')
    " YAPF formatter for Python
    " Plug 'pignacio/vim-yapf-format'
endif
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative 
" numbering every time you go to normal mode. Author refuses to add a setting 
" to avoid that)
" Plug 'myusuf3/numbers.vim'

" Plugins from vim-scripts repos:

" Search results counter
" Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
" Plug 'vim-scripts/matchit.zip'
" Gvim colorscheme
" Plug 'vim-scripts/Wombat'
" Yank history navigation
" Plug 'vim-scripts/YankRing.vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()
" }}}
" Install plugins first time {{{
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif
" }}}
" Misc {{{

set rtp+=~/.fzf

" leader key
let mapleader=","

filetype plugin indent on
set nocompatible            " no vi-compatible
set autochdir               " change dir to the file being edited
set number relativenumber   " show line numbers
set showcmd                 " show command in bottom bar
"set cursorline             " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]
set lazyredraw              " redraw only when we need to.
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set hidden
set history=100
set smartindent
set autoindent
set ls=2              " always show status bar

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" reload vimrc ----------------------
map <leader>s :source ~/.vimrc<CR>

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" run/compile  ----------------------
map <F9> :w<CR>:!python %<CR>

" }}}
" Colors {{{
syntax on
"colorscheme meta5 
set background=light
"colorscheme PaperColor
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=2       " 2 nested fold max
set foldmethod=indent   " fold based on indent level

nnoremap <space> za
vnoremap <space> zf
" }}}
" Movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>

" buffer navigation mappings
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
"noremap <C-Right> :bnext<CR>
"inoremap <C-S-Right> <ESC>:bnext<CR>
"noremap <C-Left> :bprev<CR>
"inoremap <C-S-Left> <ESC>:bprev<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
" }}}
" Baskup, swap and undo {{{
"
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" }}}
" Plugin settings {{{
" NERDTree {{{ 

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
"}}}
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'papercolor'
"let g:airline_theme = 'wombat'
let g:airline#extensions#whitespace#enabled = 0

"}}}
" vimtex {{{
let maplocalleader="\\"
let g:tex_flavor = 'latex'
let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {'callback' : 0}
" }}}
" snippets {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
 let g:UltiSnipsEditSplit="vertical"
" }}}
"" NeoComplCache {{{

"" most of them not documented because I'm not sure how they work
"" (docs aren't good, had to do a lot of trial and error to make 
"" it play nice)
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_ignore_case = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_enable_fuzzy_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_fuzzy_completion_start_length = 1
"let g:neocomplcache_auto_completion_start_length = 1
"let g:neocomplcache_manual_completion_start_length = 1
"let g:neocomplcache_min_keyword_length = 1
"let g:neocomplcache_min_syntax_length = 1
"" complete with workds from any opened file
"let g:neocomplcache_same_filetype_lists = {}
"let g:neocomplcache_same_filetype_lists._ = '_'
"" }}}
" Jedi-vim {{{

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>
" }}}
" vim-slime {{{
let g:slime_target = "tmux"
autocmd FileType python let g:slime_python_ipython = 1
"let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.1"}
" }}}
" vim-markdown {{{
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_math = 1
" }}}
" vimwiki {{{
" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown','.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

" vim-instant-markdown - Instant Markdown previews from Vim
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0  " disable autostart
map <leader>md :InstantMarkdownPreview<CR>
"nmap <leader>wf <Plug>VimwikiFollowLink
" }}}
" vim-pandoc {{{
let g:pandoc#command#latex_engine = 'pdflatex'
" }}}
" }}}
"
" vim:foldmethod=marker:foldlevel=0
