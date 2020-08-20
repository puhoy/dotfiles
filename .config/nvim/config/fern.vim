
let g:fern#renderer = "nerdfont"

" exclude stuff from tree
let g:fern#default_exclude= '^\%(__pycache__\)$' " '^\%(__pycache__\|env\)$'

" show hidden files
let g:fern#default_hidden = 1

" toggle on ctrl-n
map <C-n> :Fern . -drawer -toggle<CR>
" jump to current file in tree, jump back to buffer
map <C-m> :Fern . -drawer -reveal=%<CR><C-w><C-p> 


" reload tree on R
function s:init_fern_mapping_reload_all()
    nmap <buffer> R <Plug>(fern-action-reload:all)
endfunction
augroup my-fern-mapping-reload-all
    autocmd! *
    autocmd FileType fern call s:init_fern_mapping_reload_all()
augroup END


" Replace Netrw {{{
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern -drawer %s', fnameescape(path))
endfunction

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END
" }}}



