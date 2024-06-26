set path+=**

" True colour
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set termguicolors

" Ensure unicode
set encoding=utf-8
set fileencoding=utf-8

" Colorscheme
set background=dark
let g:gruvbox_guisp_fallback = "bg"
colorscheme gruvbox
let g:gruvbox_italic=1

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

" Maps
let mapleader = "ö"
inoremap jk <esc>
nnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap j gj
nnoremap k gk
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
autocmd Filetype gitcommit setlocal spell textwidth=72 spell spelllang=en
autocmd FileType python setlocal formatprg=black\ -l79\ -\ 2>\ /dev/null
autocmd FileType qf setlocal colorcolumn=
autocmd FileType mail,markdown,rst,tex setlocal spell spelllang=de

" mucomplete
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1
set complete-=i
set complete-=t
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#completion_delay = 500
let g:mucomplete#reopen_immediately = 0

let g:mucomplete#chains = {}
let g:mucomplete#chains['default']   =  {
    \ 'default': ['ulti',  'list',  'omni',  'path',  'c-n',   'uspl'],
    \ '.*string.*': ['uspl'],
    \ '.*comment.*': ['uspl']
    \ }
let g:mucomplete#chains['html']      =  ['ulti',  'omni',  'path',  'c-n',   'uspl']
let g:mucomplete#chains['vim']       =  ['ulti',  'list',  'cmd',   'path',  'keyp']
let g:mucomplete#chains['tex']       =  ['ulti',  'path',  'omni',  'uspl',  'dict',  'c-n']
let g:mucomplete#chains['sh']        =  ['ulti',  'file',  'dict',  'keyp']
let g:mucomplete#chains['zsh']       =  ['ulti',  'file',  'dict',  'keyp']
let g:mucomplete#chains['java']      =  ['ulti',  'keyn',  'c-n',   'omni']
let g:mucomplete#chains['javascript']=  ['ulti',  'tags',  'omni',  'c-n']
let g:mucomplete#chains['c']         =  ['ulti',  'list',  'omni',   'c-n']
let g:mucomplete#chains['go']        =  ['ulti',  'list',  'omni',  'c-n']
let g:mucomplete#chains['troff']     =  ['ulti',  'omni',  'keyn',   'uspl',  'dict']
let g:mucomplete#chains['nroff']     =  g:mucomplete#chains['troff']
let g:mucomplete#chains['markdown']  =  ['ulti',  'path',  'c-n',   'uspl',  'dict']
let g:mucomplete#chains['dotoo']     =  g:mucomplete#chains['markdown']
let g:mucomplete#chains['mail']      =  g:mucomplete#chains['markdown']
let g:mucomplete#chains['gitcommit'] =  g:mucomplete#chains['markdown']

inoremap <silent> <expr> <plug>MyCR
    \ mucomplete#ultisnips#expand_snippet("\<cr>")
imap <cr> <plug>MyCR

" Solve mucomplete ultisnips key mapping problem
let g:UltiSnipsExpandTrigger="<f5>"
let g:UltiSnipsJumpForwardTrigger="<f5>"
let g:UltiSnipsJumpBackwardTrigger="<f6>"

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

" UltiSnips
let g:ultisnips_python_style="numpy"

" vim-lsp
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" disable some conceals
let g:tex_conceal = ''
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" let vim-sleuth do intendations as polyglot is missing editorconfig
let g:polyglot_disabled = ['autoindent']
