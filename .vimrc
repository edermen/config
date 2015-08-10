:set mouse=a
:set clipboard=unnamedplus
set tabstop=2
set expandtab
set shiftwidth=2
:retab
"":set hlsearch
set hlsearch
set number
filetype off
syntax on
set nocompatible
set linebreak
filetype plugin indent on
"CodeFolding
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set dy=lastline
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'groenewege/vim-less'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'iblerins/flattown'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-obsession'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'
Plugin 'hwartig/vim-seeing-is-believing'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-easy-align'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'raimondi/delimitmate'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-endwise'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Shutnik/jshint2.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'slim-template/vim-slim'
Plugin 'duythinht/inori'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'chrisbra/Colorizer'
call vundle#end()
colorscheme flattown
:set diffopt+=vertical
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
hi Comment ctermbg=250 ctermfg=000
" Airline option
:set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
:set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
:set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"Tab colorized
nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
xmap <buffer> <F5> <Plug>(seeing-is-believing-run)
imap <buffer> <F5> <Plug>(seeing-is-believing-run)
" CTags
nmap <silent> <C-L> :ta <C-R><C-W><cr>
nmap <silent> <C-G> :!ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)<cr>
set tags=./tags;
"TagBar
nmap <F8> :TagbarToggle<CR>
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"vim-rspec
map <S-R> :call RunCurrentSpecFile()<CR>
let g:rspec_command = '!spring rspec {spec}'
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let delimitMate_expand_cr = 1
" NerdTree keymap
map <S-s> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

filetype indent plugin on
nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
imap <buffer> <F4> <Plug>(seeing-is-believing-mark)
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-t> :tabnew .<CR>
nnoremap <C-S-[> :pop<CR>
inoremap <C-j> <Esc>:tabprevious<CR>i
inoremap <C-k> <Esc>:tabnext<CR>i
inoremap <C-t> <Esc>:tabnew .<CR>
"IndentLine color
let g:indentLine_color_term = 239
let g:indentLine_color_tty_light = 7 " (default: 4)
:set list lcs=tab:\┆\
let g:indentLine_color_dark = 1 " (default: 2)
"pasteTogggle
set pastetoggle=<C-S-e>
"Color CSS displaying
:let g:colorizer_auto_color = 1
:let g:colorizer_auto_filetype='css,html,scss,sass,less,.vimrc' 
"Emmet keyBindings
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to

let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_expandabbr_key='<C-space>'   "This maps the expansion to Ctrl-space 
let g:user_emmet_expandabbr_key = '<Nul>'
let g:use_emmet_complete_tag=1
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

