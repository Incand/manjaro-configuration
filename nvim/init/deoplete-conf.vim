if has('nvim')
    " Use deoplete
    let g:deoplete#enable_at_startup = 1

    " Enable python docstring preview for autocompletion
    let g:deoplete#sources#jedi#show_docstring = 1
    
    " Automatically close preview after autocompletion
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " Use tab for autocompletion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

    " Setup python3
    let g:python3_host_prog = '/usr/bin/python3'
endif
