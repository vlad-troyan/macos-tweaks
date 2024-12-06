alias j21="export JAVA_HOME=`/usr/libexec/java_home -v 21`; java -version"
alias j17="export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version"
alias j11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}
COLOR_DEF=$'%f'
COLOR_GIT=$'%F{2}'
COLOR_DIR=$'%F{8}'
COLOR_USR=$'%F{4}'
setopt PROMPT_SUBST
PROMPT_GIT=' ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}'
PROMPT_PARENT_DIR='${COLOR_DIR}%~${COLOR_DEF}'
export NEWLINE=$'\n'
export PROMPT="${PROMPT_PARENT_DIR}${PROMPT_GIT}${NEWLINE}%% "
export PATH=~/.rd/bin:$PATH
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/vlad/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
