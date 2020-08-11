" autoformatting

let g:formatdef_json_formatter = "'python -m json.tool'"
let g:formatters_json = ['json_formatter']


let g:formatdef_autopep8 = "'autopep8 - --aggressive --aggressive --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']
noremap <C-A-l> :Autoformat<CR>


