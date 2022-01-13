call plug#begin('~/.local/share/nvim/plugged')

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'tpope/vim-sensible' " sets some normal standards
" Plug 'vim-pandoc/vim-pandoc' "Markdown engine
Plug 'rafi/awesome-vim-colorschemes' " color theme
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
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
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'terryma/vim-expand-region'
Plug 'christoomey/vim-sort-motion'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-easy-align'
Plug 'matze/vim-move'
Plug 'arcticicestudio/nord-vim'
Plug 'lervag/vimtex', { 'for': 'plaintex' }
Plug 'tmhedberg/SimpylFold'
Plug 'szymonmaszke/vimpyter'
Plug 'machakann/vim-highlightedyank'


if !exists('g:started_by_firenvim')
    Plug 'vim-airline/vim-airline' " status bar
    Plug 'vim-airline/vim-airline-themes' "status bar theme
    " Plug 'vim-syntastic/syntastic' " syntax checkings
    Plug 'sheerun/vim-polyglot' " language packs
    " Plug 'nvie/vim-flake8' " python syntax and style checker
    Plug 'jiangmiao/auto-pairs' " auto closing brackets/quotes/...

    Plug 'vimjas/vim-python-pep8-indent' " python indentation
    " Plug 'jeetsukumaran/vim-pythonsense'
    Plug 'liuchengxu/vista.vim' "Viewer & Finder for LSP symbols and tags
     " Plug 'dense-analysis/ale' "Asynchronous linting with LSPPAP
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "LSP engine
		Plug 'antoinemadec/coc-fzf', {'branch': 'release'}







    Plug 'kalekundert/vim-coiled-snake'
    Plug 'Konfekt/FastFold'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'jpalardy/vim-slime', { 'for': 'python' }
    Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
    Plug 'tpope/vim-eunuch'
    Plug 'justinmk/vim-dirvish'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ThePrimeagen/vim-be-good'
    Plug 'tjdevries/train.nvim'
    " Plug 'lambdalisue/suda.vim'
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
		Plug 'ryanoasis/vim-devicons'
		Plug 'bfrg/vim-jq'
		Plug 'reedes/vim-pencil'
		Plug 'rhysd/clever-f.vim'
		Plug 'junegunn/vim-peekaboo'
		Plug 'svermeulen/vim-yoink'

endif

call plug#end()

if exists('g:started_by_firenvim') && g:started_by_firenvim
    " general options

    set background=light
    colorscheme one
    let g:firenvim_config = {
	\ 'globalSettings': {
	    \ 'alt': 'all',
	\  },
	\ 'localSettings': {
	    \ '.*': {
		\ 'cmdline': 'firenvim',
		\ 'priority': 0,
		\ 'takeover': 'never',
	    \ },
	\ }
    \ }

    let fc = g:firenvim_config['localSettings']
    set laststatus=0 nonumber noruler noshowcmd

    augroup firenvim
        autocmd!
        autocmd BufEnter *.txt setlocal filetype=markdown
    augroup END
endif

" python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

if (has("termguicolors"))
  set termguicolors
endif
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if !exists('g:started_by_firenvim')
    set background=dark
    colorscheme nord
endif


" settings for the airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'


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
let g:python_host_prog = '/usr/bin/python2.7'
" let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/home/miguel/miniconda3/envs/mustard/bin/python3'

" persistent undo
set undodir=~/.config/nvim/undodir
set undofile

" disable latex-box included with vim-polyglot (conflicts with
" vimtex)asasdfdkdhjj
"
" let g:polyglot_disabled = ['latex']

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

augroup LaTex
    au BufNewFile,BufRead *.tex setlocal tw=79
augroup END
" set tw=79
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

"
" nnoremap d "dd
" nnoremap D "dD
" vnoremap d "dd
"
" nnoremap <Leader>d d
" nnoremap <Leader>D D
" vnoremap <Leader>d d
"
" nnoremap c "dc
" nnoremap C "dC
" vnoremap c "dc
"
"
" nnoremap <Leader>c c
" nnoremap <Leader>C C
" vnoremap <Leader>c c
"
" nnoremap x "dx
" nnoremap X "dX
"
" nnoremap <Leader>x x
" nnoremap <Leader>X X
"
" nnoremap <Leader>p "dp
" nnoremap <Leader>P "dP
" vnoremap <Leader>p "dp

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
" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

let g:yoinkIncludeDeleteOperations = 0

"------------------------------------------------------------------------------
" slime configuration
"------------------------------------------------------------------------------
" always use tmux
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>i to start IPython
nnoremap <Leader>si :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>sR :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>sr :IPythonCellRunTime<CR>

" map <Leader>C to execute the current cell
nnoremap <Leader>sC :IPythonCellExecuteCell<CR>

" map <Leader>c to execute the current cell and jump to the next cell
nnoremap <Leader>sc :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>sl :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>sx :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>s to send the current line or current selection to IPython
nmap <Leader>ss <Plug>SlimeLineSend
xmap <Leader>ss <Plug>SlimeRegionSend

" map <Leader>p to send the current paragraph or current selection to IPython
nmap <Leader>sp <Plug>SlimeParagraphSend

" map <Leader>p to run the previous command
nnoremap <Leader>sp :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>sQ :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>sd :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>sq :SlimeSend1 exit<CR>


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
" [Commands] --expect expression for directly executing the command
" let g:fzf_commands_expect = 'ctrl-s,ctrl-x'


"------------------------------------------------------------------------------
" ALE Configuration
"------------------------------------------------------------------------------
"
" "" \   'python': ['flake8', 'pylint'],
" let g:ale_linters = {
"       \   'python': ['flake8'],
"       \}
" let g:ale_fixers = {
"       \    'python': ['yapf'],
"       \}
" " nmap <F10> :ALEFix<CR>
" let g:ale_fix_on_save = 1
" let g:ale_disable_lsp = 1
" " Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1

"------------------------------------------------------------------------------
" COC Configuration
"------------------------------------------------------------------------------


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader>oa  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>oe  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>oc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>oo  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>os  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader>oj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader>ok  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>op  :<C-u>CocListResume<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion in Kite & coc

if &filetype == "python"
  inoremap <silent><expr> <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>i  <Plug>(coc-format-selected)
nmap <leader>i  <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS,
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif



"------------------------------------------------------------------------------
" Kite Configuration
"------------------------------------------------------------------------------

" Python, JavaScript, Go
let g:kite_supported_languages = []

autocmd FileType python let b:coc_suggest_disable = 0
autocmd FileType scss setl iskeyword+=@-@
