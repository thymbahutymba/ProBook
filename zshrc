# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

autoload colors && colors

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="afowler"
#ZSH_THEME="af-magic"
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

if [ "$HOME" = "/home/andrea" ]; then
#	plugins=(git colored-man-pages)
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
else
	source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source ~/.oh-my-zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

	if [ -z $TMUX ]; then
		session=${USER}_session
		tmux has-session -t $session || tmux new-session -d -s $session
		tmux attach-session -t $session
	fi

	export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
fi
plugins=(git colored-man-pages)

# export LANG=en_US.UTF-8
export EDITOR='vim'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt append_history
setopt auto_cd
#setopt extendedglob
#setopt nomatch
#setopt notify
setopt auto_remove_slash
#setopt hist_ignore_all_dups
unsetopt hist_ignore_space
unsetopt beep
unsetopt rm_star_silent

if [ -f $HOME/.zsh_aliases ]; then
	source $HOME/.zsh_aliases
fi
