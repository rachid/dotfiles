filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Easy navigation through cucumber features
Bundle 'tpope/vim-cucumber'
Bundle 'gmarik/vundle'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'heartsentwined/vim-emblem'
Bundle 'ngmy/vim-rubocop'
Bundle 'skalnik/vim-vroom'
Bundle 'JarrodCTaylor/vim-js2coffee'
Bundle 'nono/vim-handlebars'
Bundle 'JetBrains/ideavim'
Bundle 'groenewege/vim-less'


Bundle 'vim-scripts/renamer.vim'

" Git integration
Bundle 'git.zip'
Bundle 'fugitive.vim'

" Org-mode clone
Bundle 'vimorganizer'
Bundle 'Calendar.vim'
Bundle 'chrisbra/NrrwRgn'
Bundle 'UTL.VIM'
Bundle 'scrooloose/nerdtree'

" Tmux integration
Bundle 'teranex/tslime.vim'

" Navigation
Bundle 'Lokaltog/vim-easymotion'

" Looks
Bundle 'bling/vim-airline'

" Easy manipulating surrounding chars
Bundle 'tpope/vim-surround'


" Code support
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'jQuery'
Bundle 'rails.vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'ragtag.vim'
Bundle 'SuperTab'

" Marking
Bundle 'vim-scripts/Mark'

" Utility
Bundle 'repeat.vim'
Bundle 'file-line'
Bundle 'Align'

" File navigation
Bundle 'ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-pathogen'

" General config
call pathogen#infect()

let g:org_command_for_emacsclient = 'emacsclient'
" CtrlP
let g:ctrlp_use_caching=0
"let g:ctrlp_user_command="find %s -type f -not -path '*/.git/*' -not -path '*/.sass-cache/*' -not -path '*/tmp/*' -not -path '*"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'

noremap <LocalLeader># "ayiw:Ack <C-r>a<CR>
nnoremap Q <nop>

" JS2Coffee
nnoremap<Leader>bc :CoffeeBuffer2JS<CR>
nnoremap<Leader>sc :CoffeeSelection2JS<CR>
nnoremap<Leader>bj :JSBuffer2Coffee<CR>
nnoremap<Leader>bs :JSSelection2Coffee<CR>

vnoremap <LocalLeader># "ay:Ack <C-r>a<CR>

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
set laststatus=2
set backspace=2
set showcmd
set ruler
set modelines=1
set pastetoggle=<F2>
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set nowritebackup
set noswapfile
set scrolloff=3
set hidden
set autoread
set history=100
set path+=./**
set scrolloff=3
set splitright
set splitbelow
set suffixesadd+=.rb
set wildignore+=*.log,*.o,*.obj,.git,tmp,doc,.idea,target,node_modules
set wildmode=list:longest,list:full
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|images|idea|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
set complete=.,w,t
set number
set encoding=utf-8
set cursorline
set cursorcolumn
set hidden
set autoread

set nocompatible
set ttimeoutlen=50

" Indenting
set ai " Automatically set the indent of a new line
set si " Smart indent

" Syntax highlighting
set showmatch " matching braces
set background=dark

set showmatch " matching braces
set background=dark

let g:Powerline_symbols = 'fancy'

syntax on
filetype plugin indent on
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

let mapleader=","
let g:airline_powerline_fonts=1

filetype plugin indent on     " required!

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

inoremap jj <Esc>
nmap <up> :bp<cr>
nmap <down> :bn<cr>
nmap <silent> <left> <<
nmap <silent> <right> >>
vmap <silent> <left> <
vmap <silent> <right> >
imap <silent> <left> <C-D>
imap <silent> <right> <C-T>

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <leader>l :set list!<CR>
imap <Tab> <C-R>=SuperTab()<CR>

" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

nnoremap <silent> <C-b> :CtrlPBuffer<CR>
nnoremap <silent> <C-t> :CtrlP<CR>
nnoremap <silent> <C-r> :CtrlPClearCache<CR>
nnoremap <silent> <C-x> :bd<CR>

autocmd BufWritePre * :%s/\s\+$//e

function! SuperTab()
  if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
      return "\<Tab>"
  else
      return "\<C-n>"
  endif
endfunction

augroup Cucumber
  au!
  autocmd BufNewFile,BufReadPost,BufEnter *.feature,*.story
    \ set filetype=cucumber|
    \ :nmap <leader>r :call Send_to_Tmux("clear\nbin/cucumber " . expand("%") . "\n")<CR>|
    \ :nmap <leader>R :call Send_to_Tmux("clear\nbin/cucumber " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
augroup END

augroup Ruby
  au!
  autocmd BufNewFile,BufReadPost,BufEnter *.rb
    \ set filetype=ruby|
    \ :nmap <leader>r :call Send_to_Tmux("clear\nruby " . expand("%") . "\n")<CR>|
augroup END

augroup Rspec
  au!
  autocmd BufNewFile,BufReadPost,BufEnter *_spec.rb
    \ :nmap <leader>r :call Send_to_Tmux("clear\nrspec " . expand("%") . "\n")<CR>|
    \ :nmap <leader>R :call Send_to_Tmux("clear\nrspec " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
    \ :nmap <leader>m :call Send_to_Tmux("clear\nmspec " . expand("%") . "\n")<CR>|
    \ :nmap <leader>M :call Send_to_Tmux("clear\nmspec " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
    \ :nmap <leader>y :call Send_to_Tmux("clear\nbin/rspec " . expand("%") . "\n")<CR>|
    \ :nmap <leader>Y :call Send_to_Tmux("clear\nbin/rspec " . expand("%") . "\:<C-R>=line(".")<CR>\n")<CR>|
augroup END

color tomorrow-night
