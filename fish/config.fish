# ENV
set FORCE_WAYLAND --enable-features=UseOzonePlatform --ozone-platform=wayland
set DEV_TOOLS_GRADLE_WATCH gradle java --continuous --parallel --build-cache --configuration-cache
set EDITOR nvim

## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -xU MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -xU MANROFFOPT -c
set -x SHELL /usr/bin/fish

## Export variable need for qt-theme
if type qtile >>/dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

## Starship prompt
if status --is-interactive
    source (starship init fish --print-full-init | psub)
end

# BINDINGS
# ALT = \e , CTRL = \c
# bind --mode insert \e\x20 true
bind \ed forward-char
bind \ef forward-word
bind \e\x7F backward-kill-word # \x7F = Backspace
fzf_configure_bindings --directory=\ee

## Useful aliases
alias aur yay
alias copy 'xclip -selection clipboard'
alias wget 'wget -c '
alias cd=z
alias less=bat
alias lf=y
alias c=clear
alias inf=tldr
alias e=exit
alias ls='eza --classify --icons --group-directories-first'
alias lg=lazygit
alias md=mkdir
alias vim=nvim
alias decode-uri="node ~/scripts/decode-uri.js"
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'

# oh-my-posh init fish --config /usr/share/oh-my-posh/themes/space.omp.json | source

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

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end


fish_add_path /home/shd/.spicetify
