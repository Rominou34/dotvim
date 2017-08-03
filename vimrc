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
set fileformats=dos,unix
set guifont=Consolas:h10
colorscheme ron
set updatetime=250
set hlsearch

if !has('gui_running')
  set t_Co=256
endif

" Autoreload modified buffers when not moving cursor or focusing terminal
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
" autocmd FileChangedShellPost *
"  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" F7 - F8 to switch tabs
nnoremap <F7> gT
nnoremap <F8> gt

let mapleader=" "

" Space + arrow to navigate between windows
map <leader><Up> <C-w>k
map <leader><Down> <C-w>j
map <leader><Left> <C-w>h
map <leader><Right> <C-w>l

" Ctrl + Up to maximise window, Ctrl + Down to make all windows equal size
nnoremap <C-Up> <C-W>\| <C-W>_
nnoremap <C-Down> <C-W>=
" Ctr + Right to make current window larger, Ctrl + Left to make it narrower
nnoremap <C-Right> <C-W>10>
nnoremap <C-Left> <C-W>10<

" Pressing Enter after a search disable highligh
nnoremap <CR> :noh<CR><CR>
nnoremap <leader>s :source ~/.vimrc<CR>

" Space + d to open the log file for my work application
nnoremap <leader>d :e /c/uwAmp/www/lmbv7_new/lmbv7/www/debugar.log<CR>
" Space + q to delete the whole file content
nnoremap <leader>q ggVGd

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NERDTree
let NERDTreeMapActivateNode='<right>'
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
" Automatically close if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Automatically creates folds at startup
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Vim Indent Guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=darkgrey
