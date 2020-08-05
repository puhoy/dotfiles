
" override git sidebar highlights
"" changed to diff against latest commit, not against unstaged
let g:signify_vcs_cmds = {
      \ 'git':      'git diff HEAD --no-color --no-ext-diff -U0 -- %f',
      \ 'yadm':     'yadm diff --no-color --no-ext-diff -U0 -- %f',
      \ 'hg':       'hg diff --color=never --config aliases.diff= --nodates -U0 -- %f',
      \ 'svn':      'svn diff --diff-cmd %d -x -U0 -- %f',
      \ 'bzr':      'bzr diff --using %d --diff-options=-U0 -- %f',
      \ 'darcs':    'darcs diff --no-pause-for-gui --no-unified --diff-opts=-U0 -- %f',
      \ 'fossil':   'fossil diff --unified -c 0 -- %f',
      \ 'cvs':      'cvs diff -U0 -- %f',
      \ 'rcs':      'rcsdiff -U0 %f 2>%n',
      \ 'accurev':  'accurev diff %f -- -U0',
      \ 'tfs':      'tf diff -version:W -noprompt -format:Unified %f'
      \ }
