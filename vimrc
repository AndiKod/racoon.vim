
"                          ,,,
"  Rac@@n.Vim           .'    `/\_/\
"                     .'       <@I@>
"          <((((((((((  )____(  \./
"                     \( \(   \(\(
"                      `-"`-"  " "
"  - Playful little VimStarter for WebDev & More
"
" -------------------------------------------------
" URL     : https://github.com/AndiKod/racoon.vim
" :help   : https://vimhelp.org
"--------------------------------------------------

" <za> on {{{ folds }}} will toggle them ;)
"
" --- &:Racoon.Vim --- :
" --- &:PLUGINS via VimPlug --- :
" {{{

" If VimPlug not here, auto-download it.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Actual Plugins list:
call plug#begin()
  " --- LSP & Completion ---
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete-file.vim'
  Plug 'prabirshrestha/asyncomplete-buffer.vim'

  " --- Linting & Formatting ---
  Plug 'dense-analysis/ale'

  " --- AI Completion ---
  Plug 'github/copilot.vim'

  " --- Editing ---
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'

  " --- UI ---
  Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'ap/vim-css-color'
  Plug 'catppuccin/vim', { 'as': 'catppuccin'  }
  Plug 'tribela/vim-transparent'
  Plug 'mhinz/vim-startify'
  Plug 'preservim/nerdtree'
call plug#end()

" Plugins configs are below, with the Mappings
" as they are often linked.

" End of Plugins section
" }}}

" --- &:OPTIONS ---
" {{{

set nocompatible          " Disable Vi compatibility
set history=10000         " Lines to be remembered
set noshowmode            " Let VimAirline show the mode
set encoding=utf-8

" ::indentation
set autoindent
set smartindent
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set shiftround
set cinoptions=l1,p0,)50,*50,t0

" ::display
filetype on               " Enable file type detection
filetype plugin on        " Enable plugins according to filetype
syntax on
" set display +=lastline
" set laststatus=2
" set list
" set modeline
" set modeline=1
" set nosttartofline
set numberwidth=2
" set ruler
set number              " Line numbers
set relativenumber
let &t_SI = "\e[6 q"    " Thin cursor for Insert mode
let &t_EI = "\e[2 q"
set showmatch           " Show parentheses matching
set showcmd             " Show the normalMode command in status bar
set matchpairs+=<:>     " append pairable chars to the default set '(:),{:},[:]'
set signcolumn=yes


" -- Use Git for backup --
" ::backup/swap/info/undo settings
set nobackup
set nowritebackup
set noswapfile

" ::navigation
set cursorline          " Current line highlight
set foldmethod=marker
set foldopen -=hor
set foldopen +=jump
set foldtext =pliMe
set incsearch           " incremental searching as we type
set hlsearch            " highlight all search results
set mouse         =a             " Allow Mickey
set scrolloff     =4
set ignorecase
set smartcase
set tagcase       =match

" ::vrac settings (aka misc)
set clipboard     =unnamed  " clipboard yanks?
set hidden                  " Switch buffer without saving

" ::wildMenu
set wildmenu
set wildmode=longest:full,list:full "Complete longest common string,
                                    " then list alternatives.

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300


" FzF setting
"from: thevaluable.dev/fzf-vim-integration
set rtp+=/usr/bin/fzf

" End of the OPTIONS section
" }}}

" --- &:MAPPINGS + PluginsConfig --- :
"za {{{

" ----------------------- /
"  General Mappings       /
" ------------------------/

" Set the <Leader> key
let mapleader = " "
let g:mapleader = " "

" The other <Esc> or <C-c>
inoremap jj <Esc>

" Edit or Source vimrc Settings
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Integrated terminal
nnoremap <leader>t :term<CR>
nnoremap <leader>tv :vert ter<CR>
" Manually use one of the next commands:
" exit               # Close the terminal from within
" To run a dev server, consider Terminal tabs, Tmux,...

" CtrS from both modes and back to Normal
nnoremap <C-s> :w <CR> :ALEFix <cr>
inoremap <C-s> <Esc> :w <CR> :ALEFix <cr>

" Navigate the splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remove highlight
nnoremap <Esc> :nohl<CR>

" Keep the selection while indenting
xnoremap <  <gv
xnoremap >  >gv

" --- &:Autocomands ---

" Line highlight, only in Normal mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" Force .html files to html filetype (prevent htmldjango misdetection)
autocmd BufRead,BufNewFile *.html set filetype=html

" ------------------------------/
"  Plugings specific Settings   /
" ------------------------------/

" &:BuffTabline

set hidden
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>b :ls<CR>

" --------------------------------------------

" &:FzF
" :Files {directory} to search outside

" Find Files (inside the project)
nnoremap <leader>ff :Files<cr>
" Find GitFiles
nnoremap <leader>fg :GFiles<cr>
" Find sometimes opened files
nnoremap <leader>fh :History<cr>
" Search trough all open buffers
nnoremap <leader>sb :Buffers<cr>
" Search trough the content of all open buffers
nnoremap <leader>sl :Lines<cr>
" Search trough the content of the current buffer
nnoremap <leader>sc :BLines<cr>

" --------------------------------------------

" &:BuffLine

" Close a buffer
nnoremap <leader>x :bd <cr>

" --------------------------------------------

" &:NerdTree

" Toggle tree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" Find current file in tree
nnoremap <C-f> :NERDTreeFind<CR>

" Open tree at project root (git/hg/svn...)
command! Nroot :NERDTreeVCS

" Auto-close NerdTree if it's the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close tree after opening a file
let NERDTreeQuitOnOpen = 1

" Same tree on every page
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif


" Minimal UI
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let NERDTreeWinSize = 28

" NerdTree Files management
" Hit m when hovering a file/folder
" Pick the needed option: a to add, etc

" --------------------------------------------

" &:Transparency

let g:transparent_enabled = v:true
nnoremap <leader>tt :TransparentToggle<CR>

" --------------------------------------------

" &:Catppuccin

set termguicolors
set background=dark

try
  colorscheme catppuccin_mocha
  let g:airline_theme = 'catppuccin_mocha'
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry

" --------------------------------------------

" &:Startify
" https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt


" Closed on startup
let g:startify_disable_at_vimenter = 1
nnoremap <leader>s :Startify<CR>

let g:ascii = [
      \'',
      \'               . --- `/\_/\ ',
      \'             .:       <@I@> ',
      \'  <((((((((((  )____(  \./  ',
      \'             \( \(   \(\(   ',
      \'              `-"`-"  " "   ',
\ '       Rac@@n say ...',
\]
let g:asciiFooter = [
      \' Howdy mate, Rac@@n docs are on github.com/AndiKod/racoon ',
      \]

let g:startify_custom_header = exists('*startify#fortune#boxed') ? g:ascii + startify#fortune#boxed() : g:ascii
let g:startify_custom_footer = g:asciiFooter

" Show other commands
let g:startify_enable_special = 1

" Show last 5 paths in the lists
let g:startify_files_number = 5

" Use relative path
let g:startify_relative_path = 1

let g:startify_bookmarks = [
  \ { 'v': '$MYVIMRC' },
  \ { 'b': '~/.bashrc' },
  \ ]

let g:startify_lists = [
      \ { 'header': ['   Bookmarks'],       'type': 'bookmarks' },
      \ { 'header': ['   RecentlyUsed in '. getcwd()], 'type': 'dir' },
      \ { 'header': ['   RecentlyUsed Files'],            'type': 'files' },
      \ ]

" --------------------------------------------

" &:vim-lsp

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gy <plug>(lsp-type-definition)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" --------------------------------------------

" &:asyncomplete

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

" --------------------------------------------

" &:ALE (linting + formatting)

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'json': ['prettier'],
\   'sh': ['shfmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1

" --------------------------------------------

" &:Copilot

" Toggle Copilot on/off
function! ToggleCopilot()
  if exists('*copilot#Enabled') && copilot#Enabled()
    Copilot disable
    echo "Copilot: Disabled"
  else
    Copilot enable
    echo "Copilot: Enabled"
  endif
endfunction

" Map the toggle to <leader>ct in Normal mode
nnoremap <leader>ct :call ToggleCopilot()<CR>

" --------------------------------------------

" &:Emmet

" Set Ctrl+y as the direct expand trigger
let g:user_emmet_expandabbr_key = '<C-u>'

" Make expansions work in all files
let g:user_emmet_install_global = 1


" --- Potential leftover --- "
" The classic leaderKey + , to expand
" let g:user_emmet_leader_key = '<C-y>



" --------------------------------------------

" End of Mappings section
" }}}
