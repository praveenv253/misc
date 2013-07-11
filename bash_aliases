# Search for files, and search file contents, with regex
alias sff='find . | grep -v "\.git" | grep -v ".*\.svn-base$" | grep --color=always -e'
alias sfc='find . | grep -v "\.git" | grep -v ".*\.svn-base$" | xargs grep --color=always -H -e'
# Search for files, and search file contents, raw string
alias fsff='find . | grep -v "\.git" | grep -v ".*\.svn-base$" | fgrep --color=always'
alias fsfc='find . | grep -v "\.git" | grep -v ".*\.svn-base$" | xargs fgrep --color=always -H'

# Convenience shortcuts
alias die='sudo shutdown -h now'
alias phoenix='sudo shutdown -r now'
alias back='cd -'
alias n='nautilus .'
alias g='gedit'
alias du='du -h'
alias cd..='cd ..'
# No more ssh aliases once you know ssh_config
#alias ssh='ssh -A'
alias df='df -h'
alias python='ipython'
alias a='alsamixer'
alias e='evince'
alias sl='ls'
alias ks='ls'
alias diff='colordiff'
alias vim='vim -p'
alias vi='vim'
alias mkdir='mkdir -p'
alias tp='trash-put'	# Requires installation of trash-cli

# Safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Aliases for the logger
alias logd='log -d | less'
alias loggrep='log -d | grep --color=always'

alias iit='cd /home/praveen/Documents/IIT/current'
alias ipaddr="ifconfig eth0 | grep 'inet addr' | sed 's/[ \t]*inet addr:\([0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\).*/\1/'"
