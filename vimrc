execute pathogen#infect()

filetype plugin indent on
syntax on
set background=light
colorscheme solarized
let g:solarized_contrast = "normal"
let g:solarized_termcolors=256
"let g:solarized_termtrans = 0

set tabstop=4
set shiftwidth=4
set softtabstop=0
set noexpandtab
set directory=~/.vim/swap,.
set encoding=utf-8  " The encoding displayed.
"set fileencoding=utf-8  " The encoding written to file.
set fileformats=dos,unix
set updatetime=250
set hlsearch
set nofixendofline
set incsearch
set number
set autoindent
set smartindent
" Set the working directory to wherever the open file lives
set autochdir

" Autocompletion
set omnifunc=syntaxcomplete#Complete
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS

" Show file options above the command line
set wildmenu

" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

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
autocmd VimEnter * source ~/.vimrc | DoShowMarks!

" Ctrl + A to select the whole file content
nnoremap <C-a> ggvG$

" Space + t to open a new tab with startify
nnoremap <Leader>t :tabnew<CR>:Startify<CR>

" Space + p to change the pwd to the directory of the current file
nnoremap <Leader>p :cd %:p:h<CR>

" Space + w to close the file
nnoremap <Leader>w :q!<CR>

inoremap jj <ESC>

"
" PLUGINS CONFIGURATION
"

" Control P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>g :GitGutterToggle<CR>

" GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

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
hi IndentGuidesOdd ctermbg=white

" Startify bookmarks
let g:startify_bookmarks = [
      \ { 'v': '~/.vimrc' },
	  \ { 't': '~/Desktop/vim_tips.md' },
	  \ { 'J': '~/Desktop/japanese_notes.md' },
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

" NerdTree syntax highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Twitvim
let twitvim_browser_cmd = 'start chrome'
let twitvim_count = 150
nnoremap <Leader>1 :FriendsTwitter<CR>
nnoremap <Leader>2 :MentionsTwitter<CR>
nnoremap <Leader>5 :PosttoTwitter<CR>
nnoremap <Leader>8 :BPosttoTwitter<CR>

" ALE linters
let g:ale_linters = {
	  \  'javascript': ['eslint']
	  \ }

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Lightline config: Displays the erros found by ale and the current branch
let g:lightline = {}

let g:lightline.component_function = {
      \  'gitbranch': 'gitbranch#name'
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = {
      \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ }
"let g:lightline.colorscheme = 'blayu'

" Leader + e to display the errors
nnoremap <Leader>e :lopen<CR>
" Leader + j for JSHint
nnoremap <Leader>j :JSHint<CR>

" ctags.exe path
let g:tagbar_ctags_bin = '~/Documents/ctags.exe'

" F12 to toggle tagbar
nmap <F12> :TagbarToggle<CR>

" Lead + h to comment HTML, Lead + : (same key as /) to comment any language with /* */
vnoremap <Leader>h xO<!--<ENTER>!--><ESC>P
vnoremap <Leader>: xO/*<ENTER>*/<ESC>P

" Lead + T to load Tetris
nnoremap <Leader>T :source ~/.vim/bundle/TeTrIs.vim/plugin/TeTris.vim<CR>

set completefunc=emoji#complete

" Snoo.vim
nnoremap <Leader>3 :Snoo nichijou<CR>
nnoremap <Leader>4 :Snoo madeinabyss<CR>
nnoremap <Leader>6 :Snoo dota2<CR>
nnoremap <Leader>7 :Snoo edmproduction<CR>

"Goyo size
let g:goyo_width = 120

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'DarkGray'
map <F6> :Limelight<CR>:Goyo<CR>
nmap <Leader>l :Limelight!!<CR>
