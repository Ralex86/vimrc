if [ ! -f ~/.vimrc ]; then
    echo "vimrc not found !"
		echo "creating one..."
		touch .vimrc
fi

cat << 'EOT' > ~/.vimrc
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
set statusline+=%{
SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute ","trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!","discarding unexpected"]

let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
EOT

cd
mkdir -p .vim/{autoload,colors,syntax,plugin,spell,config}

mv .vimrc .vim/vimrc
ln -s .vim/vimrc .vimrc

cd ~/.vim
git clone https://github.com/tpope/vim-pathogen.git pathogen

cd autoload
ln -s ../pathogen/autoload/pathogen.vim .

echo "installing plugins"
echo "...................."
echo "installing gruvbox"
cd ~/.vim/bundle
git clone https://github.com/morhetz/gruvbox

echo "installing nerdcommenter"  
cd ~/.vim/bundle
git clone https://github.com/ddollar/nerdcommenter

echo "installing nerdtree"   
cd ~/.vim/bundle
git clone https://github.com/jistr/vim-nerdtree-tabs

echo "vim-airline"      
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

echo "vim-jsx"
cd ~/.vim/bundle
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx

echo "html5.vim "         
cd ~/.vim/bundle
git clone https://github.com/othree/html5-syntax.vim

echo "surround "  
cd ~/.vim/bundle        
git clone https://github.com/tpope/vim-surround

echo "vim-airline-themes"
cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes

echo "vim-move"
cd ~/.vim/bundle
git clone https://github.com/potatoesmaster/vim-movelines

echo "syntastic"
cd ~/.vim/bundle      
git clone https://github.com/scrooloose/syntastic

echo "vim-closetag"
cd ~/.vim/bundle 
git clone https://github.com/alvan/vim-closetag
	
echo "vim-prettier"
cd ~/.vim/bundle
git clone https://github.com/mitermayer/vim-prettier
			 
#ultisnips      
#cd ~/.vim/bundle
#git clone https://github.com/sirver/ultisnips
	
echo "vim-javascript"
cd ~/.vim/bundle
git clone https://github.com/pangloss/vim-javascript
 
echo "vim-snippets"
cd ~/.vim/bundle
git clone https://github.com/honza/vim-snippets
