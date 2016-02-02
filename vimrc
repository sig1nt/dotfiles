set nocompatible

filetype plugin on
filetype indent on

syntax on

set autoread

command W w !sudo tee % > /dev/null

autocmd Filetype c,java,cpp setlocal tabstop=3 shiftwidth=3
autocmd Filetype py,make,sh setlocal tabstop=4 shiftwidth=4
autocmd Filetype hs setlocal tabstop=8 shiftwidth=8
set expandtab
autocmd Filetype make setlocal noexpandtab
set smarttab

au BufRead,BufNewFile *.asm set filetype=nasm
set ruler
