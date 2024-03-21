# Setup fzf
# ---------
if [[ ! "$PATH" == */home/shd/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/shd/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/shd/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/shd/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND='rg --files --hidden'
# get a list of files and directories
#
export FZF_CTRL_T_COMMAND="rg --files --hidden"

# get a list of directories
export FZF_ALT_C_COMMAND="rg --files | xargs 'dirname' 2>/dev/null | sort -u | uniq"

# command find -L . -mindepth 1 \\( -path '*/.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
#     -o -type f -print \
#     -o -type d -print \
#     -o -type l -print 2> /dev/null | cut -b3-
