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

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

fish_add_path /home/shd/.spicetify

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
