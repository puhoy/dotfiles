
" fzf search, excluding .gitignored files
nnoremap <S-f> :GFiles<cr>

" ctrl-y to yank path
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo' }





