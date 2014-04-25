# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# UBUNTU
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -A'
alias ls='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# END UBUNTU
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

if [ -f ~/.bash_config ]; then
  . ~/.bash_config
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.elasticsearch ]; then
  . ~/.elasticsearch
fi

shopt -s checkwinsize
shopt -s autocd

PS1="
╭\[\033[01;033m\] \[\033[01;32m\]\$USER:\[\033[01;033m\] \[\033[01;34m\]\$(date +'(%a) (%b/%d/%Y) %r')\[\033[00m\]
╰ \[\033[01;033m\] \[\033[01;32m\](\W)\[\033[01;031m\]\$(__git_ps1 ' (%s)')\[\033[01;34m\]\$\[\033[00m\] "

alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias cl='reset && clear'
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Documents/Go
export GOMAXPROCS=8
export GOARCH=amd64
export GOOS=linux
ANDROID_TOOLS=~/IDEs/adt-bundle-linux/sdk/platform-tools
ANDROID_TOOLS=~/IDEs/adt-bundle-linux/sdk/tools:$ANDROID_TOOLS
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export JRE_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
export PATH=$PATH:$ANDROID_TOOLS

export RUBY_GC_MALLOC_LIMIT=16MB
export RUBY_GC_MALLOC_LIMIT_MAX=32MB
export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.4
export RUBY_GC_OLDMALLOC_LIMIT=16MB
export RUBY_GC_OLDMALLOC_LIMIT_MAX=128MB
export RUBY_GC_OLDMALLOC_LIMIT_GROWTH_FACTOR=1.2
export RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.3
export LD_PRELOAD=/usr/local/lib/libjemalloc.so

# /usr/bin/setxkbmap -option 'ctrl:nocaps, shift:both_capslock'
if [ -f ~/.secrets ]; then
  . ~/.secrets
fi

if [ -f /etc/profile.d/rvm.sh ]; then
	source /etc/profile.d/rvm.sh
fi

# =============================================================================================
# ==========RAILS ALIASES========================================
alias dbmi='rake db:migrate' #migrate database
alias dbrol='rake db:rollback' #rolls the database schema back to the previous version
alias dbse='rake db:seed' #seed database
alias dbre='rake db:reset' #reset database
alias dbcr='rake db:create' #create database
alias dbtp='rake db:test:prepare' #prepare database for test
alias dbdr='rake db:drop' #drop database
alias routes='rake routes' #list all project routes
alias gemi='gem install' #gem install
alias rgmo='rails g model' #rails generate model
alias rgco='rails g controller' #rails generate controller
alias backbonei='rails g backbone:install' #initialize backbone.js on rails project
alias rspeci='rails g rspec:install' #initialize rspec on current project
alias cucum='rails g cucumber:install' #initialize cucumber on current project
alias rgmi='rails g migration' #rails generate migration
alias rru='rails r' #rails runner
alias rse='rails s' #rails server
alias rdbs='rails c --sandbox' #rails console secure mode 'rollback any modifications to database'
alias rc='rails c' #rails console
alias bi='bundle install' #bundle install dependencies
alias rsmo='rails g rspec:model' #generates new rspec model
alias rsco='rails g rspec:controller' #generates new rspec controller
alias railsdir='cd ~/Documents/Rails/'
# ==========RAILS ALIASES========================================
# =============================================================================================

# ==========GIT ALIASES========================================
# =============================================================================================
alias gitcl='git clone' #clone repo
alias gitcm='git commit -m' #commit changes
alias gitca='git commit -am' #add all changes and commit them
alias gita='git add' #add some changes, like new files
alias gitpm='git push origin master' #push origin master
alias gitpo='git push origin' #other branch
alias gitpr='git push --recurse-submodules=check'
alias gitp_p='git pull; git push origin' #git secure push first pull changes from remote repo, then push the changes COLLABORATION
alias gitrm='git rm' #remove files from repo
alias gits='git status' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull --rebase' #pull request
alias gitpuo='git pull origin' #pull request for one branch
alias gitdi='git diff' #show differences between local files and remote files
alias gitdia='git diff --stage' #same as above but between added files and reomte files
alias gitremote='git remote add origin git@github.com:sescobb27/'
alias gitrmc='git reset --soft HEAD^' #undo the last commit
alias gitrmcf='git reset --soft' #undo a file from last commit
alias gitref='git reset --' #reset file
alias gitcam='git commit --amend' #add untracked files to last commit
alias gitcamm="$gitcam -m" #same as amend but reset the git message
alias gitRmc='git reset --hard HEAD^' #DANGER remove last commit and undo all changes
alias gitbr='git checkout' #change to another branch
alias gitmbr='git merge' #merge two different branch
alias gitdbr='git branch -d' #delete a local branch unless it has unmerged commits
alias gitDbr='git branch -D' #DANGER it deletes a branch without asking to merge commits
alias gitlbr='git branch -r' #list all remote branches
alias gitsbr='git remote show origin' #show all remote branches, local branches for pull and local branches for push
alias gitcbr='git checkout -b' #create and change to another branch
alias gitclbr='git remote prune origin' #clean up deleted remote branches
alias gitdrb='git push origin --delete'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
