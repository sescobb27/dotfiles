# ~/.profile: executed by the command interpreter for login shells.

/usr/bin/setxkbmap -option 'ctrl:nocaps, shift:both_capslock'
export MAVEN_HOME=~/IDEs/apache-maven-3.1.1
PATH=$PATH:$MAVEN_HOME/bin
export PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
