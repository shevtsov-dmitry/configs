# ENV
set SERVER_URL http://localhost:8080
set CLIENT_URL http://localhost:5173
set OLLAMA_MODELS /home/shd/.ollama/models

set FORCE_WAYLAND --enable-features=UseOzonePlatform --ozone-platform=wayland
set DEV_TOOLS_GRADLE_WATCH gradle java --continuous --parallel --build-cache --configuration-cache
set EDITOR nvim
set ENABLE_YOUTUBE ciadpi -i 127.0.0.1 -p 10801 -s 2

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

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

## Starship prompt
if status --is-interactive
    source ("/usr/local/bin/starship" init fish --print-full-init | psub)
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# BINDINGS
# ALT = \e , CTRL = \c
# bind --mode insert \e\x20 true
bind \ed forward-char
bind \ef forward-word
bind \e\x7F backward-kill-word # \x7F = Backspace
fzf_configure_bindings --directory=\ee

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | string trim --right --chars=/)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Cleanup local orphaned packages
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

## Useful aliases


# Replace some more things with better alternatives
# alias cat 'bat --style header --style snip --style changes --style header'
if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay paru
end


# Common use

alias big 'expac -H M "%m\t%n" | sort -h | nl' # Sort installed packages according to size in MB (expac must be installed)
alias dir 'dir --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grubup 'sudo update-grub'
alias hw 'hwinfo --short' # Hardware Info
alias ip 'ip -color'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias upd /usr/bin/garuda-update
alias vdir 'vdir --color=auto'
alias wget 'wget -c '
alias cd=z
alias lf=y
alias c=clear
alias zigm="$HOME/.local/bin/zigm-nominated/zig"
alias inf=tldr
alias e=exit
alias ls='eza --classify --icons --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias mdprev=frogmouth
alias lg=lazygit
alias md=mkdir
alias vim=nvim

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help people new to Arch
alias tb 'nc termbin.com 9999'
alias helpme 'echo "To print basic information about a command use tldr <command>"'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'


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

# Get Lua version
set -l LUA_VERSION (lua -e "print(_VERSION:match('%d+%.%d+'))")

# Update LUA_PATH
set -gx LUA_PATH "$LUA_PATH;/home/shd/.luarocks/share/lua/$LUA_VERSION/?.lua;/home/shd/.luarocks/share/lua/$LUA_VERSION/?/init.lua"
# Update LUA_CPATH
set -gx LUA_CPATH "$LUA_CPATH;/home/shd/.luarocks/lib/lua/$LUA_VERSION/?.so"

fish_add_path /home/shd/.spicetify
