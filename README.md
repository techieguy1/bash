# bash

Repository of several bash scripts and resource files.

Also includes .vimrc script(s). 

# Installation

1. mkdir ~/.bash_resources
2. Put aliases and exports files in ~/.bash_resources.
   
   exports file is *not* included in git because there is some sensitive information 
   in my files.

   Google how to create an export in bash if you are unsure.

3. Put .bashrc in your home's root directory.

   Example: If your home directory is located at /home/bill,
            then you would put .bashrc file there.

   `~/.bashrc`
     **OR**
   `/home/bill/.bashrc`

4. Source the .bashrc script.

   `. ~/.bashrc`

# Utilities Folder

- rsync.sh: Simple bash script for backing up items to a remote machine.
