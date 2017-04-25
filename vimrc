set nocompatible
syntax on

"{{{ Vundle 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'alfredodeza/coveragepy.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

filetype plugin indent on
"}}}

"{{{ Syntastic 
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_rust_checkers=['rustc'] 
"let g:syntastic_c_checkers=['make'] 
let g:syntastic_c_checkers=['gcc'] 
let g:syntastic_python_checkers=['python3'] 

let g:syntastic_c_compiler_options='-Wall -Wextra -Wshadow -pedantic -std=gnu99'
let g:syntastic_c_splint_args='+posixlib'
"}}}

"{{{ Global Settings 
set backspace=indent,eol,start

set autoread
set splitright

set ruler
set colorcolumn=80

set foldcolumn=1
set foldmethod=marker

command W w !sudo tee % > /dev/null
command Mdcc !pandoc -f markdown --latex-engine=pdflatex -o %:r.pdf %
"}}}

"{{{ ext --> filetype 
au BufRead,BufNewFile *.asm setl filetype=nasm
au BufRead,BufNewFile *.sql setl filetype=mysql
au BufRead,BufNewFile *.rs setl filetype=rust
au BufRead,BufNewFile *.glsl setl filetype=glsl
au BufRead,BufNewFile *.md setl filetype=markdown
"}}}

"{{{ Spacing 
setl tabstop=4
setl shiftwidth=4
setl expandtab
setl smarttab
"}}}

"{{{ Filetype Customizations 
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype c,java,cpp setlocal tabstop=3 shiftwidth=3
autocmd Filetype hs setlocal tabstop=8 shiftwidth=8
autocmd Filetype make,go setlocal noexpandtab

autocmd Filetype text,markdown,tex setl spell spelllang=en_us tw=80 fo+=t
autocmd Filetype gitcommit setl spell spelllang=en_us tw=72 fo+=t
"}}}
