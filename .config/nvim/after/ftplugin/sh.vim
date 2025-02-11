nnoremap <silent> <buffer> <F9> :call <SID>run_script()<CR>

function! s:run_script() abort
  let src_path = expand('%:p')

  call s:create_term_buf('h', 20)
  execute printf('term %s', src_path)
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
