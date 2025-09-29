"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" / Bo-En Shao / @boenshao
" ⁽⁽٩(๑˃̶͈̀ ᗨ ˂̶͈́)۶⁾⁾
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged/')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'kshenoy/vim-signature'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore=*.swp,*.bak,*.pyc,*.class
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|hg|svn))$'
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.DS_Store',
                    \ '\.so$', '\.egg$', '^\.git$', '__pycache__', 'node_modules']
let g:highlightedyank_highlight_duration = 300
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"
set timeoutlen=1000 ttimeoutlen=50

"tools
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fw :Windows<CR>
nmap <leader>fl :BLines<CR>
nmap <leader>fL :Lines<CR>
nmap <leader>fh :History<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gv :GV<CR>
nmap <leader>gV :GV!<CR>
nmap <C-n> :NERDTreeToggle<cr>

"editing
imap jj <esc>
nmap <leader>s :w<CR>
nmap <leader>/ :nohl<CR>

"window
nmap <leader><Bslash> :vsplit<CR>
nmap <leader><Bar> :split<CR>
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l

"remap
vmap p P
xmap > >gv
xmap < <gv
xmap ghs <Plug>(GitGutterStageHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color and Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8
set termguicolors
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
highlight HighlightedyankRegion cterm=reverse gui=reverse
let g:lightline = {'colorscheme' : 'gruvbox_material'}
set conceallevel=0
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmode
set showcmd
set wildmenu
set cursorline
set number
set relativenumber
set ruler
set nowrap
set noerrorbells
set visualbell
set title
set laststatus=2
set lazyredraw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set cindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set backspace=indent,eol,start
set mouse=a
set splitbelow
set splitright
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set nobackup
set nowritebackup
set nowb
set noswapfile
set autoread
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
