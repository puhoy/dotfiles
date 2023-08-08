" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off
"filetype plugin on

" autosave & syntaxcheck (silent hides errors for unnamed buffers)
au FocusLost * :wa "|:SyntasticCheck

" check for file changes that happened outside of vim
au CursorHold,CursorHoldI * checktime

" use system clipboard
set clipboard=unnamed,unnamedplus

" preview substitutions
set inccommand=nosplit

set termguicolors  
set background=dark
"colorscheme tokyonight

colorscheme gruvbox
"set background=light "light theme

"set background=light
"colorscheme PaperColor
