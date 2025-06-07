# bash

Repository of several bash scripts and resource files. 

Also includes some dotfiles. 

## Installation

1. mkdir ~/.bash_resources
2. Put aliases, exports, ps1, functions, and bash_ubuntu files in ~/.bash_resources.
3. Put .bashrc in your home's root directory.

   Example: If your home directory is located at /home/bill,
            then you would put .bashrc file there.

   `~/.bashrc`
     **OR**
   `/home/bill/.bashrc`

4. Source the .bashrc script.

   `. ~/.bashrc`
     **OR**
   `source ~/.bashrc`

5. If .bashrc isn't sourcing when you bring up a terminal, then you'll need to create a .bash_profile
script that sources .bashrc. Just drop the .bash_profile in your home's root directory. See included file.

6. The functions script contains a colors() function. I used full color name definitions to make it 
easier to remember. Others on the internet used abbreviated versions of the color names which I don't 
like. 

## Utilities Folder

- rsync.sh: Simple bash script for backing up items to a remote machine.

