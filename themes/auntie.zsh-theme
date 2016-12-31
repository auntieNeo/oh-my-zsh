# ZSH Theme - auntieNeo's theme
# Thanks to gallifrey, upon whose theme this is based
# Also thanks to Luke Randall for his modifications

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='%B%F{blue}%!%f%b %{$fg_bold[green]%}%n@%m%f %{$fg_bold[blue]%}%2~%f $(my_git_prompt_info)%{$fg_bold[blue]%}%B%F{red}%(0?..[%?] )%F{blue}\$%b%f '
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

