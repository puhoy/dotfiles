

" waikiki config
let g:waikiki_roots = ['~/notes/']
let g:waikiki_default_maps = 1
let g:waikiki_done = "X"
nn <Leader>ww :e ~/notes/index.md<cr>

augroup waikiki
au! BufWritePost ~/notes/* !git add "%";git commit -m "Auto commit of %:t." "%"
command! Now execute ':edit ~/notes/journal/' . strftime('%Y_%m') . '.md'
augroup END


