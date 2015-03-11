# .bash_profile

function set_git_ps1_options {
	GIT_PS1_SHOWUPSTREAM=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWDIRTYSTATE=true
}

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# rbenv
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
	eval "$(rbenv init -)"
fi

export PATH=/usr/local/bin:$PATH:$HOME/bin
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

if [ -x "`which go 2> /dev/null`" ]; then
	export GOROOT=`go env GOROOT`
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

if [ `uname` = "Darwin" ]; then
	export LANG=ja_JP.UTF-8
	export CLICOLOR=1
	export LSCOLORS=GxFxCxDxBxegedabagaced
	source /usr/local/etc/bash_completion.d/git-prompt.sh
	source /usr/local/etc/bash_completion.d/git-completion.bash
	set_git_ps1_options
	export PS1="\[\e[0;32m\][\t \W\$(__git_ps1 ' (%s)')]\$ \[\e[00m\]"
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi

	alias flushdns='sudo discoveryutil mdnsflushcache'
else
	if [ -f $BASH_COMPLETION_DIR/git -o -f $BASH_COMPLETION_COMPAT_DIR/git-prompt ]; then
		set_git_ps1_options
		export PS1='\[\e[0;32m\][\u@\h:\W$(__git_ps1 " (%s)")]\$ \[\e[00m\]'
	else
		export PS1='\[\e[0;32m\][\u@\h:\W]\$ \[\e[00m\]'
	fi
fi

alias lv='lv -c'
alias be='bundle exec'
if [[ -x `which colordiff 2> /dev/null` ]]; then
	alias diff='colordiff -u'
else
	alias diff='diff -u'
fi
