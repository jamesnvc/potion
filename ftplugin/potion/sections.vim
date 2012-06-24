function! s:NextSection(type, backwards, visual)
  if a:visual
    normal! gv
  endif

  if a:type == 1
    let pattern = '\v(\n\n^\S|%^)'
    let flags = 'e'
  elseif a:type == 2
    let pattern = '\v^\S.*\=.*:$'
    let flags = ''
  endif

  let dir = {'0': '/', '1': '?'}[a:backwards]

  execute 'silent normal! ' . dir . pattern . dir . flags . "\r"
endfunction

noremap <script> <buffer> <silent> ]] :call <SID>NextSection(1, 0, 0)<CR>
noremap <script> <buffer> <silent> [[ :call <SID>NextSection(1, 1, 0)<CR>
noremap <script> <buffer> <silent> ][ :call <SID>NextSection(2, 0, 0)<CR>
noremap <script> <buffer> <silent> [] :call <SID>NextSection(2, 1, 0)<CR>

vnoremap <script> <buffer> <silent> ]] :<C-u>call <SID>NextSection(1, 0, 1)<CR>
vnoremap <script> <buffer> <silent> [[ :<C-u>call <SID>NextSection(1, 1, 1)<CR>
vnoremap <script> <buffer> <silent> ][ :<C-u>call <SID>NextSection(2, 0, 1)<CR>
vnoremap <script> <buffer> <silent> [] :<C-u>call <SID>NextSection(2, 1, 1)<CR>
