" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5


" run all checks, even if first check fails
let g:syntastic_aggregate_errors = 1


let g:syntastic_python_checkers = ['flake8', 'mypy --python-executable=python']



