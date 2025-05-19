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
vim.call('plug#end')

--Ultisnip options
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories={vim.fn.expand("~/.config/nvim/UltiSnips")}
vim.keymap.set('c', 'snip', 'UltiSnipsEdit')
