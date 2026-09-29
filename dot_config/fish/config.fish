# ~/.config/fish/config.fish

# Dezactiveaza mesajul implicit de intampinare
set -g fish_greeting

fish_vi_key_bindings
bind -M insert -m default jk backward-char force-repaint

# =======================================================
# 1. ENVIRONMENT PATHS
# =======================================================
# fish_add_path adauga la inceputul PATH-ului si elimina automat duplicatele
fish_add_path -g \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/.opencode/bin \
    $HOME/.pub-cache/bin \
    /usr/local/texlive/2024/bin/x86_64-linux \
    /var/lib/snapd/snap/bin \
    /snap/bin

# Completions custom path (daca exista)
if test -d $HOME/.config/fish/completions
    set -gp fish_complete_path $HOME/.config/fish/completions
end

# =======================================================
# 2. EXPORTS & XDG ENVIRONMENT
# =======================================================
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx CLICOLOR 1
set -gx DOCKER_CONFIG "$HOME/.docker"
set -gx ANDROID_HOME "$HOME/Android/Sdk"

# Vi mode nativ (inlocuieste zsh-vi-mode)
fish_vi_key_bindings

# Less colors
set -gx LESS_TERMCAP_mb (printf "\e[01;31m")
set -gx LESS_TERMCAP_md (printf "\e[01;31m")
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_so (printf "\e[01;44;33m")
set -gx LESS_TERMCAP_ue (printf "\e[0m")
set -gx LESS_TERMCAP_us (printf "\e[01;32m")

# =======================================================
# 3. ALIASES & ABBREVIATIONS
# =======================================================
alias vim='nvim'
alias vi='nvim'
alias efc='nvim ~/.config/fish/config.fish'

# Modern CLI utils
if type -q rg
    alias grep='rg'
end

if type -q bat
    alias cat='bat'
end

alias ls='eza --icons --color=always --group-directories-first'
alias ll='eza -alF --icons --color=always --group-directories-first'
alias la='eza -a --icons --color=always --group-directories-first'
alias l='eza -F --icons --color=always --group-directories-first'
alias tree='tree -CAhF --dirsfirst'

alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias cls='clear'
alias lg='lazygit'

# Git helper
alias gcom='git add . && git commit -m'

# =======================================================
# 4. FUNCTIONS (YAZI & GIT HELPERS)
# =======================================================
function lazyg --description 'Git add, commit and push'
    git add . && git commit -m "$argv[1]" && git push
end

# =======================================================
# 5. INTEGRATIONS & PROMPT
# =======================================================
# Mise (se incarca primul pentru a asigura disponibilitatea uneltelor)
if test -x ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
else if type -q mise
    mise activate fish | source
end

# FZF configuration
if type -q fd
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --follow --exclude .git'
end

set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --inline-info --color=dark"

if type -q fzf
    fzf --fish | source
end

# Zoxide
if type -q zoxide
    zoxide init fish | source
end

# Starship Prompt
if type -q starship
    starship init fish | source
end

# External script configs (daca exista fisier echivalent pentru fish)
if test -f "$HOME/github/music-player-service/aliases.fish"
    source "$HOME/github/music-player-service/aliases.fish"
end
