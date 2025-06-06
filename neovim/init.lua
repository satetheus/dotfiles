--set specific filetype autocmd to be enabled
vim.cmd('filetype plugin on')

vim.cmd('source ~/.config/nvim/vim/macros.vim')
require('plugins')
require('colors')
require('filetypes')

-- set local variable for simple conversion to lua
local set = vim.opt

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
vim.api.nvim_create_augroup('numbertoggle', {clear = true})
vim.cmd([[
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
]])

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
vim.cmd('cabbrev vex Vexplore!')
vim.cmd('cabbrev ex Explore')
vim.cmd('cabbrev sex Sexplore')

--remove banner in file explorer
vim.g.netrw_banner = 0

--quality of life key remaps
vim.api.nvim_set_keymap('', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('', ':', ';', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- write with sudo trick alias
vim.api.nvim_set_keymap('c', 'w!!', 'w !sudo tee > /dev/null %', {noremap = true})

--clear highlight
vim.api.nvim_set_keymap('', '<leader>c', '<cmd>noh<CR>', {noremap = true})

--save to clipboard (wsl only)
vim.api.nvim_set_keymap('c', 'wc', 'w !clip.exe', {noremap = true})

--reload init.lua
vim.api.nvim_set_keymap('', '<leader>r', '<cmd>source ~/.config/nvim/init.lua<CR>', {noremap = true})

---gmk auth tool
vim.api.nvim_set_keymap('', '<leader>a', ':vnew\:r !gac ', {noremap = true})

--toggle overlength highlight
vim.api.nvim_set_keymap('', '<leader>o', ':lua ToggleLineLength()<CR>', {noremap = true, silent = true})

--toggle "paste" setting to maintain spacing
vim.api.nvim_set_keymap('', '<leader>p', ':set invpaste paste?<CR>', {noremap = true, silent = true})


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
