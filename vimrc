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
set listchars=extends:»,precedes:«,tab:·\ ,trail:◀ ",eol:¬
set list
"Use 16 colours in the terminal"
set t_Co=16

"Invoke pathogen for plugins"
execute pathogen#infect()
"Switch on syntax highlighting"
syntax on
"Detect filetype automatically and indent depending upon filetype"
filetype plugin indent on

": is too painful to press"
nnoremap <Space> :
vnoremap <Space> :

"For those irritating typos (when I'm still using :)"
command W w
command WQ wq
command Q q
command Wq wq
command Tabe tabe

"For moving up and down through wrapped lines"
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <C-o>k <C-o>gk
inoremap <silent> <C-o>j <C-o>gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj

"For when you forget to open a file with sudo"
map <Leader>ww :w !sudo tee % >/dev/null<CR>

"For toggling the NERDTree window on and off"
map <Leader>] <plug>NERDTreeTabsToggle<CR>

"For toggling the Gundo window on and off"
map <Leader>[ :GundoToggle<CR>

"For opening a new file quickly in a new tab from normal mode"
nmap t :tabe 

"For un-highlighting after a search is done"
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

"For centering the screen on the search-find"
map n nzz
map N Nzz

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

"For switching paste mode on/off during insert"
"Otherwise, indents will cascade"
set pastetoggle=<F2>

"For exceeding 80 characters in a line"
highlight ColorColumn ctermbg=7
set colorcolumn=80
