set nocompatible              " be iMproved, required
filetype off                  " required

" Differentiate between vim and nvim root
if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
else
    let s:editor_root=expand("~/.vim")
endif

"call vundle#rc(s:editor_root . '/bundle')

" set the runtime path to include Vundle and initialize
let &rtp = &rtp . ',' . s:editor_root . '/bundle/Vundle.vim'
call vundle#begin(s:editor_root . '/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Omnisharp for c# completion
Plugin 'OmniSharp/omnisharp-vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tmhedberg/SimpylFold'
"Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

" Neosnippets
Plugin 'Shougo/neocomplete'

Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'jnurmine/Zenburn'
Plugin 'bluz71/vim-moonfly-colors'
Plugin 'chriskempson/base16-vim'

" HTML coding plugins
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
    
    " Use deoplete
    let g:deoplete#enable_at_startup = 1

    " Enable python docstring preview for autocompletion
    let g:deoplete#sources#jedi#show_docstring = 1

    " Setup python3
    let g:python3_host_prog = '/usr/bin/python3'

    " Automatically close preview after autocompletion
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    " Use tab for autocompletion
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif


" Activate color scheme
colors moonfly
"colorscheme base16-default-dark

syntax on
let g:ycm_server_python_interpreter = '/usr/bin/python2'

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
let g:nerdtree_tabs_open_on_console_startup=1

" Disable visual linebreaks for long lines
set nowrap

" Fix visual select highlighting
" hi Visual guibg=#16A085 guifg=#000000

autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Custom vim shortcuts

" Replace text under visual selection in whole document
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" See docstring preview for folded code
let g:SimpylFold_docstring_preview=1

" Proper PEP8 indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" Unnecessary whitespace flagging
:highlight BadWhitespace ctermbg=darkgreen guibg=darkgreen
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 support
set encoding=utf-8

" Auto-close preview after completions
let g:ycm_autoclose_preview_window_after_completion=1

" Shortcut for goto definitions
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python highlighting
let python_highlight_all=1

" Line numbering
set nu

" Ignore .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Set NERDTree view width
let g:NERDTreeWinSize=15

" Neovim python check
let g:python_host_prog='/usr/bin/python2'
