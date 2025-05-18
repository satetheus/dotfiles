--set specific filetype autocmd to be enabled
vim.cmd('filetype plugin on')

vim.cmd('source ~/.config/nvim/vim/macros.vim')
require('plugins')
require('colors')
require('filetypes')

-- set local variable for simple conversion to lua
local set = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--disable mouse
vim.cmd([[set mouse=]])

--tab settings
set.tabstop = 8
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.listchars:append({tab = "->"}) --visualize tabs

--show whitespace at end of line
set.listchars:append({trail = "."})
set.list = true

--set.line numbering
set.number = true

--absolute line numbering on non-active windows, relative on active windows.
augroup('numbertoggle', {clear = true})
autocmd({'BufEnter','FocusGained'}, {group='numbertoggle', command='set relativenumber'})
autocmd({'BufLeave','FocusLost'}, {group='numbertoggle', command='set norelativenumber'})

--search options, ignorecase is necessary for smartcase
set.ignorecase = true
set.smartcase = true

--split settings
set.splitbelow = true
set.splitright = true
set.fillchars:append({vert = ' '})

--ctags configuration
--this is so ctags files can be in the .git directory to avoid commiting
vim.opt.tags:prepend('.git/tags;~')

--easier file search
vim.keymap.set('c', 'vex', 'Vexplore!')
vim.keymap.set('c', 'ex', 'Explore')
vim.keymap.set('c', 'sex', 'Sexplore')

--remove banner in file explorer
vim.g.netrw_banner = 0

--quality of life key remaps
vim.keymap.set('', ';', ':')
vim.keymap.set('', ':', ';')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- write with sudo trick alias
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

--clear highlight
vim.keymap.set('', '<leader>c', '<cmd>noh<CR>')

--save to clipboard (wsl only)
vim.keymap.set('c', 'wc', 'w !clip.exe')

--reload init.lua
vim.keymap.set('', '<leader>r', '<cmd>source ~/.config/nvim/init.lua<CR>')

---gmk auth tool
vim.keymap.set('', '<leader>a', ':vnew\:r !gac ')

--toggle overlength highlight
vim.keymap.set('', '<leader>o', ':lua ToggleLineLength()<CR>', {silent = true})

--toggle "paste" setting to maintain spacing
vim.keymap.set('', '<leader>p', ':set invpaste paste?<CR>', {silent = true})


--set ripgrep to be used by :grep
vim.cmd([[
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    command! -nargs=+ Rg execute 'silent grep! <args>' | copen
    map <leader>s ;Rg 
endif
]])

vim.cmd('let $BASH_ENV = "~/.aliases"')
