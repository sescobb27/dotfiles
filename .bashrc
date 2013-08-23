case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

PS1='\[\033[01;32m\]\W\[\033[00m\]\[\033[01;34m\]\$\[\033[00m\] '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

JAVA_HOME=/usr/local/java/jdk1.7.0_21
export PATH=$PATH:$JAVA_HOME/bin
JRE_HOME=/usr/local/java/jdk1.7.0_21/jre
export PATH=$PATH:$JRE_HOME/bin
export PATH=$PATH

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
alias routes='rake routes' #list all proyect routes
alias gemi='gem install' #gem install
alias rgmo='rails g model' #rails generate model
alias rgco='rails g controller' #rails generate controller
alias backbonei='rails g backbone:install' #initialize backbone.js on rails proyect
alias rspeci='rails g rspec:install' #initialize backbone.js on rails proyect
alias rgmi='rails g migration' #rails generate migration
alias rru='rails r' #rails runner
alias rse='rails s' #rails server
alias rdbs='rails c --sandbox' #rails console secure mode 'rollback any modifications to database'
alias rc='rails c' #rails console
alias bi='bundle install' #bundle install dependencies
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
alias gitr='git rm' #remove files from repo
alias gits='git status' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull' #pull request


