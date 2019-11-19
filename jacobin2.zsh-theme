# difine colors
orange="%F{166}"
purple="%F{135}"
hotpink="%F{161}"
limegreen="%F{118}"

# Directory info
local current_dir='${PWD/#$HOME/~} '

# ret status
local ret_status="(?:%F{green}ᐅ :%F{red}ᐅ )"

# VCS
YS_VCS_PROMPT_PREFIX="%F{white}[%f%F{cyan}"
YS_VCS_PROMPT_SUFFIX="%F{white}]%f "
YS_VCS_PROMPT_DIRTY=" %F{red}✗"
YS_VCS_PROMPT_CLEAN=" %{$limegreen%}✔"

# Git short sha
local git_sha='$(git_prompt_short_sha)'
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$orange%}("
ZSH_THEME_GIT_PROMPT_SHA_AFTER=")%f "

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="$YS_VCS_PROMPT_PREFIX"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"


# Prompt format: \n # DIRECTORY [GIT_BRANCH STATE GIT_SHA] [TIME] \n ➜
PROMPT="
%F{blue}#%f \
%F{magenta}${current_dir}%f\
${git_info}\
${git_sha}\
%F{yellow}[%*]
%${ret_status}%f"

RPROMPT="%F{8}%n@%m%f"    # Display username if connected via SSH
