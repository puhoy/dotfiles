" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

lua<<end
vim.g.completion_enable_auto_signature = 1
vim.g.completion_auto_change_source = 1
vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {'lsp'}},
        {complete_items = {'snippet'}},
        {complete_items = {'path'}},
    }
    }
end
autocmd BufEnter * lua require'completion'.on_attach()

