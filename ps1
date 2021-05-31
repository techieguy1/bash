# Some graphics that can be used at the command-line --> ┌ ─ ▶ ├ └
PS1="\n${LIGHTCYAN}┌─▶${LIGHTPURPLE} \$(/bin/date '+%Y-%m-%d %H:%M:%S') - "
# Adds TTY info to the comman-line --> PS1="${LIGHTBLUE}\$(/usr/bin/tty | /usr/bin/sed -e 's:/dev/::'): "
PS1+="${LIGHTGREEN}\$(pwd) - "
PS1+="${LIGHTCYAN}\$(/bin/ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') "
PS1+="files - ${LIGHTYELLOW}\$(/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 's/total //')b"
if [[ ${EUID} == 0 ]] ; then
   PS1+="\n${LIGHTCYAN}├─▶${RED} \u@\h "
else
   PS1+="\n${LIGHTCYAN}├─▶${GREEN} \u@\h "
fi
PS1+="${LIGHTGREEN}${LIGHTCYAN}\$(git_branch)${LIGHTGREEN} \n"
PS1+="\[${LIGHTCYAN}\]└─▶\[${RESET_ALL}\] "
export PS1

