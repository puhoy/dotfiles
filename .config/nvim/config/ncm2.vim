" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Setup language server client
lua << EOF
require('nvim_lsp').pyls.setup({
    on_init = require('ncm2').register_lsp_source,
});
EOF

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
