set nocompatible              " be iMproved
filetype off                  " required!
set relativenumber
set hidden


call plug#begin('~/.vim/plugged')
"Plug 'dense-analysis/ale'
Plug 'rking/ag.vim'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'bling/vim-airline'
Plug 'https://github.com/sjl/tslime.vim'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'liuchengxu/vista.vim'
Plug 'dpelle/vim-LanguageTool'
Plug 'tpope/vim-fugitive'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system
call plug#end()

let g:coc_node_path = '/usr/local/bin/node'

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
set nowritebackup
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
"colorscheme darkblue
"colorscheme default
"set background=dark

com! FormatJSON %!python -m json.tool

"set list
"set listchars=tab:▸\ ,eol:¬

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal nospell 
setglobal nospell
setlocal spell spelllang=en_us
setglobal spell spelllang=en_us
let g:languagetool_jar='/usr/local/Cellar/languagetool/4.7/libexec/languagetool-commandline.jar' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse use in all modes
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keyboard shotcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let mapleader = "\ "
let mapleader = ","
nnoremap <Leader>s :set spell!

map <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :LanguageToolCheck<CR>
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


augroup rainbow_lisp
  autocmd!
  autocmd FileType python,lisp,clojure,scheme RainbowParentheses
augroup END

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
au FileType python  set ai et   nospell tw=80
autocmd FileType python nnoremap <leader>y :0,$!yapf --style facebook<Cr><C-o>
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
"source ~/.vimrc.neocomplete 

" Merkdown Vim
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Persistent Undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ve more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
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
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

