# vim: set filetype=sh :

# Search file contents, with regex
alias sfc='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 grep --color=always -H -e'
# Search file contents, raw string
alias fsfc='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 fgrep --color=always -H'

# Convenience shortcuts
alias die='sudo shutdown -h now'
alias phoenix='sudo shutdown -r now'
alias back='cd -'
alias n='nautilus .'
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

# Safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Aliases for the logger
alias logd='log -d | less'
alias loggrep='log -d | grep -1 --color=always'

alias iit='cd /home/praveen/Documents/IIT/current'
alias ipaddr="ifconfig eth0 | grep 'inet addr' | sed 's/[ \t]*inet addr:\([0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\).*/\1/'"

## Function based aliases ##

# Change into a directory and display contents
dl() {
	cd "$@"
	ls
}
alias dl..='dl ..'

# Short alias for document reader
# Open with okular, and ensure that the terminal is not littered with arbitrary
# error lines and incomprehensible pieces of information.
e() {
	okular "$@" > /dev/null 2>&1 &
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

