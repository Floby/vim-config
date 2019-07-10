"pathogen
filetype off
call pathogen#runtime_append_all_bundles()

"call pathogen#helptags() "call this when installing new plugins 
filetype plugin on
filetype indent on
set diffopt+=vertical

"look for per directory .exrc files
set exrc

set nocp "http://www.guckes.net/vim/setup.html

set hlsearch
set encoding=utf-8
set scrolloff=3
set sidescrolloff=5
" in vim 7.3"
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2 "broken after pugrading to 7.3 
"set relativenumber "See last line"
set undofile
set colorcolumn=120


set number
set title
syntax on
"Highlight trailing whitespaces
autocmd Syntax * syn match TrailingWhitespace /\s\+$/
autocmd Syntax * highlight def link TrailingWhitespace Error
"Remove trailing whitespaces for certain files when saving
autocmd FileType c,cpp,java,javascript,php,groovy,tf autocmd BufWritePre <buffer> %s/\s\+$//e

set mouse=

" indenting http://tedlogan.com/techblog3.html
set autoindent 
set expandtab "hitting tab insert spaces instead of <Tab>
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nowrap " kikoo (lol)"

"get out of insert mode more quickly
"you'd have to be really unlucky to
"have to type "kj" in a real world
"use case
inoremap kj <Esc>
"add a semicolon ';' at the end of the line
nnoremap ;; A;<Esc>

"mes raccourcis comme dans notepad++ pour bouger des lignes
"bouger la ligne vers le bas
nnoremap <silent> <C-Down> :.m+<CR>
"bouger la ligne vers le haut
nnoremap <silent> <C-Up> :-m.<CR>k

"
"snipMate
let g:snips_author = 'Florent Jaby'
"automatically open and close de popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"xml html
let g:xml_syntax_folding = 1
"folding : repère les bloc du langage à plier
set foldmethod=syntax

"twitter shortcuts   
let g:twitterusername='floby'
let g:twitterpassword=''
map <unique> <Leader>kp <Esc>:let g:twitterpassword=inputsecret('password? ')<cr>
map <unique> <Leader>kw <Esc>:execute 'TwitterStatusUpdate ' . inputdialog('Enter a twitter status message:')<cr>
map <unique> <Leader>kf <Esc>:TwitterFriendsTimeline<cr>


"theme I'll try to get used to it, but I really like
"the bold look on non-256color terminals :/
set background=dark
color xoria256
"colorscheme solarized
"this has moved here so 
"everything before it is executed

set wildignore+=.git
set wildignore+=node_modules
set wildignore+=dist
set wildignore+=coverage



" pastbin conf


"because it doesn't work earlier"
"set relativenumber
