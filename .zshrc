# aliases
alias vim=nvim
alias c=clear
alias e=exit
alias lf=y
alias lg=lazygit
alias lzd=lazydocker
alias md=mkdir
alias ls='eza --classify --icons --group-directories-first'
alias ca='bat -p'

# Plugin manager
source "$HOME/.config/zsh/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# antigen theme robbyrussell
antigen theme gallifrey

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

# this fixes antigen compatabily issues with cd to folder
autoload -Uz compinit
if [[ -n ~/.zcompdump && ~/.zcompdump -nt ~/.zshrc ]]; then
  compinit -C
else
  compinit
fi

# History
HISTSIZE=5000
SAVEHIST=3000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)" # NON DEBIAN
# source /usr/share/doc/fzf/examples/key-bindings.zsh # DEBIAN

# bindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[d' autosuggest-accept
bindkey '^[f' forward-word


# Custom zsh syntax highlighting colors
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

typeset -A ZSH_HIGHLIGHT_STYLES

# Good commands (found in $PATH)
ZSH_HIGHLIGHT_STYLES[command]='fg=green'

# Wrong/unknown commands
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

# Options (-a, --help, etc.)
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan,bold'

# Arguments (files, dirs, words after commands)
ZSH_HIGHLIGHT_STYLES[argument]='fg=white'

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'

# Quoted strings
ZSH_HIGHLIGHT_STYLES[quoted]='fg=yellow'

# Autosuggestions (from zsh-autosuggestions)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'  # dim gray

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

### DEFAULTS ENVS ###
export EDITOR=nvim


### PATH ENVS ###
PORTABLE=$HOME/Portable
SYSTEMD_EDITOR=$EDITOR

export PATH=$PATH:$HOME/.spicetify:
