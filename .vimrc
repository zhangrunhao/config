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

let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k
vnoremap H 0
vnoremap L $
nnoremap <C-e> %
nnoremap <Leader>w :w<CR>
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToCallers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <Leader><Leader>w <Plug>(easymotion-w)
nnoremap <Leader><Leader>b <Plug>(easymotion-b)
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>e :Lexplore<CR>
nnoremap <Leader>r :Rg<CR>

syntax enable 
filetype on
filetype plugin indent on

let g:indentLine_char = '|'

let g:rooter_patterns = ['.git', '.svn', 'package.json', 'Makefile']
let g:rooter_manual_only = 1
let g:rooter_echo = 1

let g:netrw_winsize = 28

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

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
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
call plug#end()

colorscheme edge

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=500}
augroup END

autocmd FileType typescriptreact let g:AutoPairsMapBS = 0
autocmd FileType typescriptreact let g:AutoPairsShortcutToggle = '<C-l>'

autocmd FileType * nnoremap <buffer> <Leader>f :YcmCompleter Format<CR>
autocmd FileType javascript,typescript,typescriptreact,html,css,less nnoremap <buffer> <Leader>f :Prettier<CR>

command! -bang -nargs=* Files call fzf#run({
    \ 'source': 
       \ 'find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/dist/*"  -not -path "*/target/*"', 
    \ 'sink': 'tabnew', 
\ })

command! RooterNow execute 'cd ' . expand('%:p:h')

let g:ycm_autoclose_preview_window = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_use_ultisnips = 1
let g:ycm_snippet_directory = '~/.vim/UltiSnips'

let g:UltiSnipsExpandTrigger = "<CR>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"


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


" 插入模式使用竖线光标
let &t_SI = "\e[6 q"

" 离开插入模式恢复为块状光标
let &t_EI = "\e[2 q"

" Visual 模式使用下划线光标
augroup cursor_shape
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * let &t_SV = "\e[4 q"
  autocmd InsertLeave * let &t_EI = "\e[2 q"
augroup END
