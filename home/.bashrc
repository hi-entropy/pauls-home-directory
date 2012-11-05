export PS1="\w \$ "
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias ..='cd ..'
alias l.='ls ..'
alias la='ls -a'
alias ll='ls -la'

. /usr/local/bin/z.sh

export HISTSIZE=10000
export HISTCONTROL=ignoreboth

export VISUAL=emacs
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n $@'

# having /usr/local/bin first makes python happy, according to brew
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/texbin:/usr/local/sbin

# knewton stuff
export HADOOP_HOME='/Users/paul.kernfeld/repos/hadoop-1.0.4'
