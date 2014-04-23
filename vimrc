"Invoke pathogen for plugins"
execute pathogen#infect()

"Line numbers"
set number
"Tell me the name of the file I'm editing"
set title
"A tab is equivalent to 4 spaces"
set tabstop=4
"Shift by 4 spaces when I press tab"
set shiftwidth=4
"Do C-style indentation automatically"
set cindent
"Highlight search results"
set hlsearch
"Ignore case while searching..."
set ignorecase
"...but only ignore if the search string is all lowercase"
set smartcase
"Always keep status bar on"
set laststatus=2
"Set encoding to utf-8"
set encoding=utf-8
"Enable characters to demarcate the kind of whitespace used"
set listchars=extends:»,precedes:«,tab:·\ ,trail:◀
set list
"Use 16 colours in the terminal"
set t_Co=16
"Use fancy symbols in powerline"
let g:Powerline_symbols = "fancy"
"Ignore some file endings while expanding"
set wildignore=*.o,*~,*.pyc,.git
"New vertical windows appear on the right of the existing window"
set splitright
"Set timeout values for mappings and keycodes"
set timeoutlen=500
set ttimeoutlen=100
"Set foldmethod to fold all lines of the same or higher indent level..."
set foldmethod=indent
"... but keep it turned off at startup"
set nofoldenable
"Set modeline, particularly for syntax-highlighting certain files correctly"
set modeline
"Treat all sh files as bash scripts for syntax highlighting"
let g:is_bash = 1

"Switch on syntax highlighting"
syntax on
colorscheme vader
"Detect filetype automatically and indent depending upon filetype"
filetype plugin indent on

": is too painful to press"
nnoremap <Space> :
vnoremap <Space> :

"To give backspace a more useful purpose"
nnoremap <Backspace> i<Backspace><Esc>l

"For copying and pasting text through the system clipboard"
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>P "+P

"For moving up and down through wrapped lines"
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
vnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> <Up> gk
vnoremap <silent> <Down> gj
inoremap <silent> <C-o>k <C-o>gk
inoremap <silent> <C-o>j <C-o>gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj

"Make Ctrl+Left and Ctrl+Right move through words"
nnoremap <silent> <C-Left> b
nnoremap <silent> <C-Right> w

"For when you forget to open a file with sudo"
noremap <Leader>ww :w !sudo tee % >/dev/null<CR>

"For toggling the NERDTree window on and off"
map <Leader>] <plug>NERDTreeTabsToggle<CR>

"For toggling the Gundo window on and off"
map <Leader>[ :GundoToggle<CR>

"For toggling the taglist window on and off"
map <Leader><CR> :TlistToggle<CR>

"For opening a new file quickly in a new tab from normal mode"
nmap t :tabe 

"For un-highlighting after a search is done"
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

"For centering the screen on the search-find"
nnoremap n nzz
nnoremap N Nzz

"For keeping the selection on after indenting/un-indenting in visual mode"
vnoremap <silent> > >gv
vnoremap <silent> < <gv

"For moving tabs left and right"
"Use Alt+PgUp for left and Alt+PgDn for right"
nnoremap <silent> [5;3~
			\ :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> [6;3~
			\ :execute 'silent! tabmove ' . tabpagenr()<CR>
inoremap <silent> [5;3~
			\ <ESC>:execute 'silent! tabmove ' . (tabpagenr()-2)<CR>a
inoremap <silent> [6;3~
			\ <ESC>:execute 'silent! tabmove ' . tabpagenr()<CR>a

"For converting long constants into upper case quickly (after typing them)"
inoremap <C-u> <Esc>viwUea

"For clearing a line without deleting it in normal mode"
nnoremap ds 0v$hx

"For opening vimrc quickly"
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
"For loading vimrc changes quickly"
nnoremap <Leader>sv :source $MYVIMRC<CR>

"For preventing an incomplete comment from deleting text"
nnoremap <Leader>c <Nop>
vnoremap <Leader>c <Nop>

"For moving up and down faster, but not as fast as PgUp and PgDn"
nnoremap <C-k> 3k
nnoremap <C-j> 3j
vnoremap <C-k> 3k
vnoremap <C-j> 3j
nnoremap <C-Up> 3k
nnoremap <C-Down> 3j
inoremap <C-Up> <C-o>3k
inoremap <C-Down> <C-o>3j
vnoremap <C-Up> 3k
vnoremap <C-Down> 3j

"For moving the screen, but not the cursor..."
nnoremap <S-Up> <C-y>
nnoremap <S-Down> <C-e>
inoremap <S-Up> <C-o><C-y>
inoremap <S-Down> <C-o><C-e>

"For there are things faster than <C-w>w"
nnoremap <C-w><C-Left>  <C-w><Left>
nnoremap <C-w><C-Right> <C-w><Right>
nnoremap <C-w><C-Up>    <C-w><Up>
nnoremap <C-w><C-Down>  <C-w><Down>

"For switching paste mode on/off during insert"
"Otherwise, indents will cascade"
set pastetoggle=<F2>

"For figuring out the highlight group under the cursor"
map <Leader>h
			\ :echo
			\ "hi<" . synIDattr(synID(line("."),col("."),1),"name") . "> " .
			\ "trans<" . synIDattr(synID(line("."),col("."),0),"name") . "> " .
			\ "lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
			\       . ">"
			\ <CR>

"For autoformatting a C/C++ file using astyle"
nnoremap <Leader>fc
			\ :%!astyle --mode=c --style=k/r --indent=tab --pad-oper
			\           --unpad-paren --delete-empty-lines --align-pointer=name
			\           --break-blocks<CR>
"For autoformatting a python file using autopep8"
nnoremap <Leader>fy :%!autopep8 -<CR>

"For autoformatting a file using par with a width of 79 characters"
set formatprg="par 79"
"For formatting the whole document"
nnoremap <Leader>fa ggVGgq
"For formatting the current paragraph"
nnoremap <Leader>fp mzvapgq`z

"For removing trailing spaces"
nnoremap <Leader>fs :%s/\s\+$//g<CR>

"For spellcheck"
nnoremap <Leader>ss
			\ :setlocal spell spelllang=en_gb<CR>
nnoremap <Leader>sa
			\ :setlocal nospell<CR>

"For exceeding 80 characters in a line"
set colorcolumn=80

"For setting the search match colour appropriately"
highlight Search ctermbg=011 ctermfg=000

"For inverting colours on selection"
highlight clear Visual
highlight Visual cterm=reverse
