call plug#begin("~/.vim/plugged")
"Our plugins will go in the middle

"Core
Plug 'tpope/vim-sensible' " sets some normal standards
Plug 'rafi/awesome-vim-colorschemes' " color theme
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tommcdo/vim-exchange'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'lucapette/vim-textobj-underscore'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-expand-region'
Plug 'christoomey/vim-sort-motion'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/vim-easy-align'
Plug 'matze/vim-move'
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex', { 'for': 'plaintex' }
Plug 'tmhedberg/SimpylFold'
" Plug 'szymonmaszke/vimpyter'
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs' " auto closing brackets/quotes/...
Plug 'nanotee/zoxide.vim'



Plug 'kalekundert/vim-coiled-snake'
Plug 'Konfekt/FastFold'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tjdevries/train.nvim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'bfrg/vim-jq'
Plug 'reedes/vim-pencil'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'svermeulen/vim-yoink'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'sainnhe/sonokai'                 " Monokai Pro-like scheme
Plug 'chriskempson/base16-vim'         " Base16 themes


"Heavy Duty
" Plug 'vim-syntastic/syntastic' " syntax checkings
" Plug 'nvie/vim-flake8' " python syntax and style checker
" Plug 'jeetsukumaran/vim-pythonsense'
" Plug 'dense-analysis/ale' "Asynchronous linting with LSPPAP

Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' "status bar theme
Plug 'edkolev/tmuxline.vim' "tmux status bar theme
Plug 'sheerun/vim-polyglot' " language packs
" Plug 'vimjas/vim-python-pep8-indent' " python indentation
" Plug 'liuchengxu/vista.vim' "Viewer & Finder for LSP symbols and tags
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "LSP engine
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
" Plug 'francoiscabrol/ranger.vim'
" Plug 'jpalardy/vim-slime', { 'for': 'python' }
" Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
" Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()


if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
set t_Co=256
" colorscheme vim-monokai-tasty
syntax enable
colorscheme sonokai
let g:sonokai_style = 'shusia'

" settings for the airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='sonokai'


" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" enable hybrid line numbers
set number relativenumber

" autoclose the preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" all extra windows pop up at the bottom
set splitbelow

" set python directories
" let g:python_host_prog = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/home/miguel/miniconda3/envs/mustard/bin/python3'

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile

set autoindent		" always set autoindenting on
set hlsearch
set incsearch
set ignorecase              "Ignore case in search
set smartcase               "Only ignore case when all letters are lowercase
set smartindent             "Smart autoindenting on new line
set smarttab                "Respect space/tab settings

" highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%80v', 80)

" Save Work On Focus Lost
au FocusLost * silent! wa

set updatetime=300

set autowrite

set sw=4

set mouse=a

set clipboard=unnamedplus

set hidden

set nofoldenable
set foldlevelstart=90
set foldlevel=90

augroup vimrc
    au BufNewFile,BufRead *.py set foldmethod=indent
augroup END

"------------------------------------------------------------------------------
" Key-bindings
"------------------------------------------------------------------------------

nnoremap <esc> :noh<return><esc>

nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"
if !empty($TMUX)
    let &t_SI = "\ePtmux;\e\e[6 q\e\\"
    let &t_SR = "\ePtmux;\e\e[4 q\e\\"
    let &t_EI = "\ePtmux;\e\e[2 q\e\\"
endif

let mapleader = "\<Space>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap gb :ls<CR>:b<Space>
nnoremap <Leader>3 :b#<CR>      " previous buffer

" nnoremap <C-w>| <C-w>v
" nnoremap <C-w>- <C-w>s
nnoremap <C-w>x <C-w>c
" nnoremap <C-w> <C-w>o

" nnoremap <Leader>z za

noremap Q !!zsh<CR>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>


let g:ranger_map_keys = 0
map <leader>z :Ranger<CR>
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

com! FormatJSON %!jq .
nmap <leader>j :FormatJSON<CR>


" nmap <Leader>p <plug>(YoinkPostPasteSwapBack)
" nmap <Leader>n <plug>(YoinkPostPasteSwapForward)
"
" nmap p <plug>(YoikPaste_p)
" nmap P <plug>(YoinkPaste_P)

nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

let g:yoinkIncludeDeleteOperations = 0

"------------------------------------------------------------------------------
" fzf.vim configuration
"------------------------------------------------------------------------------

nmap <Leader>ff :Files<CR>
nmap <Leader>fF :Files ~<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>fh :History<CR>
nmap <Leader>fs :BTags<CR>
nmap <Leader>fS :Tags<CR>
nmap <Leader>fl :BLines<CR>
nmap <Leader>fL :Lines<CR>
nmap <Leader>f' :Marks<CR>
nmap <Leader>/ :Rg<Space>
nmap <Leader>fH :Helptags!<CR>
nmap <Leader>: :Commands<CR>
nmap <Leader>f: :History:<CR>
nmap <Leader>fM :Maps<CR>
nmap <Leader>ft :Filetypes<CR>
