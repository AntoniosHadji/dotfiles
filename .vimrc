" modeline {
" vim: set foldmarker={,} foldlevel=1 foldmethod=marker :
" }
" Set to ward off unexpected things, and sanely reset options when re-sourcing .vimrc
set nocompatible

" solarized configuration suggestions
syntax enable           "Enable syntax highlighting
set background=dark
colorscheme solarized
set t_Co=16             " override gnome-terminal reporting that it only handles 8 colors

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

"custom settings chosen by me from SPF13{
"https://github.com/spf13/spf13-vim
" General Settings {
filetype plugin indent on
set encoding=utf-8      " show buffer as utf-8 https://github.com/square/maximum-awesome (**MUST BE EARLY IN FILE**)
scriptencoding utf-8
set autoread            " auto re-load files when changed on disk https://github.com/square/maximum-awesome
set mouse=a             " Automatically enable mouse usage
set mousehide           " Hide the mouse cursor while typing

if has ('x') && has ('gui') " On Linux use + register for copy-paste
    set clipboard=unnamedplus
elseif has ('gui')          " On Mac & Win use * register for copy-paste
    set clipboard=unnamed
endif

set viewoptions=folds,options,cursor,unix,slash "see :help viewoptions
set virtualedit=onemore " Allow for cursor beyond last character
set history=1000	    " command history length extra long
set spell               " spell checker
set hidden		        " Allow buffer switching without saving

set backup                  "See :help backup
if has('persistent_undo')
    set undofile        "if ~/.vim/undo exists file put there, otherwise CWD
    set undolevels=1000
"    set undoreload=10000 "see :help undoreload
endif
"}

" Vim UI {
set showmode                    " Display the current mode
set cursorline                  " Highlight current line

if has('cmdline_info')
        set ruler                                               " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)      " A ruler on steroids
        set showcmd                     " Show partial commands in status line and
                                        " Selected characters/lines in visual mode
endif

if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        " Insert Git branch without plug-in http://amix.dk/blog/post/19571
        function! GitBranch()
            let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
            if branch != ''
                return '   Git Branch:' . substitute(branch, '\n', '', 'g')
            endif
            return ''
        endfunction
        set statusline+=%{GitBranch()}
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set backspace=indent,eol,start		" fix backspace 
set number              " show line numbers
set showmatch		" jump cursor to matching brace when entered
set incsearch		" search as you type
set hlsearch        " highlight search terms :noh to clear
set ignorecase		" case-insensitive search
set smartcase           " use case sensitive search if any caps present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=5                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set listchars=tab:›\ ,trail:∙,extends:#,nbsp:. " Highlight problematic whitespace
set list
"} end Vim UI 

" Formatting {
set autoindent 	    	" always autoindent
set shiftwidth=4	    " number of spaces to use for autoindent
set expandtab	    	" expands tabs to spaces
set tabstop=4           " actual tabs occupy 4 spaces
set softtabstop=4       " insert mode tab and backspace
set splitright          " puts new vsplit windows to the right
set splitbelow          " puts new hsplit windows below current
set pastetoggle=<F12>   " sane indentation on pastes
" }

" GUI Settings (here instead of .gvimrc) {
if has('gui_running')
    set guifont=Anonymous\ Pro\ for\ Powerline\ 12  "Set my preferred fhnt with comma separated list(spaces must be escaped)
    set guioptions-=T               "Remove tool bar
    set lines=40                    "Larger window than 24 row terminal
endif
"} end GUI settings

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"} end SPF13 enhancements

" MY customizations {
" no backup files left in CWD
set backupdir=~/.vim/backup//,/var/tmp//
" no swap files left in CWD
set directory=~/.vim/backup//,/var/tmp//
" no undo files left in CWD
set undodir=~/.vim/undo//,/var/tmp//

"Keyboard Shortcuts {
"force myself to use hjkl instead of arrow keys <nop> only normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


"} end keyboard shortcuts
"} end MY customizations

if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

