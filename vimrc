scriptencoding utf-8
set encoding=utf-8
set expandtab
set ts=4
set sw=4
set autoindent
set incsearch
set hidden
syntax on
set background=light
set t_Co=256
colorscheme biogoo
set ic
set gdefault
filetype plugin indent on
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set laststatus=2


au InsertLeave * hi Cursor guibg=red
au InsertEnter * hi Cursor guibg=green

if &term =~ "xterm\\|rxvt"
    " use an orange cursor in insert mode
    let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
    let &t_EI = "\<Esc>]12;red\x7"
    silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
    autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
endif

map <F8> :cn<CR>zz
map <S-F8> :cp<CR>
map <F12> :bel spl<CR>:GoDef<CR>
map <C-F12> :GoDef<CR>
map <F7> :GoRename<CR>

" disable broken erase-background-color
set t_ut=

au FileType cpp set tags^=./tags;
au FileType h set tags^=./tags;
map <F12> <C-W>]

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    " set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
autocmd FileType go setlocal makeprg=$HOME/build-go.sh\ %
autocmd FileType go map <C-]> :GoDef<CR>
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

map <F3> :grep -g !src/observe/vendor/ -g !src/observe/3rd_party/ -g !*.pb.go 
set list
set listchars=tab:»\ ,trail:🞎

autocmd FileType yaml setlocal ts=2 sw=2
set maxmempattern=4096
" avoid accidentally open a help window and do something useful
map <F1> :w<CR>

