
let g:wiki_base = '/home/meatpuppet/notes/'
" use a file per month
let g:wiki_journal_file_pattern = '%Y/%m'


command! WikiAutoCommit :wa | 
            \ !cd ~/notes/;
            \ git add -A;
            \ git commit -m "Auto commit";
command! WikiNow execute ':edit ' . g:wiki_base . 'journal/' . strftime(g:wiki_journal_file_pattern) . '.md'
command! Wiki execute ':edit ' . g:wiki_base . 'index.md'

command! -bang -nargs=* WikiTags
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --only-matching --ignore-case  "(\s|^)#\w+"', 1,
  \   fzf#vim#with_preview(), <bang>0)


command! WikiDict execute ':!dict <cword>'


"command! WikiIncoming call setloclist(0, map(systemlist('Rg "%:."'), {_, p -> {'filename': p}}))


" match on [(
" complete on all notes-files relative to current file path
function WikiRegisterCompletion()
if expand('%:p') =~ '^' . g:wiki_base
  let g:notes_files = {
              \ 'name': 'notes',
              \ 'complete_length': -1,
              \ 'complete_pattern': [ ']\('],  
              \ 'scope': [ 'markdown' ],
              \ 'on_complete': {c -> ncm2#complete(c,
              \       c.startccol, 
              \       systemlist('rg --files ' . g:wiki_base . ' | xargs realpath --relative-to=' . expand('%:h'))
              \       )},
              \ }
  call ncm2#register_source(g:notes_files)
endif
endfunction

call WikiRegisterCompletion()
