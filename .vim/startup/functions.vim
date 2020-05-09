"------------------------------------------------------------
"vim custom functions
"------------------------------------------------------------
command! SpellOn set spell spelllang=en_us
command! SpellOff set nospell
command! Bgd set background=dark
command! Bgl set background=light
"command -nargs=1 PadRight <f-args>s/.*/\=printf('%-72s',submatch(0))
command! Date r !date

" DELETE FILES 
function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction
"delete the current file
com! Rm call DeleteFile()
"delete the file and quit the buffer (quits vim if this was the last file)
com! RM call DeleteFile() <Bar> q!



function! SaveFile() abort
  let targets = filter(
        \ systemlist('xclip -selection clipboard -t TARGETS -o'),
        \ 'v:val =~# ''image''')
  if empty(targets) | return | endif

  let outdir = expand('%:p:h') . '/img'
  if !isdirectory(outdir)
    call mkdir(outdir)
  endif

  let mimetype = targets[0]
  let extension = split(mimetype, '/')[-1]
  let tmpfile = outdir . '/savefile_tmp.' . extension
  call system(printf('xclip -selection clipboard -t %s -o > %s',
        \ mimetype, tmpfile))

  let cnt = 0
  let filename = outdir . '/image' . cnt . '.' . extension
  while filereadable(filename)
    call system('diff ' . tmpfile . ' ' . filename)
    if !v:shell_error
      call delete(tmpfile)
      break
    endif

    let cnt += 1
    let filename = outdir . '/image' . cnt . '.' . extension
  endwhile

  if filereadable(tmpfile)
    call rename(tmpfile, filename)
  endif

  let @* = '[](' . fnamemodify(filename, ':.') . ')'
  normal! "*p
endfunction


"------------------------------------------------------------
"vim custom functions END
"------------------------------------------------------------



"------------------------------------------------------------
"vim custom remaps
"------------------------------------------------------------
"------------------------------------------------------------
"vim custom remamps END
"------------------------------------------------------------
