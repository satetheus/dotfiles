"add automatic install of plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"specify plugin directory
call plug#begin('~/.vim/plugged')

"snippet plugin
Plug 'Sirver/ultisnips'

"fuzzy finder
Plug 'junegunn/fzf'

"colorscheme
Plug 'ajmwagar/vim-deus'

"visual incrementor
Plug 'triglav/vim-visual-increment'

"snippets plugin
Plug 'SirVer/ultisnips'

"codota code completion
"Plug 'zxqfl/tabnine-vim'

cal  plug#end()

"set utf-8 as the default encoding
set encoding=utf-8

"set cursor positon display
set ruler

"set change tabs to spaces in python files only
autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

"prevent line wrapping
set textwidth=0
set wrapmargin=0

"Implemented JPMH's method for highlighting overlength
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

"show whitespace at end of line
set listchars=trail:.
set list

"hybrid line numbering
set number relativenumber

"absolute line numbering on non-active windows
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

"search options
set hlsearch
set ignorecase
set smartcase
set incsearch

"split settings
set splitbelow splitright
set fillchars+=vert:\ 

"easier file search
cabbrev vex Vex
cabbrev ex Ex
cabbrev sex Sex

"key remaps
nnoremap ; :
nnoremap : ;
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <Leader>tt :vnew term://bash<CR>

"Ultisnip options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

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

"empty line remove with or without whitespace
let @w=";g/^$\|^s*$/d"

"using words as separators, title case
let @c=";s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g"

"using spaces as separators, title case
let @s=";s/\<\(\w\)\(\S*\)/\u\1\L\2/g"

"vim non-sort remove duplicates:
let @u=";g/^\(.*\)$\n\1$/d"

"convert etl columns to test form, nutrien specific
let @r=";%s/cast(\".*\", \\(\".*\"\\), .*to_name=\\(\".*\"\\)),/(\2, \1),g"

