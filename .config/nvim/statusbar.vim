" StatusBar:

if has("statusline") && !&cp
  set ruler                         " display coordinates in status bar
  set showmode                      " display the current mode in the status bar
  set laststatus=2                  " always show the status bar

  "statusline setup
  set statusline =%#identifier#
  set statusline+=\ %t\     "tail of the filename
  set statusline+=%*

  "display a warning if fileformat isnt unix
  set statusline+=%#warningmsg#
  set statusline+=%{&ff!='unix'?'['.&ff.']':''}
  set statusline+=%*

  "display a warning if file encoding isnt utf-8
  set statusline+=%#warningmsg#
  set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
  set statusline+=%*

  "read only flag
  set statusline+=%#identifier#
  set statusline+=%r
  set statusline+=%*

  "modified flag
  set statusline+=%#identifier#
  set statusline+=%m
  set statusline+=%*

  set statusline+=%{fugitive#statusline()}

  set statusline+=\ %Y\       "filetype

  "display a warning if &paste is set
  set statusline+=%#error#
  set statusline+=%{&paste?'[paste]':''}
  set statusline+=%*

  set statusline+=%=      "left/right separator
  set statusline+=%c,     "cursor column
  set statusline+=%l      "cursor line
  set statusline+=\ %P    "percent through file
endif
