# .bash_profile

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=/usr/local/sbin:/usr/local/bin:$PATH:$HOME/bin
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

export GIT_PS1_SHOWUPSTREAM=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true

# rbenv
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
	eval "$(rbenv init -)"
fi

# Go
if [ -x "`which go 2> /dev/null`" ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

if [ `uname` = "Darwin" ]; then
	export LANG=ja_JP.UTF-8
	export CLICOLOR=1
	export PGDATA=/usr/local/var/postgres
	export PATH=$PATH:$HOME/Library/Python/2.7/bin

	source /usr/local/etc/bash_completion.d/git-prompt.sh
	source /usr/local/etc/bash_completion.d/git-completion.bash
	export PS1="\[\e[0;32m\][\u@\h:\W\$(__git_ps1 ' (%s)')]\$ \[\e[00m\]"
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
	fi

	if [ -x "`which gls 2> /dev/null`" ]; then
		alias ls='gls --color=auto'
	fi

	if [ -x "`which gdircolors 2> /dev/null`" ]; then
		eval $(gdircolors ~/.dircolors.monokai)
	fi

	alias flushdns='sudo discoveryutil mdnsflushcache'
	alias chrome='open -a Google\ Chrome'
	alias mvim='mvim --remote-tab-silent'
else
	if [ -f $BASH_COMPLETION_DIR/git -o -f $BASH_COMPLETION_COMPAT_DIR/git-prompt ]; then
		export PS1='\[\e[0;32m\][\u@\h:\W$(__git_ps1 " (%s)")]\$ \[\e[00m\]'
	else
		export PS1='\[\e[0;32m\][\u@\h:\W]\$ \[\e[00m\]'
	fi
fi

alias lv='lv -c'
alias vi='vim'
alias be='bundle exec'
alias ge='goop exec'
if [[ -x `which colordiff 2> /dev/null` ]]; then
	alias diff='colordiff -u'
else
	alias diff='diff -u'
fi
