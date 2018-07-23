" Strip trailing whitespace, and remember cursor position
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

function! UpdatePowerSaving(timerId)
  if executable('pmset')
    call system("pmset -g batt | head -1 | grep 'Battery'")
    if !v:shell_error
      let g:ale_lint_delay=10000
    else
      let g:ale_lint_delay=200
    endif
  endif
endfunction

" call timer_start(10000, 'UpdatePowerSaving')

" Delete trailing whitespace on save
autocmd BufWritePre        {*.rb,*.js,*.coffee}                                                   :call <SID>StripTrailingWhitespaces()
autocmd BufRead,BufNewFile {Brewfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru}         set filetype=ruby
autocmd BufRead,BufNewFile {*.ex}                                                                 set filetype=elixir
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                                set filetype=markdown
autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                                       set filetype=gitcommit
autocmd BufRead,BufNewFile {*.json,.babelrc}                                                      set filetype=javascript
autocmd BufNewFile,BufRead *.tsx 																																	set filetype=typescript
" Resize splits when the window is resized
autocmd VimResized         *                                                                      exe "normal! \<c-w>="

augroup TerminalStuff
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
