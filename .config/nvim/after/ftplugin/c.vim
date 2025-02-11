set commentstring=//\ %s

" Disable inserting comment leader after hitting o or O or <Enter>
set formatoptions-=o
set formatoptions-=r

nnoremap <silent> <buffer> <F9> :call <SID>compile_run_c(v:false)<CR>

function! s:compile_run_c(run) abort
  let src_path = expand('%:p:~')
  let src_out = expand('%:p:~:r') .. ".out"
  " The building flags
  let _flag = '-Wall -Wextra -O2'

  if executable('gcc')
    let prog = 'gcc'
  else
    echoerr 'No C compiler found on the system!'
  endif
  call s:create_term_buf('h', 20)
  execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_out, src_out)
 
  "echo 'term' prog _flag src_path '-o' src_out '&&' src_out
  startinsert
endfunction

function s:create_term_buf(_type, size) abort
  set splitbelow
  set splitright
  if a:_type ==# 'v'
    vnew
  else
    new
  endif
  execute 'resize ' . a:size
endfunction
