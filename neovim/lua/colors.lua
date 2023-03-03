-- Set a flag to track the line length highlighting status
local line_length_highlighting_on = false

--highlight characters past the 80th column in red if toggled
function ToggleLineLength()
    if line_length_highlighting_on then
        vim.cmd[[
        match none
        highlight clear OverLength
        ]]
        line_length_highlighting_on = false
    else
        vim.cmd[[
        highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
        match OverLength /\%>80v.\+/
        ]]
        line_length_highlighting_on = true
    end
end

--highlight non-ascii characters
function OtherChars()
    vim.cmd[[
    syntax match nonascii "[^\x00-\x7F]"
    highlight nonascii guibg=Red ctermbg=2
    ]]
end

--transparent background
function Transparent()
    vim.cmd[[
    autocmd vimEnter * highlight Normal guibg=NONE ctermbg=NONE
    highlight VertSplit guibg=NONE ctermbg=NONE
    highlight StatusLine guibg=bg ctermbg=bg guifg=bg ctermfg=bg
    highlight StatusLineNc guibg=bg ctermbg=bg guifg=bg ctermfg=bg
    ]]
    vim.opt.laststatus = 0
end

--enact the custom highlights & colors
vim.api.nvim_create_augroup('CustomColors', {clear = true})
vim.api.nvim_create_autocmd({"Colorscheme"}, {group = 'CustomColors', pattern = {'*'}, callback = ToggleLineLength})
vim.api.nvim_create_autocmd({"Colorscheme"}, {group = 'CustomColors', pattern = {'*'}, callback = OtherChars})
vim.api.nvim_create_autocmd({"Colorscheme"}, {group = 'CustomColors', pattern = {'*'}, callback = Transparent})

--theme
vim.cmd('colorscheme gruvbox8')
