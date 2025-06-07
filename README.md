# bash

Repository of several bash scripts and resource files. Please note some items within these scripts
are specific for Mac. You should be able to intuitively discern whether they're needed for your
Linux system or if they can be removed altogether. For example, brew items are not needed for 
Linux and can be safely removed.

Also includes some dotfiles. 

NOTE: SSH aliases to other systems only work with the local LAN. Those systems cannot be accessed
from the outside. This was done on purpose for security reasons.

## Installation

1. mkdir ~/.bash_resources
2. Put aliases and exports files in ~/.bash_resources.
   
   ~~The original exports file is *not* included in git because it contains some sensitive information. I have
   created a sample exports file for which you can use. Just drop the .sample extension.~~

   ~~Google how to create an exported variable in bash if you are unsure.~~

3. Put .bashrc in your home's root directory.

   Example: If your home directory is located at /home/bill,
            then you would put .bashrc file there.

   `~/.bashrc`
     **OR**
   `/home/bill/.bashrc`

4. Source the .bashrc script.

   `. ~/.bashrc`

5. If .bashrc isn't sourcing when you bring up a terminal, then you'll need to create a .bash_profile
script that sources .bashrc. Just drop the .bash_profile in your home's root directory. See included file.

6. The \_functions.sh script contains a colors() function. I used full color name definitions to make it 
easier to remember. Others on the internet used abbreviated versions of the color names which I don't 
like. 

## Utilities Folder

- rsync.sh: Simple bash script for backing up items to a remote machine.


