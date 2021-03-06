let s:source = {
      \ 'name': 'drikin',
      \ 'kind': 'plugin',
      \ }

function! s:source.initialize()
  call neocomplcache#set_completion_length('drikin', 1)
endfunction

function! s:source.finalize()
endfunction

function! s:source.get_keyword_pos(cur_text)
  return s:last_matchend(a:cur_text[:getpos('.')[2]], '\W')
endfunction

function! s:source.get_keyword_list(cur_keyword_str)
  echo a:cur_keyword_str
  if a:cur_keyword_str =~ '^d\(r\(i\(k\(in\?\)\?\)\?\)\?\)\?$'
    return [{'word': '青木剛一', 'menu': 'drikin'}]
  endif
  return []
endfunction

function! neocomplcache#sources#drikin#define()
  return s:source
endfunction

function! s:last_matchend(str, pat)
  let l:idx = matchend(a:str, a:pat)
  let l:ret = 0
  while l:idx != -1
    let l:ret = l:idx
    let l:idx = matchend(a:str, a:pat, l:ret)
  endwhile
  return l:ret
endfunction
