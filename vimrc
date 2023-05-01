"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               

"-------------------------------------------------------------------------- 
" Get the name of the git branch.
"-------------------------------------------------------------------------- 
function! StatuslineGit()
  return trim(system("git branch 2> /dev/null | sed -e 's/..//'"))
endfunction

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

" Set the colorscheme
colorscheme industry

" Show relative line numbering.
set relativenumber 

" TAB STOPS SETTINGS ----------------------------------------------------- 
    " Only do this part when compiled with support for autocommands.
    if has("autocmd")
        " Use filetype detection and file-based automatic indenting.
        filetype plugin indent on

        " Use actual tab chars in Makefiles.
        autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    endif

    filetype plugin indent on
    " Show existing tab with 4 spaces width
    set tabstop=4
    " When indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set expandtab
" TAB STOPS SETTINGS ----------------------------------------------------- 

set nobackup		" do not keep a backup file, use versions instead

" CURSOR LOCATION SETTINGS ----------------------------------------------- 
    " Highlight cursor line underneath the cursor horizontally.
    set cursorline

    " Highlight cursor line underneath the cursor vertically.
    "set cursorcolumn
" CURSOR LOCATION SETTINGS ----------------------------------------------- 

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Use highlighting when doing a search.
set hlsearch

" STATUS LINE ------------------------------------------------------------ 
    " Clear status line when vimrc is reloaded.
    set statusline=
 
    " Status line left side.
    set statusline+=\%-40F\ git~(%{StatuslineGit()})
 
    " Use a divider to separate the left side from the right side.
    set statusline+=%=
 
    " Status line right side.
    set statusline+=\ %10((%l,%c)%)\ @\%p%%\ \%{strftime('%T')}
 
    " Show the status on the second to last line.
    set laststatus=2
" STATUS LINE ------------------------------------------------------------ 
