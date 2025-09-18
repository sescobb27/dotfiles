# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf)

fpath=($HOME/.asdf/completions $fpath)
source $(brew --prefix asdf)/libexec/asdf.sh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -alh'
alias ports='netstat -tulpn'
# ==========GIT ALIASES========================================
# =============================================================================================
alias gitl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #clone repo
alias gitcl='git clone' #clone repo
alias gitcm='git commit -m' #commit changes
alias gticm='git commit -m' #commit changes
alias commit='git commit' #commit changes
alias gitca='git commit -am' #add all changes and commit them
alias gita='git add' #add some changes, like new files
alias gtia='git add' #add some changes, like new files
alias gitaa='git add -A' #add some changes, like new files
alias gitpm='git push -u origin master' #push origin master
alias gitpo='git push -u origin' #other branch
alias gitpoh='git push -u origin head' #other branch
alias gitrm='git rm' #remove files from repo
alias gits='git status --short --branch' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull --rebase origin' #pull request
alias gitrc='git rebase --continue'
alias gitra='git rebase --abort'
alias gitdi='git diff' #show differences between local files and remote files
alias staged='git diff --staged' #same as above but between added files and reomte files
alias undo='git reset --soft HEAD^' #undo the last commit
alias gitrmcf='git reset --soft' #undo a file from last commit
alias gitref='git reset --' #reset file
alias amend='git commit --amend --no-edit' #add untracked files to last commit
alias gitcam="git commit --amend" #same as amend but reset the git message
alias undo_hard='git reset --hard HEAD^' #DANGER remove last commit and undo all changes
alias goto='git checkout' #change to another branch
alias gitbr='git checkout' #change to another branch
alias gitdbr='git branch -d' #delete a local branch unless it has unmerged commits
alias gitDbr='git branch -D' #DANGER it deletes a branch without asking to merge commits
alias gitlbr='git branch -r' #list all remote branches
alias gitsbr='git remote show origin' #show all remote branches, local branches for pull and local branches for push
alias gitcbr='git checkout -b' #create and change to another branch
alias gitclbr='git remote prune origin' #clean up deleted remote branches
alias gitdrb='git push origin --delete'
alias stash='git stash'
alias gitdmerged='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gitdmergedmain='git checkout -q main && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base main $branch) && [[ $(git cherry main $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias dcu='docker-compose up -d'
# ==========GIT ALIASES========================================
# =============================================================================================

# =============================================================================================
# ==========ELIXIR ALIASES========================================
alias mr='mix phx.routes'
alias mdg='mix deps.get'
alias mdu='mix deps.update'
alias mc='mix compile'
alias serve='iex -S mix phx.server'
alias pserve='iex -S mix phx.server'
alias pserver='iex -S mix phx.server'
alias mg='mix ecto.migrate'
alias mroll='mix ecto.rollback'
alias hecto='mix help | grep ecto'
alias hphx='mix help | grep -E "phx|phoenix"'
alias iexm='iex -S mix'
# ==========ELIXIR ALIASES========================================
# =============================================================================================
export EDITOR="cursor --wait"
export ERL_AFLAGS="-kernel shell_history enabled"
eval "$(hub alias -s)"
# Avoid duplicates
export HISTFILE=~/.zsh_history
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
export HISTSIZE=1000000                   # big big history
export HISTFILESIZE=1000000               # big big history
export LSCOLORS=Dxfxcxdxbxegedabagacad
export CLICOLOR=1
export REGION=us-west-2
export PATH="$PATH:/Users/sebenitez/bin:/Users/sebenitez/appcues/appcues_cli:/Users/sebenitez/.asdf/installs/nodejs/20.17.0/bin"
export KERL_BUILD_DOCS="yes"
export KERL_CONFIGURE_OPTIONS="--without-wx --without-javac --with-ssl=`brew --prefix openssl` --disable-jit"
export KERL_CONFIGURE_DISABLE_APPLICATIONS="odbc megaco"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
ulimit -n 100000
if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1

PS1="
\$USER: $(date +'(%a %b/%d)') %D{%H:%M:%S %p} (%~)\$(__git_ps1 ' (%s)')$ "

# =============================================================================================
# ==========MCP ALIASES========================================
alias mcp-proxy='/Users/sebenitez/bin/mcp-proxy'
alias mcp_proxy='/Users/sebenitez/bin/mcp-proxy'


setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt PROMPT_SUBST


# source /Users/sebenitez/.docker/init-zsh.sh || true # Added by Docker Desktop

google(){
  gemini -p "Search google for <query>$1</query> and summarize  results"
}

alias c='cursor'
