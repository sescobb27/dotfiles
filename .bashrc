# brew install git bash-completion hub zsh zsh-completions postgres

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

ulimit -n 2560
eval "$(hub alias -s)"
eval "$(direnv hook bash)"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

if [ -f ~/.zshrc ]; then
  source ~/.zshrc
fi

test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

if [ -f ~/kerl/20.1/activate ]; then
  source ~/kerl/20.1/activate
fi

PS1="
╭\[\033[01;033m\] \[\033[01;32m\]\$USER:\[\033[01;033m\] \[\033[01;34m\]\$(date +'(%a) (%b/%d/%Y) %r')\[\033[00m\]
╰ \[\033[01;033m\] \[\033[01;32m\](\W)\[\033[01;031m\]\$(__git_ps1 ' (%s)')\[\033[01;34m\]\$\[\033[00m\] "

export NVM_DIR="/Users/kiro/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH=/usr/local/heroku/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export CLICOLOR=1
alias ll='ls -alh'
export EDITOR="subl"
# ==========GIT ALIASES========================================
# =============================================================================================
alias gitl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #clone repo
alias gitcl='git clone' #clone repo
alias gitcm='git commit -m' #commit changes
alias commit='git commit' #commit changes
alias gitca='git commit -am' #add all changes and commit them
alias gita='git add' #add some changes, like new files
alias gitpm='git push -u origin master' #push origin master
alias gitpo='git push -u origin' #other branch
alias gitrm='git rm' #remove files from repo
alias gits='git status --short --branch' #show repo current status
alias giti='git init' #inti repo
alias gitp='git pull --rebase origin' #pull request
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
# ==========GIT ALIASES========================================
# =============================================================================================

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# =============================================================================================
# ==========RAILS ALIASES========================================
alias dbmi='bundle exec rake db:migrate' #migrate database
alias dbrol='bundle exec rake db:rollback' #rolls the database schema back to the previous version
alias dbse='bundle exec rake db:seed' #seed database
alias dbre='bundle exec rake db:reset' #reset database
alias dbcr='bundle exec rake db:create' #create database
alias dbtp='bundle exec rake db:test:prepare' #prepare database for test
alias dbdr='bundle exec rake db:drop' #drop database
alias routes='bundle exec rake routes' #list all project routes
alias rtasks='bundle exec rake -T' #list all rake tasks
alias gemi='gem install' #gem install
alias rgmo='rails g model' #rails generate model
alias rgco='rails g controller' #rails generate controller
alias rspeci='rails g rspec:install' #initialize rspec on current project
alias cucumi='rails g cucumber:install' #initialize cucumber on current project
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

# =============================================================================================
# ==========ELIXIR ALIASES========================================
alias mr='mix phx.routes'
alias mdg='mix deps.get'
alias mdu='mix deps.update'
alias mc='mix compile'
alias serve='iex -S mix phx.server'
alias mg='mix ecto.migrate'
alias mroll='mix ecto.rollback'
alias hecto='mix help | grep ecto'
alias hphx='mix help | grep -E "phx|phoenix"'
alias iexm='iex -S mix'
# ==========ELIXIR ALIASES========================================
# =============================================================================================
alias c='docker-compose'
alias cb='docker-compose build'
alias cup='docker-compose up'
alias clogs='docker-compose logs'


export GOPATH=$HOME/go
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export ERL_AFLAGS="-kernel shell_history enabled"

# heroku autocomplete setup
CLI_ENGINE_AC_BASH_SETUP_PATH=/Users/kiro/Library/Caches/heroku/completions/bash_setup && test -f $CLI_ENGINE_AC_BASH_SETUP_PATH && source $CLI_ENGINE_AC_BASH_SETUP_PATH;

function rdb () {
  export MIX_ENV=test
  mix ecto.drop
  mix ecto.create
  mix ecto.migrate
  unset MIX_ENV
}

configure-macos() {
  # Always show scrollbars
	defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

  # Disable the sound effects on boot
	sudo nvram SystemAudioVolume=" "

	# Increase window resize speed for Cocoa applications
	defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

  # Disable the “Are you sure you want to open this application?” dialog
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	# Disable auto-correct
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # Require password immediately after sleep or screen saver begins
	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0

  # Finder: disable window animations and Get Info animations
	defaults write com.apple.finder DisableAllAnimations -bool true

	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	# Finder: show status bar
	defaults write com.apple.finder ShowStatusBar -bool true

	# Finder: show path bar
	defaults write com.apple.finder ShowPathbar -bool true

	# Display full POSIX path as Finder window title
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	# Keep folders on top when sorting by name
	defaults write com.apple.finder _FXSortFoldersFirst -bool true

	# When performing a search, search the current folder by default
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

	# Disable the warning when changing a file extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

  # Avoid creating .DS_Store files on network or USB volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

  # Automatically open a new Finder window when a volume is mounted
	defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
	defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
	defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

  # Disable the warning before emptying the Trash
	defaults write com.apple.finder WarnOnEmptyTrash -bool false

  # Don’t animate opening applications from the Dock
	defaults write com.apple.dock launchanim -bool false

	# Speed up Mission Control animations
	defaults write com.apple.dock expose-animation-duration -float 0.1

	# Automatically hide and show the Dock
	defaults write com.apple.dock autohide -bool true

  # Don’t display the annoying prompt when quitting iTerm
	defaults write com.googlecode.iterm2 PromptOnQuit -bool false
}
