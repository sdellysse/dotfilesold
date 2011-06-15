set nocompatible          "dont emulate vi
let mapleader=" "

""""""""""""""""""""""""
" Plugin manager "
""""""""""""""""""""""""
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on

"""""""""""""""""""""""""
" General options "
"""""""""""""""""""""""""
set background=dark       "make sure vim knows bg is dark
set showmode              "display current mode
set showcmd               "display partially typed commands
set nowrap                "dont wrap long lines
set tabstop=4
set shiftwidth=4          "indent two spaces
set shiftround            "Round indent to multiple of 'shiftwidth'
set expandtab             "insert spaces instead of tab
set ruler                 "turn of position on bottom
set number                "turn on line numbers
set showmatch             "highlight matching brackets
set nobackup              "backups are for wimps
set pastetoggle=<F12>     "press when pasting multiple lines
set title                 "set the terminal title to the filename
set scrolloff=9           "start scrolling when hits this many lines from edge
set showtabline=2         "always show tab bar
set ofu=syntaxcomplete#Complete
colorscheme desertink

""""""""""""""""""""""
" Disable arrow keys "
""""""""""""""""""""""
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
nmap      <Up>     [e
nmap      <Down>   ]e
vmap      <Up>     [egv
vmap      <Down>   ]egv
"noremap   <Up>     <NOP>
"noremap   <Down>   <NOP>
"noremap   <Left>   <NOP>
"noremap   <Right>  <NOP>

"""""""""""""""""""""
" NERDTree bindings "
"""""""""""""""""""""
map <Leader>d :NERDTreeToggle<CR>

"""""""""""""""""""""""""
" Split-window Bindings "
"""""""""""""""""""""""""
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

""""""""
" Sudo "
""""""""
cmap w!! %!sudo tee > /dev/null %

"""""""""""""""""
" Tab Shortcuts "
"""""""""""""""""
map <Leader>n :tabnew<CR>
map <Leader>c :tabclose<CR>

""""""""""""""""""""
" TComment Binding "
""""""""""""""""""""
map <Leader>C <C-_><C-_>

"""""""""""""""""""""""""
" VIMRC edit and reload "
"""""""""""""""""""""""""
map <Leader>v :tabnew ~/.vimrc<CR>:echo "Editing VIMRC"<CR>
map <Leader>V :source ~/.vimrc<CR>:echo "Reloaded VIMRC"<CR>

if has("autocmd")
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " When editing a file, always jump to the last cursor position "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""
  " Remove trailing whitespace from code files on save "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""
  function! StripTrailingWhitespace()
    silent exe "normal ma<CR>"
    %s/\s\+$//e
    silent exe "normal `a<CR>"
  endfunction
  autocmd BufWritePre *  call StripTrailingWhitespace()

endif
