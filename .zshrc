
# aliases
alias vim=nvim
alias c=clear
alias e=exit
alias ls='eza --classify --icons --group-directories-first'
alias lf=yazi
alias lg=lazygit
alias md=mkdir
alias ls='eza --classify --icons --group-directories-first'
alias ca='bat -p'

# Plugin manager
source "$HOME/.config/zsh/antigen.zsh"


# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen theme robbyrussell

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


# theme like oh my posh
# eval "$(starship init zsh)"

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


___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
 export SDKMAN_DIR="$HOME/.sdkman"
 [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export EDITOR=nvim

alias vsync_mode_enable='nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"'

[ -s "/home/shd/.bun/_bun" ] && source "/home/shd/.bun/_bun"


export PATH=$PATH:$HOME/.bun/bin:/home/shd/.spicetify:$HOME/.local/portable/yazi:
