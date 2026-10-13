syntax on

set nu
set rnu
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype indent on

set cursorline
set hlsearch
set incsearch

highlight Normal guibg=NONE ctermbg=NONE
highlight NormalNC guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight NormalFloat guibg=NONE ctermbg=NONE
highlight FloatBorder guibg=NONE ctermbg=NONE

autocmd! bufwritepost .vimrc source ~/.vimrc

function! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command! W call WriteCreatingDirs()
