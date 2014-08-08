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

