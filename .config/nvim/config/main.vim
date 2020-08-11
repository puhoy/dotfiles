" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off
" remove unused imports
"" python (needs autoflake)
autocmd FileType python noremap <C-A-o> :!autoflake --in-place --remove-unused-variables %<CR>

" autosave & syntaxcheck (silent hides errors for unnamed buffers)
:au FocusLost * silent! :wa|:SyntasticCheck

" use system python, not venv
let g:python3_host_prog = '/usr/bin/python3'

" use system clipboard
set clipboard=unnamed,unnamedplus

" preview substitutions
set inccommand=nosplit


" Color scheme (terminal)
"set t_Co=256
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
colorscheme gruvbox
set background=dark "dark theme
