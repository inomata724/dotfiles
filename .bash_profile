# .bash_profile

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

export GIT_PS1_SHOWUPSTREAM=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWDIRTYSTATE=true

function current_dir_name() {
	echo $(basename "$(pwd)")
}

function rename_tmux_window_name() {
	local window_name=$1
	tmux rename-window "$window_name"
}

function cd() {
	command cd "$@"
	if [ "x$TMUX" != "x" ]; then
		rename_tmux_window_name "$(current_dir_name)"
	fi
}

function ssh() {
	if [ "x$TMUX" != "x" ]; then
		local current_window_name=$(tmux display -p "#{window_name}")
		rename_tmux_window_name "ssh $1"
		command ssh "$@"
		rename_tmux_window_name "$current_window_name"
	else
		command ssh "$@"
	fi
}

if [ "x$TMUX" != "x" ]; then
	rename_tmux_window_name "$(current_dir_name)"
fi

# rbenv
if [ -d ~/.rbenv ]; then
	export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
	eval "$(rbenv init -)"
fi

# Go
export PATH=$PATH:/usr/local/go/bin
if [ -x $(which go 2> /dev/null) ]; then
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOPATH/bin
fi

if [ "x$(uname)" = "xDarwin" ]; then
	function osx_version() {
		echo $(sw_vers|grep ProductVersion|cut -d ':' -f 2|tr -d "\t")
	}

	function upgrade_macvim() {
		brew upgrade macvim
		cp -r /usr/local/opt/macvim/MacVim.app /Applications
		defaults write org.vim.MacVim SUEnableAutomaticChecks -bool false
	}

	export LANG=ja_JP.UTF-8
	export CLICOLOR=1
	export PGDATA=/usr/local/var/postgres
	export PATH=$PATH:/usr/local/opt/postgresql/bin
	export PATH=$PATH:$HOME/Library/Python/2.7/bin

	source /usr/local/etc/bash_completion.d/git-prompt.sh
	source /usr/local/etc/bash_completion.d/git-completion.bash
	export PS1="\[\e[0;32m\][\u@\h:\W\$(__git_ps1 ' (%s)')]\$ \[\e[m\]"
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi

	if [ -x $(which gls 2> /dev/null) ]; then
		alias ls='gls --color=auto'
	fi

	if [ -x $(which gdircolors 2> /dev/null) -a -f ~/.dircolors ]; then
		eval $(gdircolors ~/.dircolors)
	fi

	alias flushdns='sudo killall -HUP mDNSResponder'
	alias safari='open -a Safari'
	alias chrome='open -a Google\ Chrome'
	#alias mvim='mvim --remote-tab-silent'
else
	if [ -f $BASH_COMPLETION_DIR/git -o -f $BASH_COMPLETION_COMPAT_DIR/git-prompt ]; then
		export PS1='\[\e[0;32m\][\u@\h:\W$(__git_ps1 " (%s)")]\$ \[\e[m\]'
	else
		export PS1='\[\e[0;32m\][\u@\h:\W]\$ \[\e[m\]'
	fi

	if [ -x $(which dircolors 2> /dev/null) -a -f ~/.dircolors ]; then
		eval $(dircolors ~/.dircolors)
	fi
fi

alias lv='lv -c'
alias less='less -R'
alias vi='vim'
alias be='bundle exec'
alias ge='goop exec'
if [ -x $(which colordiff 2> /dev/null) ]; then
	alias diff='colordiff -u'
else
	alias diff='diff -u'
fi
