# Search for files, and search file contents, with regex
#alias sff='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | grep -z --color=always -e'
alias sfc='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 grep --color=always -H -e'
# Search for files, and search file contents, raw string
#alias fsff='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | fgrep -z --color=always'
alias fsfc='find . -print0 | grep -zZ -v "\.git" | grep -zZ -v ".*\.svn-base$" | xargs -0 fgrep --color=always -H'

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
alias j='jobs -pl'

# Safety nets
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# Aliases for the logger
alias logd='log -d | less'
alias loggrep='log -d | grep -1 --color=always'

alias iit='cd /home/praveen/Documents/IIT/current'
alias ipaddr="ifconfig eth0 | grep 'inet addr' | sed 's/[ \t]*inet addr:\([0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\.[0-9]\{0,3\}\).*/\1/'"
