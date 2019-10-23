let mapleader=" "

set nu
set cindent
set scrolloff=9999
set mouse=a
set smarttab

syntax enable
"set background=dark

set wildmenu
set wildmode=list:longest,full

set nohidden

set ignorecase 
set smartcase
set incsearch 
"set clipboard+=unnamedplus

nore ; :
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_cpp_compiler_options = '-std=c++17'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_racket_racket_checker = 1


let g:ycm_global_ycm_extra_conf = '~/platform/.ycm_extra_conf.py'

let g:ycm_path_to_python_interpreter='/usr/bin/python2'
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
Plugin 'tpope/vim-fugitive'
Plugin 'rodnaph/vim-color-schemes'
Plugin 'pangloss/vim-javascript'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'hdima/python-syntax'
Plugin 'valloric/youcompleteme'
Plugin 'junegunn/goyo.vim'

Plugin 'MicahElliott/vrod'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'wlangstroth/vim-racket'
Plugin 'kovisoft/slimv'

Plugin 'dyng/ctrlsf.vim'

Plugin 'NLKNguyen/papercolor-theme'
Plugin 'mbbill/undotree'

Plugin 'cocopon/iceberg.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'
Plugin 'vim-misc'

Plugin 'rking/ag.vim'
call vundle#end()

let g:ag_working_path_mode="r"

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly  

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

set t_Co=256

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_map = '<c-f>'

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
let g:workspace_undodir='~/.undodir'
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave_always = 1
nnoremap <c-u> :UndotreeToggle<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

map <Leader>n <plug>NERDTreeTabsToggle<CR>

highlight CursorLine ctermbg=0 cterm=NONE
set scrolloff=10
set background=dark
" colorscheme solarized

highlight LineNr ctermbg=233

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END


if !has('nvim')
    set viminfo='10,\"100,:20,%,n~/.viminfo
  set viminfo+=n~/.vim/viminfo
endif

" Fixes weird symbol �[2 q
set guicursor=
let $VTE_VERSION="100"

nnoremap <silent> <C-l> :nohl<CR><C-l>
inoremap <m-i> <Esc>

map <leader>r :tabdo windo wincmd =<cr> 

let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_disable_autoinstall = 0

let g:auto_save = 0
let g:auto_save_in_insert_mode = 0

autocmd OptionSet guicursor noautocmd set guicursor=
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

set splitright
let g:go_term_enabled = 1
let g:go_test_timeout = '-10s'

map <A-b> :GoBuild<CR>
map <leader>t :GoTestFunc!<CR>
let g:go_jump_to_error = 0

set foldmethod=indent
set foldlevel=20

au FileType go nmap <Leader>d <Plug>(go-def-tab)
au FileType go nmap <A-t> <Plug>(go-alternate-vertical)

nmap <F8> :TagbarToggle<CR>
let g:easytags_async = 1

nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


noremap <Leader>Y "+y
noremap <Leader>P "+p
