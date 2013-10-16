# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
PS1="\[\033[01;32m\]\W\[\033[01;033m\]\$(__git_ps1 ' (%s)')\[\033[01;34m\]\$\[\033[00m\] "
#export PS1="\\w\$(__git_ps1 '(%s)') \$ "
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'





# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

JAVA_HOME=/usr/local/java/jdk1.7.0_21
export PATH=$PATH:$JAVA_HOME/bin
JRE_HOME=/usr/local/java/jdk1.7.0_21/jre
export PATH=$PATH:$JRE_HOME/bin
export PATH=$PATH
#M2_HOME=/Downloads/apache-maven-3.1.0
#export PATH=$PATH:$M2_HOME/bin
#LENSKIT=/Downloads/lenskit-2.0
#export PATH=$PATH:$LENSKIT/bin
export PATH=$PATH:/home/simon/Downloads/lenskit-2.0/bin
#mongodb path= /usr/local/mongodb
#dbpath = /usr/local/var/mongodb

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"





# =============================================================================================
# ==========RAILS ALIASES========================================
alias api='sudo apt-get install'
alias dbmi='rake db:migrate' #migrate database
alias dbrol='rake db:rollback' #rolls the database schema back to the previous version
alias dbse='rake db:seed' #seed database
alias dbre='rake db:reset' #reset database
alias dbcr='rake db:create' #create database
alias dbtp='rake db:test:prepare' #prepare database for test
alias routes='rake routes' #list all proyect routes
alias gemi='gem install' #gem install
alias rgmo='rails g model' #rails generate model
alias rgco='rails g controller' #rails generate controller
alias backbonei='rails g backbone:install' #initialize backbone.js on rails proyect
alias rspeci='rails g rspec:install' #initialize rspec on current proyect
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
alias gitp_p='git pull; git push origin' #git secure push first pull changes from remote repo, then push the changes COLLABORATION
alias gitr='git rm' #remove files from repo
alias gits='git status' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull' #pull request
alias gitdi='git diff' #show differences between local files and remote files
alias gitdia='git diff --stage' #same as above but between added files and reomte files
alias gitremote='git remote add origin https://github.com/sescobb27/'
alias gitrc='git reset --soft HEAD^' #undo the last commit
alias gitrcf='git reset --soft' #undo a file from last commit
alias gitamend='git commit --amend' #add untracked files to last commit 
alias gitamendm=gitamend+'-m' #same as amend but reset the git message
alias gitrmc='git reset --hard HEAD^' #DANGER remove last commit and undo all changes
alias gitbr='git checkout' #change to another branch
alias gitmb='git merge' #merge two different branch
alias gitdb='git branch -d' #delete a local branch unless it has unmerged commits
alias gitDdb='git branch -D' #DANGER it deletes a branch without asking to merge commits
alias gitlb='git branch -r' #list all remote branches
alias gitrb='git push origin' #delete a remote branch put colon before branch name ":name"
alias gitsb='git remote show origin' #show all remote branches, local branches for pull and local branches for push
alias gitcc='git checkout -b' #create and change to another branch
