
nnoremap <leader>t :NvimTreeRefresh<CR> :NvimTreeFindFileToggle<CR>
nnoremap <leader>T :NvimTreeRefresh<CR> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=black

"" auto close if last window is closed
"autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif


