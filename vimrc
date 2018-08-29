set nocompatible

"{{{ Syntax Highlighting
set t_Co=256
syntax on

highlight Comment           ctermfg=blue
highlight SpecialComment    ctermfg=blue
highlight String            ctermfg=DarkGrey
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
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/goyo.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'romainl/vim-qf'

call vundle#end()

filetype plugin indent on

let g:rust_conceal = 1 
let g:rust_conceal_mod_path = 1 
let g:goyo_width = 85
"}}}

"{{{ Global Settings 
set backspace=indent,eol,start

set autoread
set splitright

set number
set ruler
set colorcolumn=80

set foldmethod=marker

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

map q: :q

set tags=./.git/tags;,./tags;
map <C-K> <C-]>

let mapleader = ","

autocmd CompleteDone * pclose

hi clear conceal
"}}}

"{{{ Status Line
set laststatus=2
set statusline=
set statusline+=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=%{PasteForStatusline()}
set statusline+=[%L]
set statusline+=[%{&ff}]
set statusline+=%y
set statusline+=[%p%%]
set statusline+=[%04l,%04v]
"}}}

"{{{ FZF
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>R :silent exec '!git ctags' <bar> :Tags<CR>
"}}}

"{{{ Goyo
function! s:goyo_enter()
    setl fo-=t
endfunction

function! s:goyo_leave()
    setl fo+=t
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"}}}

"{{{ Custom Commands
command W w !sudo tee % > /dev/null
command Mdcc !pandoc -f markdown --pdf-engine=pdflatex -o %:r.pdf %
nmap <Leader>md :Mdcc<CR>

"https://vi.stackexchange.com/questions/343/how-to-edit-binary-files-with-vim
" Hex read
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>
" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

command -nargs=1 Curl r !curl -s <q-args>

function! PasteForStatusline()
    let paste_status = &paste
    if paste_status == 1
        return "[paste]"
    else
        return ""
    endif
endfunction
"}}}

"{{{ ext --> filetype 
au BufRead,BufNewFile *.asm setl filetype=nasm
au BufRead,BufNewFile *.s setl filetype=armv7
au BufRead,BufNewFile *.sql setl filetype=mysql
au BufRead,BufNewFile *.rs setl filetype=rust
au BufRead,BufNewFile *.glsl setl filetype=glsl
au BufRead,BufNewFile *.md setl filetype=markdown
au BufRead,BufNewFile .gitconfig setl filetype=gitconfig
au BufRead,BufNewFile *.ts setl filetype=c
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
autocmd Filetype rust compiler cargo
autocmd Filetype vim setl foldcolumn=1

autocmd Filetype text,markdown,tex,plaintex setl spell spelllang=en_us tw=80 fo+=t
autocmd Filetype gitcommit,mail setl spell spelllang=en_us tw=72 fo+=t
autocmd Filetype gitconfig setl noexpandtab
"}}}
