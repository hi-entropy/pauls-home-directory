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

alias prettyjson='python -c "import sys, json; print json.dumps(json.load(sys.stdin), sort_keys=True, indent=4)"'

. /usr/local/bin/z.sh

export HISTSIZE=10000
export HISTCONTROL=ignoreboth

export VISUAL=emacs
alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n $@'

# having /usr/local/bin first makes python happy, according to brew
export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/texbin:/usr/local/sbin