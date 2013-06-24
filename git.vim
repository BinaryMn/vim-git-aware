" Returns current git branch.
" Call inside 'statusline' or 'titlestring'.
function! GitBranch()
    let git_dir = <SID>GetGitDir()

    if strlen(git_dir) && filereadable(git_dir . '/HEAD')
        let lines = readfile(git_dir . '/HEAD')
        if !len(lines)
            return ''
        else
            return matchstr(lines[0], 'refs/heads/\zs.\+$')
        endif
    else
        return ''
    endif
endfunction

" Create highlight group for extra whitespaces and highlight them (based off https://github.com/bronson/vim-trailing-whitespace/blob/master/plugin/trailing-whitespace.vim)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd FileReadPre * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
