set nocompatible

"Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()

set encoding=utf-8

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='soft'
set number

filetype plugin indent on
syntax on

"airline theme
set noshowmode
let g:airline_theme='wombat'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1


"moving lines
" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NERDTree
autocmd VimEnter * NERDTree
nnoremap <C-g> :NERDTreeToggle<CR>
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen=1
"let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" tabulation

set tabstop=2
set softtabstop=0 noexpandtab
set shiftwidth=2

" syntaxic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute ","trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!","discarding unexpected"]

let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""inoremap ( (<CR>)<C-c>O
inoremap { {<CR>}<C-c>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ` ``<Esc>i
inoremap ' ''<Esc>i


" Prettier:
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

" closing-tag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

