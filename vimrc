" ------------------------------------------------- //
"                          ,,,
"                       .'    `/\_/\
"                     .'       <@I@>
"          <((((((((((  )____(  \./
"                     \( \(   \(\(
"                      `-"`-"  " "
"   _ __ __ _  ___ ___   ___  _ __  
"  | '__/ _` |/ __/ _ \ / _ \| '_ \ 
"  | | | (_| | (_| (_) | (_) | | | |
"  |_|  \__,_|\___\___/ \___/|_| |_|
"  - Playful little Vim for WebDev -
" ------------------------------------------------- //
" Version : 1.0.0
" Licence : GPL (Do whatever, but keep it FOSS)
" URL     : https://github.com/AndiKod/racoon 
" :help   : https://vimhelp.org
"-------------------------------------------------- //

" <za> on {{{ folds }}} will toggle them ;)

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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ap/vim-buftabline'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'ap/vim-css-color'
  Plug 'catppuccin/vim', { 'as': 'catppuccin'  }
  Plug 'mhinz/vim-startify'
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
" {{{

" ----------------------- /
"  General Mappings       /
" ------------------------/

" Set the <Leader> key
let mapleader = " "
let g:mapleader = " "

" The other <Esc> or <C-c>
inoremap jj <Esc>

" Edit .vimrc Settings
nnoremap <Leader>ev :e $MYVIMRC <CR>
" Source .vimrc
nnoremap <F12> :so $MYVIMRC<CR>

" Edit my WezTerm config file 
" nnoremap <leader>et :e /path/to/.wezterm.lua <CR>

" CtrS from both modes and back to Normal
nnoremap <C-s> :w <CR> :Prettier <CR>
inoremap <C-s> <Esc> :w <CR> :Prettier <CR>


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




" ------------------------------/
"  Plugings specific Settings   /
" ------------------------------/

" &:BuffTabline

set hidden
nnoremap <Tab> :bnext<CR>
nnoremap <s><Tab> :bprev<CR>

" --------------------------------------------/

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

" Toggle the sidebar 
nnoremap <leader>e :NERDTreeToggle<CR>

" NerdTree Files management
" Hit m when hovering a file/folder
" Pick the needed option: a to add, etc

" --------------------------------------------

" &:Prettier 

" Adding the :Prettier command 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" --------------------------------------------

" &:Catppuccin

set termguicolors 
set background=dark 
colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'


" --------------------------------------------

" &:Startify

" https://github.com/mhinz/vim-startify/blob/master/doc/startify.txt

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

let g:startify_custom_header = g:ascii + startify#fortune#boxed()
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

" &:COC 

" pand by <Tab> C-n or C-p for next/previous 
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Auto install first extentions
let g:coc_global_extensions = [ 'coc-vimlsp', 'coc-tabnine', 'coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-html', 'coc-eslint', 'coc-emmet', 'coc-vetur', 'coc-unocss', 'coc-tsserver', 'coc-json', 'coc-css', '@yaegassy/coc-tailwindcss3' ]


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <Leader>cd  :<C-u>CocList diagnostics<cr>
" Manage [c]oc e[x]tensions
nnoremap <silent><nowait> <Leader>cx  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <Leader>cp  :<C-u>CocListResume<CR>

" --------------------------------------------

" End of Mappings section
" }}}
