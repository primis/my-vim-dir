syntax enable
set tabstop=2   " taps are 4 spaces wide
set softtabstop=2
set shiftwidth=2
set expandtab   " using <TAB> turns them into spaces
set number    " line numbers
set showcmd   " show last command at bottom of screen
filetype indent on  " load filetype-specific indent files
set wildmenu    " visual autocomplete
set lazyredraw    " Prevent redrawing unless we need it
set showmatch   " highlight matching for [{()}]
set incsearch
set hlsearch
set smartindent
set autoindent
nnoremap <leader><space> :nohlsearch<CR>

" key remaps
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd FileType c setlocal tabstop=4
    autocmd FileType c setlocal shiftwidth=4
    autocmd FileType java setlocal noexpandtab
  autocmd FileType java setlocal list
  autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


" srip trailing whitespace at end of files. This is called on buffer overwrite
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline Stuff

let g:airline_powerline_fonts            = 1
let g:airline_theme = 'solarized'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" colorscheme
set background=dark
let g:solarized_use16 = 1
colorscheme solarized8

" Highlight trailing whitespace
highlight ws ctermbg=red guibg=red
match ws /\s\+$/

highlight OverLength ctermbg=cyan ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

