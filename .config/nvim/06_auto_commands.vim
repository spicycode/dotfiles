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
autocmd BufRead,BufNewFile {Brewfile,Guardfile,Gemfile,Rakefile,Capfile,*.rake,config.ru}         set ft=ruby
autocmd BufRead,BufNewFile {*.coffee.erb}                                                         set ft=coffee
autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                                                set ft=markdown
autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                                       set ft=gitcommit
autocmd BufRead,BufNewFile {*.json,.babelrc}                                                      set ft=javascript
" Resize splits when the window is resized
autocmd VimResized         *                                                                      exe "normal! \<c-w>="

