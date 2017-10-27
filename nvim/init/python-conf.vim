" Unnecessary whitespace flagging
:highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Proper PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" Python highlighting
let python_highlight_all=1


