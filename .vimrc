let mapleader=" "

set nu
set expandtab
set sw=4
set softtabstop=4
set cindent
set scrolloff=9999
set mouse=a

syntax enable
"set background=dark

set wildmenu
set wildmode=list:longest,full

set nohidden

set ignorecase
set smartcase
set incsearch

set clipboard=unnamedplus

nore ; :

call plug#begin('~/.vim/plugged')
" vim-plug
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'whatyouhide/vim-gotham'
Plug 'tpope/vim-sensible'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
call plug#end()


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_racket_racket_checker = 1

let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_show_diagnostics_ui = 0

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'rodnaph/vim-color-schemes'
Plugin 'pangloss/vim-javascript'
Plugin 'thaerkh/vim-workspace'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'hdima/python-syntax'
Plugin 'junegunn/goyo.vim'

Plugin 'MicahElliott/vrod'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'wlangstroth/vim-racket'
Plugin 'kovisoft/slimv'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mbbill/undotree'

Plugin 'cocopon/iceberg.vim'
call vundle#end()

let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL "sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"source ~/.vim/bundle/vim-color-schemes/colors/automation.vim
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
set laststatus=1

let g:airline_powerline_fonts = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

filetype plugin on
filetype indent on

set autoread

command W w !sudo tee % > /dev/null

set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler
set lazyredraw 
set magic


" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'



let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
let g:syntastic_python_checkers=['pyflakes']

" Javascript
let g:syntastic_javascript_checkers = ['jshint']

" Go
let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Custom CoffeeScript SyntasticCheck
func! SyntasticCheckCoffeescript()
    let l:filename = substitute(expand("%:p"), '\(\w\+\)\.coffee', '.coffee.\1.js', '')
    execute "tabedit " . l:filename
    execute "SyntasticCheck"
    execute "Errors"
endfunc
nnoremap <silent> <leader>c :call SyntasticCheckCoffeescript()<cr>

let g:syntastic_quiet_messages = {
        \ "!level":  "errors",
        \ "regex":   '.*',
        \ "file:p":  '.*' }

" vim-workspace
let g:workspace_autosave_ignore = ['gitcommit']
let g:workspace_autosave_untrailspaces = 0
nnoremap <leader>s :ToggleWorkspace<CR>

"UNDO THIGNS"
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'
nnoremap <c-u> :UndotreeToggle<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


map <Leader>n <plug>NERDTreeTabsToggle<CR>

highlight CursorLine ctermbg=LightBlue
set scrolloff=10
set background=dark
" colorscheme solarized

colorscheme dracula
set cursorline
highlight LineNr ctermbg=233



if !has('nvim')
    set viminfo='10,\"100,:20,%,n~/.viminfo
  set viminfo+=n~/.vim/viminfo
endif
