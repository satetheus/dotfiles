--set specific filetype autocmd to be enabled
vim.cmd('filetype plugin on')

vim.cmd('source ~/.config/nvim/vim/macros.vim')
require('plugins')
require('colors')
require('filetypes')

function noremap(mode, mapping, cmd)
    vim.api.nvim_set_keymap(mode, mapping, cmd, { noremap = true, silent = true })
end

--tab settings
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.listchars:append({tab = "->"}) --visualize tabs

--show whitespace at end of line
vim.opt.listchars:append({trail = "."})
vim.o.list = true

--set line numbering
vim.o.number = true

--absolute line numbering on non-active windows, relative on active windows.
vim.api.nvim_create_augroup('numbertoggle', {clear = true})
vim.cmd([[
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost   * set norelativenumber
augroup END
]])

--search options, ignorecase is necessary for smartcase
vim.o.ignorecase = true
vim.o.smartcase = true

--split settings, not working with vex
vim.o.splitbelow = true
vim.o.splitright = true
vim.opt.fillchars:append({vert = ' '})

--easier file search
vim.cmd('cabbrev vex Vexplore!')
vim.cmd('cabbrev ex Explore')
vim.cmd('cabbrev sex Sexplore')

--remove banner in file explorer
vim.g.netrw_banner = 0

--quality of life key remaps
noremap('', ';', ':')
noremap('', ':', ';')
noremap('n', '<C-h>', '<C-w>h')
noremap('n', '<C-j>', '<C-w>j')
noremap('n', '<C-k>', '<C-w>k')
noremap('n', '<C-l>', '<C-w>l')

-- write with sudo trick alias
noremap('c', 'w!!', 'w !sudo tee > /dev/null %')

--clear highlight
noremap('', '<leader>c', '<cmd>noh<CR>')

--save to clipboard (wsl only)
noremap('c', 'wc', 'w !clip.exe')

--reload init.lua
noremap('', '<leader>r', '<cmd>source ~/.config/nvim/init.lua<CR>')

---gmk auth tool
noremap('', '<leader>a', ':vnew\:r !gac ')

--toggle overlength highlight
noremap('', '<leader>o', ':lua ToggleLineLength()<CR>')

--toggle "paste" setting to maintain spacing
noremap('', '<leader>p', ':set invpaste paste?<CR>')


--set sift to be used by :grep
if vim.fn.executable("sift") then
    vim.o.grepprg="sift --ignore-case --filename -n"
    vim.o.grepformat="%f:%l:%c:%m,%f:%l:%m"
    vim.cmd([[command! -nargs=+ Sift execute 'silent grep! <args>' | copen]])
    noremap('', '<leader>s', ';Sift')
end

vim.cmd('let $BASH_ENV = "~/.aliases"')
