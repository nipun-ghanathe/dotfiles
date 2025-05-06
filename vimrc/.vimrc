" Mappings
"
" Mapping Leader key
let mapleader=" "
let maplocalleader=" "
"
" Escaping insert mode
inoremap jk <esc>
"
" Managing clipboard
nnoremap gy "+y
nnoremap gp "+p
nnoremap x "_x
nnoremap X "_d
nnoremap c "_c
vnoremap gy "+y
vnoremap gp "+p
vnoremap x "_x
vnoremap X "_d
vnoremap c "_c
"
" Managing Buffers
nnoremap <leader>bn <cmd>bnext<cr>
nnoremap <leader>bp <cmd>bprev<cr>
nnoremap <leader>bl <cmd>buffers<cr>
nnoremap <leader>bd <cmd>bdelete<cr>
nnoremap <leader>b1 <cmd>b 1<cr>
nnoremap <leader>b2 <cmd>b 2<cr>
nnoremap <leader>b3 <cmd>b 3<cr>
nnoremap <leader>b4 <cmd>b 4<cr>
nnoremap <leader>b5 <cmd>b 5<cr>
nnoremap <leader>b6 <cmd>b 6<cr>
nnoremap <leader>b7 <cmd>b 7<cr>
nnoremap <leader>b8 <cmd>b 8<cr>
nnoremap <leader>b9 <cmd>b 9<cr>
nnoremap <leader>b0 <cmd>b 0<cr>
"
" Improving scrolling experience
" nnoremap <c-e> <c-e>zz
" nnoremap <c-y> <c-y>zz
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
"
" Improving search scrolling experience
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
"
" Escaping Terminal Mode
tnoremap <esc><esc> <c-\\><c-n>
"
" Opening terminal in Neovim
nnoremap <leader>t <cmd>term<cr>
" Opening and configuring netrw
nnoremap <leader>e <cmd>Ex<cr>
let g:netrw_banner = 0

" Options
"
" Line number
set number
set relativenumber
"
" Show which line your cursor is on
" set cursorline
"
" Configuring tabs and indentation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"
set autoindent
set smartindent
"
" Keeping the cursor in place
set scrolloff=8
"
" Configuring search
set incsearch
set ignorecase
set smartcase
set nohlsearch
"
" Uncomment this for auto save
" set autowrite
" set autowriteall
"
" Enabling color column
set colorcolumn=80
"
" Enabling mouse
set mouse=a
"
" Decreasing update time and mapped sequence wait time
set updatetime=250
set timeoutlen=300 " consider reducing this to 50 or something when you get comfortable
"
" Enabling sign column
set signcolumn=yes
"
" Making splits more natural
set splitbelow
set splitright
"
" Setting colorscheme
colorscheme habamax
" 
" Precautionary settings
"
set termguicolors
set noswapfile
set nocompatible
filetype plugin on
