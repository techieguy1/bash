#######################################################################################################################
# .bashrc
#
#######################################################################################################################

# Ensure .bash_resources exists.
if [[ -d ~/.bash_resources ]]; then
   . ~/.bash_resources/_functions.sh
   . ~/.bash_resources/aliases
   . ~/.bash_resources/exports
   
   # Set the command line
   PS1="\n${LIGHTCYAN}┌─▶${PURPLE} \$(/bin/date '+%Y-%m-%d %H:%M:%S') ${LIGHTBLUE}\$(/usr/bin/tty | /usr/bin/sed -e 's:/dev/::'): "
   PS1+="\$(pwd) "
   PS1+="${LIGHTCYAN}\$(/bin/ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') "
   PS1+="files ${YELLOW}\$(/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 's/total //')b"
   if [[ ${EUID} == 0 ]] ; then
      PS1+="\n${LIGHTCYAN}├─▶${LIGHTRED} \u@\h "
   else
      PS1+="\n${LIGHTCYAN}├─▶${LIGHTGREEN} \u@\h "
   fi
   PS1+="${LIGHTGREEN}${LIGHTCYAN}\$(git_branch)${LIGHTGREEN} "
   PS1+="\n${LIGHTCYAN}└─▶${RESET_ALL} "
   export PS1
else
   # Couldn't find bash's resource directory, provide fallback.
   alias ls="ls --color=auto --group-directories-first"
   # Provide simple PS1.
   PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ ' 
fi

# MacOS specific...
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
   . $(brew --prefix)/share/bash-completion/bash_completion
fi

# I like using vi at the command line. Been doing this since 1994.
set -o vi

# History controls
#######################################################################################################################
# Don't put duplicate lines or lines starting with space in the history. See bash(1) for more options.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1).
HISTSIZE=1000
HISTFILESIZE=2000
#######################################################################################################################

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

