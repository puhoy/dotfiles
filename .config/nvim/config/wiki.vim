
let g:wiki_base = '~/notes/'
" use a file per month
let g:wiki_journal_file_pattern = '%Y/%m'
let g:wiki_note_file_pattern = 'journal/notes/%Y/%m%d_' " argument will be appended


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

function! wiki#slug(s) " {{{1
    " stolen from https://github.com/xolox/vim-misc/blob/3e6b8fb6f03f13434543ce1f5d24f6a5d3f34f0b/autoload/xolox/misc/str.vim
  " Convert a string to a "slug" - something that can be safely used in
  " filenames and URLs without worrying about quoting/escaping of special
  " characters.
  return join(split(tolower(a:s), '\W\+'), '_')
endfunction

command! -nargs=1 WikiNote execute ':edit ' . g:wiki_base . strftime(g:wiki_note_file_pattern) . wiki#slug(<q-args>) . '.md'


"command! WikiIncoming call setloclist(0, map(systemlist('Rg "%:."'), {_, p -> {'filename': p}}))


" match on [(
" complete on all notes-files relative to current file path
function WikiRegisterCompletion()
if expand('%:p') =~ '^' . expand(g:wiki_base.':p')
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
