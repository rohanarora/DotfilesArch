"Environment{
    "Basics{
        " to use vim defaults
        set nocompatible
        set t_Co=256
        "}
    "Plugins{
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        Plugin 'gmarik/vundle'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'scrooloose/nerdtree'
        Plugin 'tpope/vim-fugitive'
        Plugin 'nvie/vim-flake8'
        " finder for vim
        Plugin 'kien/ctrlp.vim'
        " navigating through the file
        Plugin 'Lokaltog/vim-easymotion'
        " error checking
        Plugin 'https://github.com/scrooloose/syntastic.git'
        "for javascript
        "Plugin "pangloss/vim-javascript"
        "Plugin 'nathanaelkane/vim-indent-guides'
        "}
"}


"General{
        " history
        set history =1000

        let g:solarized_termtrans = 1
        set background=dark

        " theme selection
        colorscheme solarized

        " loading indent files
        filetype plugin indent on

        " code higlighting
        syntax enable

        if has('mouse')
             set mouse =a
        end

        set mousehide

        " mute
        set visualbell
"}


"Formatting{
        " to wrap
        set wrap

        set autoindent
        " set no smartindent: break right-shifting on # lines

        " depth of auto-indentation
        " similar to tabstop
        set shiftwidth=2

        " spaces a tab should take
        set tabstop=2

        " covert tabs to spaces
        set noexpandtab

        " backspace to delete indents
        set softtabstop=2

        " activate folding
        set foldmethod=indent
"}


"Vim UI{
        " show mode
        set showmode

        " show line-numbers
        set number

        " visual editing in visual block mode
        set virtualedit=block

        " show status bar
        set showcmd

        " show cursor-location on status bar
        set ruler

        " new horizontal window to the right of the current
        set splitright

        " new vertical window below the current the window
        set splitbelow

        " show list
        set wildmenu

        " <Tab> completion, list => longest common part => all
        set wildmode=list:longest,full

        "NERDTree weird charcters
        let g:NERDTreeDirArrows=0

        " NERDTree on start
        autocmd vimenter * NERDTree

"}


"Key-bindings{
        " backspacing in insert mode
        set backspace=indent,eol,start
"}


"Better Searching{
        " highlight search matches
        set hlsearch

        " ignore case while searching
        set ignorecase

        " lookahead
        set incsearch

        " case ignored unless upper-case is used
        set smartcase
"}


"Making it better{
        "spell-check
        set spell spelllang=en_us

        "pep8 and pyflakes plugin
        "calling the above on save
        autocmd BufWritePost *.py call Flake8()

        "auto-completion
        if filereadable($VIRTUAL_ENV . '/.vimrc')
            source $VIRTUAL_ENV/.vimrc
        endif

        " close Nerdtree if no file is open
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
        "for iTerm

        " to highlight trailing whitespace
        highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
        match ExtraWhitespace /\s\+$/
        autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
        autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match ExtraWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()

"}

"For activating virtualenv{
        if filereadable($VIRTUAL_ENV . '/.vimrc')
            source $VIRTUAL_ENV/.vimrc
        endif
"}

"For javascript plugins{
    let g:syntastic_check_on_open=1

    "fix for vim-javascript
    "set regexpengine=1

    " for vim-indent-guides
    hi IndentGuidesOdd  ctermbg=black
    hi IndentGuidesEven ctermbg=darkgrey

    "let g:indent_guides_auto_colors = 0
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"}
