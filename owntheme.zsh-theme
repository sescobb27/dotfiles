HOST_PROMPT_="%{$fg_bold[green]%}$USER: %{$fg_bold[cyan]%}$(date)"
GIT_PROMPT="%{$fg_bold[blue]%} \$(git_prompt_info)%{$reset_color%}"
PROMPT="➜ $HOST_PROMPT_ $GIT_PROMPT %{$fg_bold[yellow]%}%c: %{$fg_bold[white]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✘%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}✔%{$reset_color%}"
