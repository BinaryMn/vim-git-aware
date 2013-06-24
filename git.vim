" Create highlight group for extra whitespaces and highlight them (based off https://github.com/bronson/vim-trailing-whitespace/blob/master/plugin/trailing-whitespace.vim)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd FileReadPre * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
