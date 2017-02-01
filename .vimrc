set nocompatible              " be iMproved
filetype off                  " required!
:set relativenumber

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" My bundles here:
"
" original repos on GitHub
Plugin 'Lokaltog/vim-easymotion'
Plugin 'L9'
"Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'Tabular'
Plugin 'Syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'https://github.com/sjl/tslime.vim'
Plugin 'fugitive.vim'
Plugin 'rainbow_parentheses.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'airblade/vim-gitgutter'
"Plugin 'jcfaria/Vim-R-plugin'
Plugin 'JuliaLang/julia-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Tagbar'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter'
let g:latex_to_unicode_tab = 0
Plugin 'LanguageTool'

" neocomplete
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'sjl/badwolf'

"vimside
Bundle "megaannum/self"
Bundle "megaannum/forms" 
Bundle "Shougo/vimproc"
Bundle "Shougo/vimshell"
Bundle "aemoncannon/ensime"
Bundle "megaannum/vimside" 

" All of your Plugins must be added before the following line
call vundle#end()            " required


filetype plugin indent on     " required!
" Enable filetype plugins
filetype plugin on
filetype indent on
syntax on

" Set to auto read when a file is changed from the outside
set autoread
set number
highlight LineNr ctermfg=grey
"Always show current position
set ruler

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Backspace always works
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Line break on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" disable code folding
set foldlevelstart=99

" better code indent
xnoremap > >gv
xnoremap < <gv

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set t_ut=   "http://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
set tm=500

" 80/100 columns boundaries

syntax enable
"colorscheme solarized
colorscheme darkblue
set background=dark

com! FormatJSON %!python -m json.tool

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setlocal nospell 
"setglobal nospell
"setlocal spell spelllang=en_us
setglobal spell spelllang=en_us
let g:languagetool_jar='/usr/local/Cellar/languagetool/3.5/libexec/languagetool-commandline.jar' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse use in all modes
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard shotcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\ "
nnoremap <Leader>s :set spell!

map <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
  \ ]
\ }


" Rainbow parenthesis always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip       " MacOSX/Linux
set wildignore+=*.pdf,*.aux,*.out,*.fdb_latexmk "Latex
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
    \ 'file': '\v\.(exe|so|dll|class|pyc)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" Markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.md  setf markdown


" Filetypes indention and spelling
let g:tex_flavor = "latex"
au FileType tex     set ai et     spell tw=80 
au FileType latex   set ai et     spell tw=80 
au FileType matlab  set ai et   nospell tw=780
au FileType java    set ai et   nospell tw=780 cindent
au FileType scala   set ai et   nospell tw=780 cindent
au FileType python  set ai et   nospell tw=780
au FileType perl    set    et   nospell tw=780 cindent
au FileType awk     set ai et   nospell tw=780
au FileType php     set ai et   nospell tw=780 cindent
au FileType html    set ai et   nospell tw=780
au FileType sh      set ai et   nospell
au FileType scheme  set ai et   nospell tw=780 lisp
au FileType lex     set ai et   nospell
au FileType yacc    set ai et   nospell
au FileType vim     set ai et   nospell
au FileType babe    set ai et   nospell
au FileType xml     set ai et   nospell
au FileType sgml    set ai et   nospell
au FileType txt     set ai et     spell tw=80
au FileType md      set ai et     spell tw=80

" Neocomplete
source ~/.vimrc.neocomplete 

" Merkdown Vim
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PyMode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_rope = 0
let g:pymode_lint_write = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Persistent Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
