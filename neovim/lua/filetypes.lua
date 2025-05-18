local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--Template Files
local template_cmd = '0r ~/.config/nvim/templates/skeleton'
augroup('templates', {clear = true})
autocmd('BufNewFile', {group='templates', pattern='*.sh', command=template_cmd .. '.sh'})
autocmd('BufNewFile', {group='templates', pattern='*.py', command=template_cmd .. '.py'})
autocmd('BufNewFile', {group='templates', pattern='*.pl', command=template_cmd .. '.pl'})
autocmd('BufNewFile', {group='templates', pattern='*.js', command=template_cmd .. '.js'})
autocmd('BufNewFile', {group='templates', pattern='*.html', command=template_cmd .. '.html'})


--Linting
local make_cmd = 'silent make <afile> | silent redraw!'
augroup('linting', {clear = true})
autocmd('FileType', {group='linting', pattern='python', command='compiler pylint'})
autocmd('BufWritePost', {group='linting', pattern='*.py', command=make_cmd})

autocmd('FileType', {group='linting', pattern='javascript', command='compiler eslint'})
autocmd('BufWritePost', {group='linting', pattern='*.js', command=make_cmd})

autocmd('FileType', {group='linting', pattern='bash', command='compiler shellcheck'})
autocmd('BufWritePost', {group='linting', pattern='*.sh', command=make_cmd})

autocmd('FileType', {group='linting', pattern='rust', command='compiler cargo'})
autocmd('BufWritePost', {group='linting', pattern='*.rs', command=make_cmd})

autocmd('FileType', {group='linting', pattern='lua', command='setlocal makeprg="luac -p % | setlocal errorformat=%m"'})
autocmd('BufWritePost', {group='linting', pattern='*.lua', command=make_cmd})
autocmd('QuickFixCmdPost', {group='linting', pattern='[^l]*', command='cwindow'})
