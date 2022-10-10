--set specific filetype autocmd to be enabled
vim.cmd('filetype plugin on')

vim.cmd('source ~/.config/nvim/vim/macros.vim')
require('plugins')
require('colors')
require('filetypes')

-- set local variable for simple conversion to lua
local set = vim.opt

--tab settings
set.tabstop = 8
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

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

--split settings, not working with vex
set.splitbelow = true
set.splitright = true
set.fillchars:append({vert = ' '})

--easier file search
vim.cmd('cabbrev vex Vex')
vim.cmd('cabbrev ex Ex')
vim.cmd('cabbrev sex Sex')

--remove banner in file explorer
vim.cmd('let g:netrw_banner = 0')

--quality of life key remaps
vim.api.nvim_set_keymap('', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('', ':', ';', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})

-- write with sudo trick alias
vim.keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

--clear highlight
vim.api.nvim_set_keymap('', '<leader>c', '<cmd>noh<CR>', {noremap = true})

--set sift to be used by :grep
vim.cmd([[
if executable("sift")
    set grepprg=sift\ --ignore-case\ --filename\ -n
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    command! -nargs=+ Sift execute 'silent grep! <args>' | copen
    map <leader>s ;Sift 
endif
]])