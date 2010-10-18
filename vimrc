set nocp "http://www.guckes.net/vim/setup.html

"pathogen
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags() "call this when installing new plugins
filetype plugin indent on


set number
set title
syntax on
set mouse=
set autoindent 
set background=dark
set shiftwidth=4
set softtabstop=4
set nowrap

"theme I'll try to get used to it, but I really like
"the bold look on non-256color terminals :/
color xoria256


"get out of insert mode more quickly
"you'd have to be really unlucky to
"have to type "kj" in a real world
"use case
inoremap kj <Esc>

"mes raccourcis comme dans notepad++ pour bouger des lignes
"bouger la ligne vers le bas
nnoremap <silent> <C-Down> :.m+<CR>
"bouger la ligne vers le haut
nnoremap <silent> <C-Up> :-m.<CR>k

"folding : repère les bloc du langage à plier
set foldmethod=syntax
"
"snipMate
let g:snips_author = 'Florent Jaby'
"automatically open and close de popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview



"twitter shortcuts   
let g:twitterusername='floby'
let g:twitterpassword=''
map <unique> <Leader>kp <Esc>:let g:twitterpassword=inputsecret('password? ')<cr>
map <unique> <Leader>kw <Esc>:execute 'TwitterStatusUpdate ' . inputdialog('Enter a twitter status message:')<cr>
map <unique> <Leader>kf <Esc>:TwitterFriendsTimeline<cr>


