execute pathogen#infect()

filetype plugin indent on
syntax on
set background=dark
colorscheme ron
"let g:solarized_contrast = "high"
"let g:solarized_termcolors=256
"let g:solarized_termtrans = 0

set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set directory=~/.vim/swap,.
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set fileformats=dos,unix
set updatetime=250
set hlsearch
set nofixendofline
set incsearch

"if !has('gui_running')
"  set t_Co=256
"endif
if $TERM == "xterm-256color"
  set t_Co=256
endif

" Autoreload modified buffers when not moving cursor or focusing terminal
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
" autocmd FileChangedShellPost *
"  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Automatically creates folds at startup
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" F7 - F8 to switch tabs
nnoremap <F7> gT
nnoremap <F8> gt

"
" LEADER KEY CONFIGURATION
"

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

" Ctrl + A to select the whole file content
nnoremap <C-a> ggvG$

" Space + t to open a new tab with startify
nnoremap <Leader>t :tabnew<CR>:Startify<CR>

" Space + p to change the pwd to the directory of the current file
nnoremap <Leader>p :cd %:p:h<CR>

"
" PLUGINS CONFIGURATION
"

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

" Vim Indent Guides
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=darkgrey

" Startify bookmarks
let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
	  \ { 'd': '/c/uwAmp/www/lmbv7_new/lmbv7/www/debugar.log' },
	  \ { 'l': '/c/uwAmp/www/lmbv7_new/lmbv7/www/' },
	  \ { 'a': '/c/uwAmp/www/lmbv7_new/lmbv7/www/common/javascript/angular/components/searchEngine/' },
	  \ { 'b': '/c/uwAmp/www/lmbv7_new/lmbv7/www/view/mvc/Admin/Standard/' },
	  \ { 'c': '/c/uwAmp/www/lmbv7_new/lmbv7/www/common/javascript/angular/components/searchEngine/resultSelector' }
      \ ]
let g:startify_transformations = [
      \ ['.*vimrc$', 'vimrc'],
	  \ ['/c/uwAmp/www/lmbv7_new/lmbv7/www/debugar.log', 'Debug AR'],
	  \ ['/c/uwAmp/www/lmbv7_new/lmbv7/www/$', 'LMB v7']
      \ ]
let g:startify_change_to_dir          = 0
let g:startify_change_to_vcs_root     = 0
let g:startify_files_number           = 8
let g:startify_fortune_use_unicode    = 1
let g:startify_padding_left			  = 3

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" NerdTree syntax highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
