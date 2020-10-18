let g:vimwiki_list = [{'path': '~/notes/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

augroup vimwiki
command! Autocommit !git add -A;git commit -m "Auto commit of %:t."
command! Now execute ':edit ~/notes/journal/' . strftime('%Y_%m') . '.md'
augroup END

