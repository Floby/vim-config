"pathogen
filetype off
call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
set nocp "http://www.guckes.net/vim/setup.html
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
"nnoremap <C-Down> ddp
nnoremap <silent> <C-Down> :.m+<CR>
"bouger la ligne vers le haut
"nnoremap <C-Up> ddkP
nnoremap <silent> <C-Up> :-m.<CR>k

"FuzzyFinder
"call fuf#defineLaunchCommand('FufCWD', 'file', 'fnamemodify(getcwd(), "%%s:h")')
"map <leader>t :FufCWD **/<CR>


"folding : repère les bloc du langage à plier
set foldmethod=syntax

"thème
"colorscheme wombat
"colorscheme xoria256

"ctags
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

"OmniCppComplete
let OmniCpp_NamespaceSearh = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std" , "_GLIBCXX_STD"]

"automatically open and close de popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


"load tags
set tags+=~/.vim/tags/stl
set tags+=~/.vim/tags/v8
set tags+=~/.vim/tags/wx




"twitter shortcuts   
let g:twitterusername='floby'
let g:twitterpassword=''
map <unique> <Leader>kp <Esc>:let g:twitterpassword=inputsecret('password? ')<cr>
map <unique> <Leader>kw <Esc>:execute 'TwitterStatusUpdate ' . inputdialog('Enter a twitter status message:')<cr>
map <unique> <Leader>kf <Esc>:TwitterFriendsTimeline<cr>


