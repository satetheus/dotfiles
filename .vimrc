"just in case, & if wanted to put vimrc somewhere else & use the '-u' flag
"with vim
set nocompatible

"set specific filetype autocmd to be enabled
filetype plugin on

"add automatic install of plugin manager
" How could I setup automatic install & update of all plugins without slowing
" down vim startup? Should only the initial install be automatic?
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

"vim wiki
Plug 'vimwiki/vimwiki'

"syntax checker
Plug 'vim-syntastic/syntastic'

call plug#end()

"set utf-8 as the default encoding
set encoding=utf-8

"set cursor positon display
set ruler

"turn off audio
set belloff=all

"set change tabs to spaces in python files only
autocmd FileType * set tabstop=4|set shiftwidth=4|set expandtab

"prevent line wrapping
set textwidth=0
set wrapmargin=0

"Implemented JPMH's method for highlighting overlength, not functional with
"current styling
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

"highlight non-ascii characters, not functional with current styling
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

"show whitespace at end of line
set listchars=trail:.
set list

"set line numbering
set number

"absolute line numbering on non-active windows, relative on active windows.
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END

"search options, ignorecase is necessary for smartcase
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

" write with sudo trick alias
cnoremap w!! w !sudo tee > /dev/null %

"remove banner in file explorer
let g:netrw_banner = 0

"key remaps
nnoremap ; :
nnoremap : ;
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"dont know what this is for now.
map <Leader>tt :vnew term://bash<CR>

"Template Files
" Could this be done with a function for easier template additions?
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
  augroup END
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.js 0r ~/.vim/templates/skeleton.js
  augroup END
endif

"Ultisnip options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsEditSplit="vertical"
cabbrev snip UltiSnipsEdit

"Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatusFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"themeing
syntax on
set term=screen-256color
set t_ut=
set t_Co=256
set background=dark
colorscheme deus

"MACROS:
"aligns all words after first space at the 40th column
let @b="0f 40i 40|dwj"

"format downloaded confluence table
let @j=";v/€üV/-1j!"
let @t="/€üVxi€üCkkJgg@t"

"empty line remove with or without whitespace
let @w=";g/^$\|^s*$/dc"

"using words as separators, title case
let @c=";s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g"

"using spaces as separators, title case
let @s=";s/\<\(\w\)\(\S*\)/\u\1\L\2/g"

"vim non-sort remove duplicates:
let @u=";g/^\(.*\)$\n\1$/d"

