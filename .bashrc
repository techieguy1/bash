#######################################################################################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
#
#######################################################################################################################

# Set the command-line functionality to vi.
set -o vi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source in the various sections of the resource file. Order is important!
source ~/.bash_resources/functions
source ~/.bash_resources/aliases
source ~/.bash_resources/exports
source ~/.bash_resources/bash_ubuntu
source ~/.bash_resources/ps1

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
