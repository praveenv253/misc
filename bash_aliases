# vim: set filetype=sh :

# Search file contents, with regex
alias sfc='find . -type f -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 grep --color=always -H -e'
# Search file contents, raw string
alias fsfc='find . -type f -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 fgrep --color=always -H'

# Convenience shortcuts
alias die='sudo shutdown -h now'
alias phoenix='sudo shutdown -r now'
alias back='cd -'
alias n='nautilus . >/dev/null 2>&1 &'
alias du='du -h'
alias cd..='cd ..'
alias df='df -h'
alias python='ipython3' # For the regular python 3, use python3
alias python2='ipython' # For the regular python, use python2.7
alias a='alsamixer'
alias sl='ls'
alias ks='ls'
alias diff='colordiff'
alias vim='vim -p'
alias vi='vim'
alias mkdir='mkdir -p'
alias tp='trash-put'		# Requires installation of trash-cli
alias j='jobs -pl'
alias gitl='gitk --all'		# Requires git and gitk
alias sb='xbacklight -set'  # Requires xbacklight
alias w='cd ~/Downloads'
alias d='cd ~/documents'
alias p='cd ~/papers'

# Safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Aliases for the logger
alias logd='log -d | less'
alias blog='log -b'
alias loggrep='log -d | grep -1 --color=always'

alias ipaddr="ifconfig eth0 | grep 'inet addr' | sed 's/[ \t]*inet addr:\([0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\).*/\1/'"

## Function based aliases ##

# Change into a directory and display contents
dl() {
	cd "$@"
	ls
}
alias dl..='dl ..'

# Short alias for Okular
# Open with okular, and ensure that the terminal is not littered with arbitrary
# error lines and incomprehensible pieces of information.
e() {
	okular "$@" > /dev/null 2>&1 &
}

# Short alias for document reader (Evince)
# Open with okular, and ensure that the terminal is not littered with arbitrary
# error lines and incomprehensible pieces of information.
ev() {
	evince "$@" > /dev/null 2>&1 &
}

# Alias for opening lyx
# Don't litter the terminal with arbitrary errors and debug information.
lyx() {
	/usr/bin/lyx "$@" > /dev/null 2>&1 &
}

# Short alias for graphical editor
# Use -p to open multiple files in different tabs of the same gvim instance.
# Also, get rid of all those unwanted error messages that we can't decipher,
# and which just end up making terminal scrollback messy.
g() {
	gvim -p $@ > /dev/null 2>&1 &
}

# Search for files
# Searches for files matching a given regex string under the current direcotry,
# recursively.
sff() {
	find . -print0 | \
		grep -zZ -v "\.git" | \
		grep -zZ -v ".*\.svn-base$" | \
		grep -z --color=always -e $@ | \
		tr "\000" "\n" | \
		less -RFX
}

# Search for files
# Like sff, but uses fgrep => search for the raw string, not regex.
fsff() {
	find . -print0 | \
		grep -zZ -v "\.git" | \
		grep -zZ -v ".*\.svn-base$" | \
		fgrep -z --color=always -e $@ | \
		tr "\000" "\n" | \
		less -RFX
}

# Alias for latex -> dvips -> ps2pdf. This is a good substitute for pdflatex,
# when you want to use packages like pstricks, for instance.
ldp() {
	fname=$(echo "$@" | sed 's/\.tex$//')
	latex "${fname}.tex"
	dvips "${fname}.dvi"
	ps2pdf -dAutoRotatePages=/None "${fname}.ps"
}

# Alias for pdf2ps -> ps2eps.
pdf2eps() {
	fname=$(echo "$@" | sed 's/\.pdf$//')
	pdf2ps "${fname}.pdf"
	ps2eps "${fname}.ps"
}

# Exit the terminal
q() {
	echo -n 'Exit? y/[n]: '
	read response
	[[ $response == "y" ]] && exit
}

# Alias for which, as suggested by the man page
system_which=`command which which`
function which
{
	(alias; declare -f) | "$system_which" --tty-only --read-alias --read-functions --show-tilde --show-dot $@
}
export -f which

# Alias for redshift
function r() {
	if [ "$1" = "x" -o "$1" = "-x" ]; then
		redshift -x
	else
		redshift -x
		redshift -O 6500 -b "$1":"$1"
	fi
}
