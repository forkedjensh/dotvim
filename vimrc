set path+=**

" True colour
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors

" Colorscheme
colorscheme gruvbox

" File locations
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

" Configuration
set backup
set undofile

set cursorline
set textwidth=79
set colorcolumn=80
set wrap
set formatoptions=qrn1

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

set noshowmode
set showcmd
set hidden
set visualbell
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

set number relativenumber
set complete+=kspell

" Maps
let mapleader = "ö"
inoremap jk <esc>
nnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
vnoremap / /\v

" Zoom window to new tab
nmap <Leader>zo :tabnew %<CR>
nmap <Leader>zc :tabclose<CR>

" FZF maps
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :Rg<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>w :Windows<CR>
nnoremap <silent> <Leader>t :Tags<CR>
nnoremap <silent> <Leader>H :Helptags<CR>

"" map brackets (german keyboard layout)
nmap ü [
nmap + ]
omap ü [
omap + ]
xmap ü [
xmap + ]
nmap Ü {
nmap * }
omap Ü {
omap * }
xmap Ü {
xmap * }

" Autocmds
" autocmd FocusLost * :wa
autocmd Filetype gitcommit setlocal spell textwidth=72 spell spelllang=en
autocmd BufRead,BufNewFile *.yml set filetype=yaml.ansible
" autocmd FileType python setlocal formatprg=autopep8\ -\ 2>\ /dev/null
autocmd FileType python setlocal formatprg=black\ -l79\ -\ 2>\ /dev/null

" Solve ycm ultisnips key mapping problem
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Lightline
function MyFugitiveHead()
    let head = FugitiveHead()
    if head != ""
        let head = "\uf126 " .. head
    endif
    return head
endfunction

let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'MyFugitiveHead'
    \ },
\ }

" rst support in tagbar
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '$HOME/bin/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"UltiSnips
let g:ultisnips_python_style="numpy"

" ReST tables with vim-table-mode
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

" Let ales populate the quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" riv rst maps
autocmd filetype rst nnoremap <leader>h0 :RivTitle0<CR>
autocmd filetype rst nnoremap <leader>h1 :RivTitle1<CR>
autocmd filetype rst nnoremap <leader>h2 :RivTitle2<CR>
autocmd filetype rst nnoremap <leader>h3 :RivTitle3<CR>
autocmd filetype rst nnoremap <leader>h4 :RivTitle4<CR>

" completor.vim complition with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
