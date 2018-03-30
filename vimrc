set nocompatible

"{{{ Syntax Highlighting
set t_Co=256
syntax on

highlight Comment           ctermfg=blue
highlight SpecialComment    ctermfg=blue
highlight Error             ctermfg=none
highlight Constant          ctermfg=none
highlight Identifier        ctermfg=none
highlight Statement         ctermfg=none
highlight PreProc           ctermfg=none
highlight Type              ctermfg=none
highlight Special           ctermfg=none
highlight Underlined        ctermfg=none
"}}}

"{{{ Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'w0rp/ale'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'parkr/vim-jekyll'
Plugin 'tpope/vim-liquid'
Plugin 'jamessan/vim-gnupg'
Plugin 'junegunn/goyo.vim'

call vundle#end()

filetype plugin indent on
"}}}

"{{{ Global Settings 
set backspace=indent,eol,start

set autoread
set splitright

set ruler
set colorcolumn=80

set foldcolumn=1
set foldmethod=marker

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

map q: :q

set tags=./.git/tags;,./tags;
map <C-K> <C-]>

let mapleader = ","

autocmd CompleteDone * pclose
"}}}

"{{{ ALE 
let g:airline#extensions#ale#enabled = 1
let g:ale_rust_cargo_check_all_targets = 0
let g:goyo_width = 85
nmap <Leader>a :ALEDetail<CR>
"}}}

"{{{ FZF
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>R :silent exec '!git ctags' <bar> :Tags<CR>
"}}}

"{{{ Custom Commands
command W w !sudo tee % > /dev/null
command Mdcc !pandoc -f markdown --pdf-engine=pdflatex -o %:r.pdf %
nmap <Leader>md :Mdcc<CR>
"}}}

"{{{ ext --> filetype 
au BufRead,BufNewFile *.asm setl filetype=nasm
au BufRead,BufNewFile *.sql setl filetype=mysql
au BufRead,BufNewFile *.rs setl filetype=rust
au BufRead,BufNewFile *.glsl setl filetype=glsl
au BufRead,BufNewFile *.md setl filetype=markdown
au BufRead,BufNewFile .gitconfig setl filetype=gitconfig
"}}}

"{{{ Spacing 
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
"}}}

"{{{ Filetype Customizations 
autocmd Filetype html setlocal tabstop=2 shiftwidth=2
autocmd Filetype java,sml setlocal tabstop=3 shiftwidth=3
autocmd Filetype hs setlocal tabstop=8 shiftwidth=8
autocmd Filetype make,go setlocal noexpandtab

autocmd Filetype text,markdown,tex,plaintex setl spell spelllang=en_us tw=80 fo+=t
autocmd Filetype gitcommit,mail setl spell spelllang=en_us tw=72 fo+=t
autocmd Filetype gitconfig setl noexpandtab
"}}}
