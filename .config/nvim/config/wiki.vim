
command! WikiAutoCommit !cd ~/notes/;
            \ git add -A;
            \ git commit -m "Auto commit";
command! WikiNow execute ':edit ~/notes/journal/' . strftime('%Y_%m') . '.md'
command! Wiki execute ':edit ~/notes/index.md'

command! -bang -nargs=* WikiTags
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --only-matching --ignore-case  "(\s|^)#\w+"', 1,
  \   fzf#vim#with_preview(), <bang>0)

