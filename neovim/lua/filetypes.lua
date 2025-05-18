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
augroup linting
  autocmd!
  autocmd FileType python compiler pylint
  autocmd BufWritePost *.py silent make <afile> | silent redraw!

  autocmd FileType javascript compiler eslint
  autocmd BufWritePost *.js silent make <afile> | silent redraw!

  autocmd FileType bash compiler shellcheck
  autocmd BufWritePost *.sh silent make <afile> | silent redraw!

  autocmd FileType rust compiler cargo
  autocmd BufWritePost *.rs silent make <afile> | silent redraw!

  autocmd QuickFixCmdPost [^l]* cwindow
augroup END
]])
