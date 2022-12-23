#######################################################################################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
#
#######################################################################################################################

# Set the command-line functionality to vi.
set -o vi

# Set the masking of files being created to the owner only.
umask 022

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source in the various sections of the resource file. Order is important!
source ~/.bash_resources/functions
source ~/.bash_resources/aliases
source ~/.bash_resources/exports
source ~/.bash_resources/bash_fedora
source ~/.bash_resources/ps1

# Don't want to use Anaconda if root.
if [[ ${EUID} != 0 ]]; then
# >>> conda initialize >>>
   # !! Contents within this block are managed by 'conda init' !!
   __conda_setup="$('${HOME}/apps/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
   if [ $? -eq 0 ]; then
      eval "$__conda_setup"
   else
      if [ -f "${HOME}/apps/anaconda3/etc/profile.d/conda.sh" ]; then
         . "${HOME}/apps/anaconda3/etc/profile.d/conda.sh"
      else
         export PATH="${HOME}/apps/anaconda3/bin:$PATH"
      fi
   fi
   unset __conda_setup
# <<< conda initialize <<<
fi # END if root

# . "$HOME/.cargo/env"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
