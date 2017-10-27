set nocompatible              " be iMproved, required
filetype off                  " required
syntax on


" Configure smart tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Disable visual linebreaks for long lines
set nowrap

" Enable UTF8 support
set encoding=utf-8

" Enable line numbering
set nu


" Differentiate between vim and nvim root
if has('nvim')
    let g:editor_root=expand("~/.config/nvim")
else
    let g:editor_root=expand("~/.vim")
endif

source ~/.config/nvim/init/vundle-plugins.vim
source ~/.config/nvim/init/vimplug-plugins.vim
source ~/.config/nvim/init/deoplete-conf.vim
source ~/.config/nvim/init/python-conf.vim
source ~/.config/nvim/init/nerdtree-conf.vim
source ~/.config/nvim/init/simplyfold-conf.vim

" Neovim python check
let g:python_host_prog='/usr/bin/python2'

" Activate color scheme
colors moonfly
"colorscheme base16-default-dark
