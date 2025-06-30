export CLIENT_URL=http://localhost:5173
export USER_PSQL_PASSWORD=123123

export EDITOR=nvim

# aliases
alias vim=nvim
alias c=clear
alias ls='eza --classify --icons --group-directories-first'
alias lf=yazi
alias lg=lazygit
alias md=mkdir
alias ls='eza --classify --icons --group-directories-first'
alias ca='bat -p'
alias idea="~/IDE/intellij/bin/idea.sh"

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
#
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
 export SDKMAN_DIR="$HOME/.sdkman"
 [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/shd/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:/home/shd/.spicetify
