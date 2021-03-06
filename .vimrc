if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

" VIM/TMUX integration
Plug 'benmills/vimux'

" GUI enhancements
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'kien/rainbow_parentheses.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'markonm/traces.vim'

" Test integration
" Plug 'janko/vim-test'
" Plug 'jtumano/vim-test'
Plug 'tyewang/vimux-jest-test'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jesseleite/vim-agriculture'

" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sheerun/vim-polyglot'

Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
autocmd BufReadPost *.kt setlocal filetype=kotlin

let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["kotlin-language-server"],
    \ }

" Plug 'arzg/vim-rust-syntax-ext'
Plug 'mattn/emmet-vim'
Plug 'xabikos/vscode-javascript'
Plug 'andys8/vscode-jest-snippets'
Plug 'nathanchapman/vscode-javascript-snippets'

" Session management
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

call plug#end()

let mapleader = "\<Space>"

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'coc'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:NERDTreeShowIgnoredStatus = 1
let NERDTreeQuitOnOpen=1

" coc settings
nmap <silent> ]E <Plug>(coc-diagnostic-next)
nmap <silent> [E <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>l <Plug>(coc-diagnostic-info)
nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gD :vs<CR><Plug>(coc-definition)zz
nmap <silent> gy <Plug>(coc-type-definition)zz
nmap <silent> gi <Plug>(coc-implementation)zz
nmap <silent> gr <Plug>(coc-references)zz

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Note：to enable formatOnType, add ` "coc.preferences.formatOnType": true`
set encoding=UTF-8

" automatically hide buffers so we can navigate away from them without warnings
set hidden

" Vim treat numerals as decimal, regardless of whether they are padded with zero, e.g., octal notation.
set nrformats=
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Scroll pop-up window
nnoremap <nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1, 0) : "\<C-d>"
nnoremap <nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0, 0) : "\<C-u>"
inoremap <nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 0)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 0)\<cr>" : "\<Left>"


" https://github.com/prettier/vim-prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

set suffixesadd+=.js,.jsx,.ts,.tsx
set path+=$PWD/node_modules

" number of spaces per indentation level: a number or 'auto' (use
" softtabstop)
" default: 'auto'
let g:prettier#config#tab_width = '2'

" use tabs instead of spaces: true, false, or auto (use the expandtab setting).
" default: 'auto'
let g:prettier#config#use_tabs = 'false'

" rustfmt
let g:rustfmt_autosave = 1

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif
" Colors
set background=dark
" colorscheme nord
" colorscheme base16-default-dark
" colorscheme base16-nord
colorscheme gruvbox
" colorscheme base16-gruvbox-dark-hard
" let base16colorspace=256
" colorscheme base16-atelier-forest

syntax enable
" colorscheme night-owl
" To enable the lightline theme
" let g:lightline = { 'colorscheme': 'nightowl' }

:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" NERDTree configuration
nmap <leader>e :NERDTreeToggle<cr>
" nmap <Tab><Tab> :NERDTreeToggle<CR>
" reveal the current file in NERDTree
map <leader>f :NERDTreeFind<CR>

set autoread
au FocusGained,BufEnter * :checktime

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

nmap <C-s> <Plug>MarkdownPreview

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
" Rg current word
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" File list
nnoremap <C-p> :<C-u>FZF<CR>

" Quick-save
nmap <leader>w :w<CR>

" <leader>s/S for Rg/RgRaw search
noremap <leader>s :Rg <cr>
noremap <leader>S :RgRaw

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Buffer list
" nmap <leader>; :Buffers<CR>

nnoremap <silent> <Leader>; :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

nn <Leader><Leader> <c-^>

noremap <leader>p "+p
" noremap <leader>c :%y+ <cr>
noremap <leader>c "+y

noremap <leader>gs :Gstatus <cr>
noremap <leader>gc :G commit <cr>
noremap <leader>gp :Gpush <cr>
noremap <leader>gd :Gdiffsplit <cr>
noremap <leader>gb :Gbrowse <cr>

" This option creates & uses a 'default' session to be
" used in case when launching vim and a corresponding
" session hasn't been found yet.
" let g:prosession_default_session = 1

" Permanent undo
set undodir=~/.vim/undodir
set undofile

" Open new split panes to right and bottom
set splitbelow
set splitright

" Show autocomplete menu
set wildmenu
set wildmode=full

" Keep only current buffer, necessary when doing long sessions
command! Bonly silent! execute "%bd|e#|bd#"

" No arrow keys, force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Search results centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
" nnoremap ? ?\v
" nnoremap / /\v
" cnoremap %s/ %sm/

" Move by line
nnoremap j gj
nnoremap k gk
nnoremap gj j 
nnoremap gk k

let g:airline#extensions#coc#enabled = 1

" File list
nnoremap <C-p> :<C-u>FZF<CR>

" set shiftwidth=2
" set tabstop=2
" set softtabstop=2



set incsearch
" augroup vimrc-incsearch-highlight
"   autocmd!
"   autocmd CmdlineEnter /,\? :set hlsearch
"   autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END

let g:sneak#label = 1

" :Subvert integration with for substitution preview
let g:traces_abolish_integration = 1

" fix for `gx` not opening urls properly on vim 8.2
" https://github.com/vim/vim/issues/4738
if has('macunix')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif


" let g:go_def_mapping_enabled = 0
let g:go_doc_popup_window = 1
