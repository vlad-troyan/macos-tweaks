
# ========================================
# Navigation and utilities
# ========================================

alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -lah'
alias la='ls -A'

# ========================================
# Java version switching
# ========================================

j21() { sdk use java 21.0.13.1+2-tem; java -version }
j17() { sdk use java 17.0.21.0+9-tem; java -version }
j25() { sdk use java 25.0.5.1+2-tem; java -version }

# ========================================
# Git prompt
# ========================================

autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '[%b]'
zstyle ':vcs_info:git:*' actionformats '[%b|%a]'

precmd() {
    vcs_info
}

# ========================================
# Prompt appearance
# ========================================

setopt PROMPT_SUBST

COLOR_DEF='%f'
COLOR_DIR='%F{#61AFEF}'
COLOR_GIT='%F{#98C379}'

PROMPT='${COLOR_DIR}%~${COLOR_DEF} ${COLOR_GIT}${vcs_info_msg_0_}${COLOR_DEF}
%% '

# ========================================
# Maven settings switching
# ========================================

mvn_iba() { _mvn_profile iba; }
mvn_hlag() { _mvn_profile hlag; }

_mvn_profile() {
    local profile="$1"
    local source="$HOME/.m2/settings/${profile}.xml"
    local active="$HOME/.m2/settings.xml"
    local backup="$HOME/.m2/settings.xml.backup.$(date +%Y%m%d-%H%M%S)"

    if [[ ! -f "$source" ]]; then
        print -u2 "Maven settings for ${profile} not found: ${source}"
        return 1
    fi
    if [[ -e "$active" && ! -L "$active" ]]; then
        cp -p "$active" "$backup" || return 1
    fi
    ln -sfn "$source" "$active" || return 1
    print "Maven settings switched to ${profile}"
}

# ========================================
# SDKMAN
# MUST BE AT THE END OF THE FILE
# ========================================

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
