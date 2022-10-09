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
