"Environment{
"Basics{
" to use vim defaults
set nocompatible
set t_Co=256
"}
"Plugins{
set rtp+=~/dotfiles/.vim/bundle/Vundle.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/dotfiles/.vim/after
call vundle#begin()

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
Plugin 'nathanaelkane/vim-indent-guides'
" for javascript
" Plugin 'pangloss/vim-javascript'

"for gnupg
Plugin 'jamessan/vim-gnupg'

" for calendar
Plugin 'itchyny/calendar.vim'

" for instant-markdown
Plugin 'suan/vim-instant-markdown'

" for UltiSnips
" Track the engine
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" change from current working directory to project root
Plugin 'airblade/vim-rooter'

" auto-completion for quotes, brackets, parenthesis
Plugin 'Raimondi/delimitMate'

call vundle#end()

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

" set autoindent
" set no smartindent: break right-shifting on # lines

" depth of auto-indentation
" similar to tabstop
set shiftwidth=2

" spaces a tab should take
set tabstop=2

" covert tabs to spaces
" set noexpandtab

" backspace to delete indents
set softtabstop=2

" activate folding
set foldmethod=indent

" set textwidth; followed by 'gqq' on the line to be wrapped
" set tw=80
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

" set statusline=%{fugitive#statusline()}

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

if exists('+colorcolumn')
  set colorcolumn=80
endif

"Markdown to HTML
nmap <leader>md :%!/usr/bin/vendor_perl/Markdown.pl --html4tags <cr>

"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"}

" run make on saving LaTeX file
" :autocmd BufWritePost *.tex make

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_UseMakefile=0
" Source: http://pig-monkey.com/2013/04/4/password-management-vim-gnupg/
" GnuPG Extensions "
" tells the GnuPG plugin to armor new files.
let g:GPGPreferArmor=1

" run python on F5
nnoremap <silent> <F5> :!python %<CR>

" tells the GnuPG plugin to sign new files.
let g:GPGPreferSign=1

augroup GnuPGExtra
" set extra file options.
	autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
" automatically close unmodified files after inactivity.
" autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END

function SetGPGOptions()
	" Set updatetime to 1 minute.
	set updatetime=60000
	" Fold at markers.
	set foldmethod=marker
	" Automatically close all folds.
	set foldclose=all
	" Only open folds with insert commands.
	set foldopen=insert
endfunction

" for calendar.vim
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1

" for UltiSnips
" Trigger configuration
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" for CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" restricting vim-rooter trigger to certain files
" let g:rooter_autocmd_patterns = '*.java'

" eclim + YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" clipboard
:map <F7> :w !xclip<CR><CR>
:vmap <F7> "*y
:map <S-F7> :r!xclip -o<CR>
