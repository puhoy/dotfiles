" autoformatting
let g:formatdef_xml_formatter = '"xmllint --format -"'
let g:formatters_xml = ['xml_formatter']

let g:formatdef_json_formatter = '"python -m json.tool"'
let g:formatters_json = ['json_formatter']

let g:formatters_python = ['black']
noremap <F3> :Autoformat<CR>


