autoload -Uz colors
autoload -Uz compinit
autoload -Uz vcs_info

colors
compinit -u

bindkey -e

export PATH=$HOME/bin:./node_modules/.bin:/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

export GIT_PS1_SHOWUPSTREAM=
export GIT_PS1_SHOWUNTRACKEDFILES=
export GIT_PS1_SHOWSTASHSTATE=
export GIT_PS1_SHOWDIRTYSTATE=

zstyle ':vcs_info:*' formats ' (%b)'
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
precmd () {
		psvar=()
		LANG=en_US.UTF-8 vcs_info
		[[ -n "$vcs_info_msg_0_"  ]] && psvar[1]="$vcs_info_msg_0_"
}

[ -f ~/.fzf.zsh  ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --nocolor --nogroup --ignore ".git" --ignore ".svn" --ignore ".hg" --ignore "node_modules" --hidden -g ""'

current_dir_name() {
	echo $(basename "$(pwd)")
}

rename_tmux_window_name() {
	local window_name=$1
	tmux rename-window "$window_name"
}

cd() {
	builtin cd "$@"
	if [ "x$TMUX" != "x" ]; then
		rename_tmux_window_name "$(current_dir_name)"
	fi
}

ssh() {
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
		brew cleanup macvim
		cp -r /usr/local/opt/macvim/MacVim.app /Applications
		defaults write org.vim.MacVim SUEnableAutomaticChecks -bool false
	}

	export LANG=ja_JP.UTF-8
	export CLICOLOR=1
	export PGDATA=/usr/local/var/postgres
	export PATH=$PATH:/usr/local/opt/postgresql/bin
	export PATH=$PATH:$HOME/Library/Python/2.7/bin
	export PATH=/Applications/MacVim.app/Contents/bin:$PATH

	export PROMPT='%F{green}[%n@%m%f %F{yellow}%~%f%1(v|%F{yellow}%1v%f|)%F{green}]$%f '

	if [ -x $(which gls 2> /dev/null) ]; then
		alias ls='gls --color=auto'
	fi

	if [ -x $(which gdircolors 2> /dev/null) -a -f ~/.dircolors ]; then
		eval $(gdircolors ~/.dircolors)
	fi

	alias flushdns='sudo killall -HUP mDNSResponder'
	alias safari='open -a Safari'
	alias chrome='open -a Google\ Chrome'
	alias mvim='mvim --remote-tab-silent'
else
	export LINUXBREW_PATH="/home/linuxbrew/.linuxbrew"
	if [ -d $LINUXBREW_PATH ]; then
			export PATH=$LINUXBREW_PATH/bin:$LINUXBREW_PATH/sbin/:$PATH

			eval $(brew shellenv)

			export MANPATH="$LINUXBREW_PATH/share/man:$MANPATH"
			export INFOPATH="$LINUXBREW_PATH/share/info:$INFOPATH"
	fi

	export PROMPT='%F{green}%n@%m%f %F{yellow}%~%f %F{green}$%f '

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
