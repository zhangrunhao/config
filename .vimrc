set number
set scrolloff=8
set nocompatible
set laststatus=2
set ruler
set wildmenu
set hlsearch
set incsearch
set ttimeout
set ttimeoutlen=100
set fileencodings=utf-8,cp936,big5,latin1
set cursorline
set cursorlineopt=number
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set nowrap
set linebreak
set noswapfile
set nobackup
set nowritebackup
set autoread
set visualbell
set showmode
set showcmd
set showmatch
set completeopt=menuone,noinsert,noselect
set noerrorbells
set visualbell
set t_vb=
set wildignorecase
set foldmethod=syntax
set foldlevel=99  " 默认展开所有折叠
set tags=./tags;,tags

let g:netrw_banner = 0             " 禁用顶部横幅信息
let g:netrw_liststyle = 3          " 树状视图
let g:netrw_altv = 1               " 默认垂直分割窗口
let g:netrw_winsize = 25           " 设置侧边栏宽度为 25 列
let g:netrw_browse_split = 2       " 在水平分割窗口中打开文件
let g:netrw_keepdir = 0            " 保持目录同步
let g:netrw_preview = 1            " 启用文件预览

let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
nnoremap <Leader>w :w<CR>
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-h> :History<CR>
nnoremap <Leader><Leader>w <Plug>(easymotion-w)
nnoremap <Leader><Leader>b <Plug>(easymotion-b)
nnoremap <leader>e :Lexplore<CR>
nnoremap <Leader>f :Prettier<CR>
nnoremap <Leader>t :TagbarToggle<CR>

syntax enable 
filetype on
filetype plugin indent on

let g:indentLine_char = '|'

let g:rooter_patterns = ['.git', '.svn', 'package.json', 'Makefile']
let g:rooter_manual_only = 1
let g:rooter_echo = 1

call plug#begin('~/.vim/plugged')
Plug 'machakann/vim-highlightedyank'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'sainnhe/edge'
Plug 'prettier/vim-prettier'
Plug 'preservim/tagbar'
Plug 'SirVer/ultisnips'
call plug#end()

colorscheme edge

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}
augroup END

autocmd FileType javascript,typescript,html,css,less nnoremap <leader>p :%!prettier --stdin-filepath %<CR>

autocmd FileType netrw setlocal winheight=15

command! -bang -nargs=* Files call fzf#run({'source': 'find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*"', 'sink': 'tabnew' })

command! RooterNow execute 'cd ' . expand('%:p:h')

let g:ycm_autoclose_preview_window = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let g:UltiSnipsExpandTrigger = "<Enter>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:ycm_use_ultisnips = 1
let g:ycm_snippet_directory = '~/.vim/UltiSnips'

let g:tagbar_type_typescriptreact = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'C:const',
    \ 'c:class',
    \ 'i:interface',
    \ 'a:type',
    \ 'v:var',
    \ 'f:function',
    \ 'p:property',
  \ ],
\ }

