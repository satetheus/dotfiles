"add automatic install of plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"specify plugin directory
call plug#begin('~/.vim/plugged')

"fuzzy finder
Plug 'junegunn/fzf'

"prevent creation of backups & swp files, muddles git history
set nobackup
set noswapfile

"set cursor positon display
set ruler

"set change tabs to spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"prevent line wrapping
set textwidth=0
set wrapmargin=0

"relative line numbering
set nonu
set rnu

"search options
set hlsearch

"easier file search
cabbrev vex Vex
cabbrev ex Ex
cabbrev sex Sex

"key remaps
nnoremap ; :
nnoremap : ;

"themeing
syntax on
set term=screen-256color
set t_ut=
set t_Co=256
set background=dark
colorscheme deus

"MACROS:
"document formatting for markup conversion to confluence table
let @m="0xi||f dwi||f a_€kb||||||d$j@t"
let @d="03f|lyt|3f|pj@d"
let @q='0f1x"nPF|l"nyt|j@i'

"aligns all words after first space at the 40th column
let @b="0f 40i 40|dwj"

"format downloaded confluence table
let @j=";v/€üV/-1j!"
let @t="/€üVxi€üCkkJgg@t"
let @l=';%s/","/|/g;%s/"/|/g'
