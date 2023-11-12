--add automatic install of plugin manager, if no plugin are installed
vim.cmd [[
if empty(glob('$HOME/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
]]

--install plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.vim/plugged') --specify plugin directory
    Plug 'Sirver/ultisnips' --snippet plugin
    Plug 'lifepillar/vim-gruvbox8' --updated colorscheme
    Plug 'vimwiki/vimwiki' --vim wiki
    Plug('pangloss/vim-javascript', {['for'] = 'javascript'}) --JavaScript support
    Plug('leafgarland/typescript-vim', {['for'] = 'typescript'}) --Typescript syntax
    Plug('neoclide/coc.nvim', {branch = 'release'})
    Plug('github/copilot.vim')
vim.call('plug#end')

--Ultisnip options
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.cmd [[
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
]]
vim.cmd('cabbrev snip UltiSnipsEdit')

--CoC options
vim.cmd [[
let g:coc_global_extensions=['coc-tsserver']
]]
vim.g.coc_disable_startup_warning = 1
