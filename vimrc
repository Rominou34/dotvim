execute pathogen#infect()
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set directory=~/.vim/swap,.
syntax on
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set guifont=Consolas:h10
colorscheme ron
set updatetime=250

if !has('gui_running')
  set t_Co=256
endif

" F7 - F8 to switch tabs
nnoremap <F7> gT
nnoremap <F8> gt

let mapleader=" "

" NERDTree
map <leader>s :source ~/.vimrc<CR>
let NERDTreeMapActivateNode='<right>'
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']

" Space + arrow to navigate between windows
map <leader><Up> <C-w>k
map <leader><Down> <C-w>j
map <leader><Left> <C-w>h
map <leader><Right> <C-w>l

" Automatically creates folds at startup
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Vim Indent Guides
let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesIdd guibg=darkgrey ctermbg=darkgrey
hi IndentGuidesOdd ctermbg=darkgrey
set ts=4 sw=4 et
let g:indent_guides_guide_size = 1
