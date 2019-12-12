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
if [[ ${EUID} == 0 ]] ; then
   export PS1="${LIGHTRED}\h -- ${LIGHTGREEN}\d \t ${LIGHTCYAN}[\w]\n${LIGHTRED}\u \$ ${WHITE}"
else
   export PS1="${LIGHTBLUE}\h -- ${LIGHTGREEN}\d \t ${LIGHTCYAN}[\w]\n${LIGHTCYAN}\u \$ ${WHITE}"
fi
