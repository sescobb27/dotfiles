# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

force_color_prompt=yes

PS1="\[\033[01;32m\]\W\[\033[01;033m\]\$(__git_ps1 ' (%s)')\[\033[01;34m\]\$\[\033[00m\] "
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

JAVA_HOME=/usr/local/java/jdk1.7.0_21
export PATH=$PATH:$JAVA_HOME/bin
JRE_HOME=/usr/local/java/jdk1.7.0_21/jre
export PATH=$PATH:$JRE_HOME/bin
SBT="$HOME/.scala_sbt/sbt/bin"
export PATH=$PATH:$SBT
export PATH=$PATH
#mongodb path= /usr/local/mongodb
#dbpath = /usr/local/var/mongodb

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


alias operativos='cd Documents/Semestre/Sistemas\ Operativos/Control/Automatas/Estado/finito/'
# =============================================================================================
# ==========RAILS ALIASES========================================
alias api='sudo apt-get install'
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
alias gitp_p='git pull; git push origin' #git secure push first pull changes from remote repo, then push the changes COLLABORATION
alias gitr='git rm' #remove files from repo
alias gits='git status' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull' #pull request
alias gitpuo='git pull origin' #pull request for one branch
alias gitdi='git diff' #show differences between local files and remote files
alias gitdia='git diff --stage' #same as above but between added files and reomte files
alias gitremote='git remote add origin git@github.com:sescobb27/'
alias gitrc='git reset --soft HEAD^' #undo the last commit
alias gitrcf='git reset --soft' #undo a file from last commit
alias gitamend='git commit --amend' #add untracked files to last commit
alias gitamendm=$gitamend+'-m' #same as amend but reset the git message
alias gitrmc='git reset --hard HEAD^' #DANGER remove last commit and undo all changes
alias gitbr='git checkout' #change to another branch
alias gitmb='git merge' #merge two different branch
alias gitdb='git branch -d' #delete a local branch unless it has unmerged commits
alias gitDdb='git branch -D' #DANGER it deletes a branch without asking to merge commits
alias gitlb='git branch -r' #list all remote branches
alias gitsb='git remote show origin' #show all remote branches, local branches for pull and local branches for push
alias gitcc='git checkout -b' #create and change to another branch
alias gitclb='git remote prune origin' #clean up deleted remote branches
