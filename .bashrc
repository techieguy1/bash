#######################################################################################################################
# .bashrc
#
#######################################################################################################################
. ~/.bash_resources/_functions.sh
. ~/.bash_resources/aliases
. ~/.bash_resources/exports

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
   . $(brew --prefix)/share/bash-completion/bash_completion
fi

set -o vi

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


###### Some sample PS1's.

#export PS1="\n${LIGHTBLUE}\h ${LIGHTCYAN}- ${LIGHTGREEN}\d \t ${LIGHTCYAN}[\w]\n\$(git_branch) ${LIGHTCYAN}\u \$ ${WHITE}"

#export PS1='\n\[\033[0;35m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;37m\]\342\234\227\[\033[0;35m\]]\342\224\200")[\[\033[0;33m\]\t\[\033[0;35m\]]\342\224\200[\[\033[0;37m\]\u@\h : ($(git branch 2>/dev/null | grep "^*" | colrm 1 2)) : \[\033[0;32m\]\w\[\033[0;35m\]]\n\342\224\224\342\224\200\342\224\200> \[\033[0;37m\]$ \[\033[0m\]'

#export PS1='\n\[\033[0;35m\]\342\224\214\342\224\200$([[ $? != 0 ]] && echo "[\[\033[0;37m\]\342\234\227\[\033[0;35m\]]\342\224\200")[\[\033[0;33m\]\t\[\033[0;35m\]]\342\224\200[\[\033[0;37m\]\u@\h : \[\033[0;32m\]\w\[\033[0;35m\]]\n\342\224\224\342\224\200\342\224\200> \[\033[0;37m\]$ \[\033[0m\]'

#PS1='${GREEN}[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '

#PS1='\n\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \w\[\033[0;32m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo " - ["; fi)$(git branch 2>/dev/null | grep "^*" | colrm 1 2)\[\033[0;32m\]$(if git rev-parse --git-dir > /dev/null 2>&1; then echo "]"; fi)\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '

