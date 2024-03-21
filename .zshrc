export ZSH="$HOME/.oh-my-zsh"

#ZSH_THEME="jispwoso"
#superjarin
ZSH_THEME="lambda"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# remaps
alias idea="~/IDE/intellij/bin/idea.sh"
alias vim="nvim"
alias grep="rg"

# Simple scripts
alias twinmonitor="~/scripts/./twinmonitor.sh"
alias vimdark="~/scripts/./nvim-switch-dark-light-themes.sh"

# fzf 
bindkey '^[e' fzf-file-widget
bindkey '^[d' autosuggest-accept
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


export JAVA_HOME=/home/shd/.sdkman/candidates/java/21.0.2-tem

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH=$HOME/bin:/usr/local/bin:/bin/greenclip
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
