
"" open automatically when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'Fern . -drawer -width=30' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif



" toggle on ctrl-n
map <C-n> :NERDTreeToggle<CR>

"" show hidden files
let NERDTreeShowHidden=1

" dont show help notification
let NERDTreeMinimalUI = 1

"" ignore files
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'tags']


