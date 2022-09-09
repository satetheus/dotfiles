"set specific filetype autocmd to be enabled
filetype plugin on

"add automatic install of plugin manager, if no plugin are installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"install plugins
call plug#begin('~/.vim/plugged') "specify plugin directory
Plug 'Sirver/ultisnips' "snippet plugin
Plug 'lifepillar/vim-gruvbox8' "updated colorscheme
Plug 'vimwiki/vimwiki' "vim wiki
Plug 'pangloss/vim-javascript' "JavaScript support
Plug 'leafgarland/typescript-vim' "Typescript syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"set utf-8 as the default encoding
set encoding=utf-8

"set cursor positon display
set ruler

"turn off audio
set belloff=all

"tab settings
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

"prevent line wrapping
set textwidth=0
set wrapmargin=0

"highlight characters past the 80th column in red
function! LineLength() abort
    highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
    match OverLength /\%>80v.\+/
endfunction

"highlight non-ascii characters
function! OtherChars() abort
    syntax match nonascii "[^\x00-\x7F]"
    highlight nonascii guibg=Red ctermbg=2
endfunction

"test transparent background
function! Transparent() abort
    autocmd vimEnter * highlight Normal guibg=NONE ctermbg=NONE
    highlight VertSplit guibg=NONE ctermbg=NONE
    highlight StatusLine guibg=bg ctermbg=bg guifg=bg ctermfg=bg
    highlight StatusLineNc guibg=bg ctermbg=bg guifg=bg ctermfg=bg
    set laststatus=0
endfunction

"enact the custom highlights & colors
augroup CustomColors
    autocmd!
    autocmd Colorscheme * call LineLength()
    autocmd Colorscheme * call OtherChars()
    autocmd Colorscheme * call Transparent()
augroup END

"set indentation
set autoindent
filetype plugin indent on

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

"split settings, not working with vex
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
vnoremap ; :
vnoremap : ;
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Template Files
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
    autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
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

"CoC options
let g:coc_global_extensions = ['coc-tsserver']
let g:coc_disable_startup_warning = 1

"themeing
syntax on
set term=screen-256color
set t_ut=
set t_Co=256
set background=dark
colorscheme gruvbox8

"MACROS:
"aligns all words after first space at the 40th column
let @b="0f 40i 40|dwj"

"empty line remove with or without whitespace
let @w=";g/^$\|^s*$/dc"

"using words as separators, title case
let @c=";s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g"

"using spaces as separators, title case
let @s=";s/\<\(\w\)\(\S*\)/\u\1\L\2/g"

"vim non-sort remove duplicates:
let @u=";g/^\(.*\)$\n\1$/d"

