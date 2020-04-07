" Don't try to be vi compatible
" set nocompatible
"
" " Helps force plugins to load correctly when it is turned back on below
" filetype off
"
" " TODO: Load plugins here (pathogen or vundle)
"
" " Turn on syntax highlighting
" syntax on
"
" " For plugins to load correctly
" filetype plugin indent on
"
" " TODO: Pick a leader key
" " let mapleader = ","
"
" " Security
" set modelines=0
"
" " Show line numbers
" set number
"
" " Show file stats
" set ruler
"
" " Blink cursor on error instead of beeping (grr)
" set visualbell
"
" " Encoding
" set encoding=utf-8
"
" " Whitespace
" set wrap
" set textwidth=79
" set formatoptions=tcqrn1
" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set expandtab
" set noshiftround
"
" " Cursor motion
" set scrolloff=3
" set backspace=indent,eol,start
" set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim
"
" " Move up/down editor lines
" nnoremap j gj
" nnoremap k gk
"
" " Allow hidden buffers
" set hidden
"
" " Rendering
" set ttyfast
"
" " Status bar
" set laststatus=2
"
" " Last line
" set showmode
" set showcmd
"
" " Searching
" nnoremap / /\v
" vnoremap / /\v
" set hlsearch
" set incsearch
" set ignorecase
" set smartcase
" set showmatch
" map <leader><space> :let @/=''<cr> " clear search
"
" " Remap help key.
" inoremap <F1> <ESC>:set invfullscreen<CR>a
" nnoremap <F1> :set invfullscreen<CR>
" vnoremap <F1> :set invfullscreen<CR>
"
" " Textmate holdouts
"
" " Formatting
" map <leader>q gqip
"
" " Visualize tabs and newlines
" set listchars=tab:Î
"s to enable by default:
"" set list " To enable by default
" Or use your leader key + l to toggle on/off
" map <leader>l :set list!<CR> " Toggle tabs and EOL
"
" " Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1

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

"key remaps
nnoremap ; :
nnoremap : ;

"themeing
syntax on
set t_Co=256
set background=dark
colorscheme deus

"macros
let @r=":%s/ \\+\\d\\+: \\+//"
let @a=":%s/ as .*//"
let @c=":g/^$/d+2"
let @f=":%s/\\vfrom (.*) import .*/import \\1/"
let @i=":%s/import //"
let @p=":%s/\\..*//"
let @t="ggdd@r@a@c@f:g/import \\./d@i@p:sort u"

