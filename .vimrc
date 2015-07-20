filetype off
execute pathogen#infect()
syntax on
filetype plugin on
filetype indent on

let mapleader="`"

set textwidth=130
set shiftwidth=4
set tabstop=4

set expandtab

set foldnestmax=5
set laststatus=2

" Make the cursor visible
" ----------------------
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

if &diff
    colorscheme diffcolor
endif

" PHP Options
" =====================

" Syntax settings
" ---------------------
let php_sql_query = 1           " for SQL syntax highlighting inside strings
let php_htmlInStrings = 1       " for HTML syntax highlighting inside strings
let php_baselib = 1             " for highlighting baselib functions
let php_asp_tags = 1            " for highlighting ASP-style short tags
let php_parent_error_close = 1  " for highlighting parent error ] or )
let php_parent_error_open = 1   " for skipping an php end tag, if there exists an open ( or [ without a closing one
let php_oldStyle = 0            " for using old colorstyle
let php_noShortTags = 1         " don't sync <? ?> as php
let php_folding = 2             " 1 for folding classes and functions
                                " 2 for folding all { } regions
let php_sync_method = -1

" disable autofolding while typing braces
autocmd InsertEnter *.php if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave *.php if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Indent settings
" ---------------------
let g:PHP_removeCRwhenUnix = 1
