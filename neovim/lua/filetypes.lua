--Template Files
vim.cmd([[
augroup templates
  autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
  autocmd BufNewFile *.py 0r ~/.config/nvim/templates/skeleton.py
  autocmd BufNewFile *.pl 0r ~/.config/nvim/templates/skeleton.pl
  autocmd BufNewFile *.html 0r ~/.config/nvim/templates/skeleton.html
  autocmd BufNewFile *.js 0r ~/.config/nvim/templates/skeleton.js
augroup END
]])

vim.cmd([[
augroup helpfiles
  au!
  au BufEnter */doc/* if &filetype=='help' | wincmd L | endif
]])

-- large file handling
vim.cmd([[
if !exists("my_auto_commands_loaded")
    let my_auto_commands_loaded = 1
    let g:LargeFile = 1024 * 1024 * 10
    augroup LargeFile
        autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
    augroup END
endif
]])
