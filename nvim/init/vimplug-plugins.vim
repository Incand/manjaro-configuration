" Additional plugins for neovim
if has('nvim')
    " Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.local/share/nvim/plugged')
    
    " deoplete autocompletion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    
    " deoplete-jedi for python completion
    Plug 'zchee/deoplete-jedi'

    " LaTeX plugin
    Plug 'lervag/vimtex'

    " R plugin
    Plug 'jalvesaq/Nvim-R'

    " Neomake
    Plug 'neomake/neomake'

    " Initialize plugin system
    call plug#end()
endif
