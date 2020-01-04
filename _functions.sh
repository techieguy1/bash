#!/usr/bin/bash
########################################################################################################
#
# _functions.sh
#
# Defines common functions to be used by other shell scripts.
#
#-------------------------------------------------------------------------------------------------------
# DATE     | USER: DCESRIPTION
#----------+--------------------------------------------------------------------------------------------
# 20191127 | Vince: Initial revision.
#----------+--------------------------------------------------------------------------------------------
########################################################################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Define colors...Color names are spelled out for easier remembrance. Too much to type? Take a typing
# class.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_colors() {
   # Escape characters
   ESC="\e["
   
   # Set
   BOLD="${ESC}1m"
   DIM="${ESC}2m"
   UNDERLINE="${ESC}4m"
   BLINK="${ESC}5m"
   REVERSE="${ESC}7m"
   HIDDEN="${ESC}8m"

   # Reset
   RESET_ALL="${ESC}0m"
   NO_BOLD="${ESC}21m"
   NO_DIM="${ESC}22m"
   NO_UNDERLINE="${ESC}24m"
   NO_BLINK="${ESC}25m"
   NO_REVERSE="${ESC}27m"
   NO_HIDDEN="${ESC}28m"
         
   # Standard 16 colors
   BLACK="${ESC}30m"
   RED="${ESC}31m"
   GREEN="${ESC}32m"
   ORANGE="${ESC}33m"
   BLUE="${ESC}34m"
   PURPLE="${ESC}35m"
   CYAN="${ESC}36m"
   LIGHTGRAY="${ESC}37m"
   DARKGRAY="${ESC}90m"
   LIGHTRED="${ESC}91m"
   LIGHTGREEN="${ESC}92m"
   YELLOW="${ESC}93m"
   LIGHTBLUE="${ESC}94m"
   LIGHTPURPLE="${ESC}95m"
   LIGHTCYAN="${ESC}96m"
   WHITE="${ESC}97m"
   
   # Backgrounds
   BACK_BLACK="${ESC}40m"
   BACK_RED="${ESC}41m"
   BACK_GREEN="${ESC}42m"
   BACK_ORANGE="${ESC}43m"
   BACK_BLUE="${ESC}44m"
   BACK_PURPLE="${ESC}45m"
   BACK_CYAN="${ESC}46m"
   BACK_LIGHTGRAY="${ESC}47m"
   BACK_DARKGRAY="${ESC}100m"
   BACK_LIGHTRED="${ESC}101m"
   BACK_LIGHTGREEN="${ESC}102m"
   BACK_YELLOW="${ESC}103m"
   BACK_LIGHTBLUE="${ESC}104m"
   BACK_LIGHTPURPLE="${ESC}105m"
   BACK_LIGHTCYAN="${ESC}106m"
   BACK_WHITE="${ESC}107m"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Line separator
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_separator() {
   printf "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${RESET_ALL}\n"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Warning
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_warning() {
   printf "${BLACK}${BACK_YELLOW}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET_ALL}\n"
   printf "${BLACK}${BACK_YELLOW}!        W A R N I N G     W A R N I N G     W A R N I N G     W A R N I N G     W A R N I N G        !${RESET_ALL}\n"     
   printf "${BLACK}${BACK_YELLOW}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET_ALL}\n"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Error
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_error() {
   printf "${WHITE}${BACK_RED}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET_ALL}\n"
   printf "${WHITE}${BACK_RED}!    E R R O R     E R R O R     E R R O R     E R R O R     E R R O R     E R R O R     E R R O R    !${RESET_ALL}\n"     
   printf "${WHITE}${BACK_RED}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${RESET_ALL}\n"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Prints out an error message and exits. For the ${2} to work, you must pass in exactly this ${LINENO} 
# to this function.
#
# Example: _error_exit "Your custom error  message" ${LINENO}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_error_exit() {
   _error
   _print_cyan "${1:-"Unknown Error"} on line ${2}."
   exit
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# This is a clean exit (no errors).
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_exit() {
   _print_cyan "${1}"
   exit
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Pretty printing of output with cyan.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_print_cyan() {
   printf "${CYAN}${1}${NO_COLOR}${2}\n"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Pretty printing of output with yellow.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_print_yellow() {
   printf "${YELLOW}${1}${NO_COLOR}${2}\n"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Press any key to continue...
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
_press_any_key() {
   printf "${LIGHT_BLUE}"
   read -p "Press enter to continue..."
   printf "${NO_COLOR}"
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Git log find by commit message
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
glf() { 
   git log --all --grep="$1"; 
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Get process information by passing in a name (the application name, user, etc.).
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
proc() { 
   if [ $# -eq 0 ]; then
      _error; _separator
      _print_cyan "You must enter a name to get the process listing: " "e.g.: proc myuser"
      _separator
   else
      ps aux | grep --color=auto ${1} | grep -v grep
   fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Git clone shortcut for either my repo or someone else's.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
clone() {
   if [ $# -eq 0 ]; then
      echo "Please enter repo name or full url:";
      read repo;
      clone $repo;
   elif [[ ${1} == --help ]] || [[ ${1} == --h ]] || [[ ${1} == --? ]]; then
      echo "This will clone a git repo.";
      echo "";
      echo "Option 1: You can just provide the name, eg:";
      echo "$ clone membership";
      echo "This will do: git clone https://github.com/techieguy1/membership.git";
      echo "";
      echo "Option 2: Provide the full URL";
      echo "$ clone https://github.com/smallrye/smallrye-rest-client.git";
      echo "This will do: git clone https://github.com/smallrye/smallrye-rest-client.git";
   else
      if [[ ${1} == https://* ]] || [[ ${1} == git://* ]] || [[ ${1} == ssh://* ]] ; then
          URL=${1};
      else
          URL='https://github.com/techieguy1/'${1}'.git';
      fi

      echo git clone "$URL";
      git clone "$URL";
   fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Git branch shortcut for the PS1 command line. The beauty of this function is that if there isn't .git
# directory, you won't see an empty git─▶ directive.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git_branch() {
   git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(git─▶ \1)/' 
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mac Only - Prints number of process and the memory being used. 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
free() {
   top -l 1 -s 0 | awk ' /Processes/ || /PhysMem/  {print}'
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Trash functions. Note: MacOS uses ~/.Trash directory which I don't recommend using here. The following 
# is specific for the command line.
#
# checkt() - Checks the trash to see if there are any items in it.
# trash() - Moves the file to the trash directory.
# empty() - Empties _ALL_ contents of the trash directory.
#
# TODO 1. Implement restore capabilities by keeping track of the directory location of the trashed file.
# TODO 2. Empty one item at a time. 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Is there anything in the trash?
checkt() {
   local items_files=`find ${TRASH_LOCATION} -type f -name '*' -print | wc -l | xargs`
   local items_directories=`find ${TRASH_LOCATION} -type d -name '*' -print | wc -l | xargs`
   local size=`du -hs ${TRASH_LOCATION} | cut -f1 | xargs`

   if [[ ! "$(ls -A ${TRASH_LOCATION})" ]]; then
      echo ""
      _separator
      _print_cyan "Trash is empty." 
      _separator
   else
      echo ""
      _separator
      _print_cyan "Trash has ${items_files} files in it."
      _print_cyan "Trash has ${items_directories} directories in it."
      _print_cyan "Total size is ${size}b."
      _separator
  fi
}

# Add an item to the trash.
trash() {
   if [[ ! -d ${TRASH_LOCATION} ]]; then
      mkdir -p ${TRASH_LOCATION}   
   fi
   if [[ "X${1}" == "X" ]]; then 
      _error
      echo ""
      _separator 
      _print_cyan "You must supply a file to be trashed."
      _separator 
   else
      mv -f ${1} ${TRASH_LOCATION} 
   fi
}

# Empty the trash.
empty() {
   if [[ ! "$(ls -A ${TRASH_LOCATION})" ]]; then 
      echo ""
      _separator 
      _print_yellow "Trash is already empty."
      _separator
   else
      _warning
      checkt
      echo ""
      echo -n "Are you sure want to empty the trash? Type exactly YES to empty: "
      read answer
      if [[ ${answer} == "YES" ]]; then 
         rm -fr ${TRASH_LOCATION}/*
         echo ""
         _separator
         _print_cyan "Trash emptied."
         _separator
      else
         echo ""
         _separator
         _print_yellow "Trash not emptied."
         _separator
      fi
   fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Log my session using script.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
log() {
   if [[ ! -d ${SESSION_LOCATION} ]]; then
      mkdir -p ${SESSION_LOCATION}
   fi

   SESSION_DATE=`date +"%Y%m%d%H%M%S"`
   _separator; _print_cyan "Press CTRL-D or type 'exit' to exit logging."; _separator
   script ${SESSION_LOCATION}/session_${SESSION_DATE}.log
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Extraction utility.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extract() {
   if [ -z "$1" ]; then
      # display usage if no parameters given
      echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
      echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
      return 1
   else
      for n in $@
      do
         if [ -f "$n" ] ; then
            case "${n%,}" in
               *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                            tar xvf "$n"       ;;
               *.lzma)      unlzma ./"$n"      ;;
               *.bz2)       bunzip2 ./"$n"     ;;
               *.rar)       unrar x -ad ./"$n" ;;
               *.gz)        gunzip ./"$n"      ;;
               *.zip)       unzip ./"$n"       ;;
               *.z)         uncompress ./"$n"  ;;
               *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                            7z x ./"$n"        ;;
               *.xz)        unxz ./"$n"        ;;
               *.exe)       cabextract ./"$n"  ;;
               *)           echo "extract: '$n' - unknown archive method"
                            return 1
                            ;;
             esac
         else
            echo "'$n' - file does not exist"
            return 1
         fi
      done
   fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Kill a running process.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kp() {
   if [[ "X${1}" == "X" ]]; then
      _error
      echo "" 
      _print_cyan "Nothing to kill."
      echo ""
      _separator
   else
      kill -9 `ps aux | grep -v grep | grep ${1} | awk '{print $2}'` 2>/dev/null
      if [ $? -gt 0 ]; then
         _error 
         echo "" 
	 _print_cyan "${1} process does not exist."
	 echo ""
	 _separator
      else
         _separator
         _print_cyan "${1} process killed."
         _separator
      fi
   fi
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# 
#                    M   A   I   N
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Execute these immediately. 
TRASH_LOCATION=~/.local/Trash
SESSION_LOCATION=~/.local/session
_colors
