if status is-interactive

end

set fish_prompt_pwd_dir_length 0
set fish_greeting

# bINDS
bind \ed forward-char
fzf_configure_bindings --directory=\ee

# ENV
# set -Ux TERM 'xterm-256color'

# ALIAS
alias lf=ranger
alias md=mkdir
alias vim=nvim
alias ca=bat
alias vimdark="~/scripts/./nvim-switch-dark-light-themes.sh"
alias idea="~/IDE/intellij/bin/idea.sh"

function custom_colorscheme
    set -U fish_color_normal normal
    set -U fish_color_command 168a16
    set -U fish_color_quote 5faf00
    set -U fish_color_redirection 5fafff
    set -U fish_color_end ff5f87
    set -U fish_color_error red
    set -U fish_color_param d3d0c8
    set -U fish_color_comment ffcc66
    set -U fish_color_match 6699cc
    set -U fish_color_selection white --bold --background=brblack
    set -U fish_color_search_match bryellow --background=brblack
    set -U fish_color_history_current --bold
    set -U fish_color_operator 6699cc
    set -U fish_color_escape 66cccc
    set -U fish_color_cwd b0b0ab
    set -U fish_color_cwd_root red
    set -U fish_color_valid_path --underline
    set -U fish_color_autosuggestion 747369
    set -U fish_color_user brgreen
    set -U fish_color_host normal
    set -U fish_color_cancel --reverse
    set -U fish_pager_color_prefix normal --bold --underline
    set -U fish_pager_color_progress brwhite --background=cyan
    set -U fish_pager_color_completion normal
    set -U fish_pager_color_description B3A06D
    set -U fish_pager_color_selected_background --background=brblack
    set -U fish_pager_color_selected_prefix
    set -U fish_pager_color_secondary_prefix
    set -U fish_pager_color_selected_description
    set -U fish_pager_color_secondary_background
    set -U fish_color_option
    set -U fish_pager_color_secondary_description
    set -U fish_pager_color_background
    set -U fish_color_keyword
    set -U fish_color_host_remote
    set -U fish_pager_color_secondary_completion
    set -U fish_pager_color_selected_completion
end


custom_colorscheme
