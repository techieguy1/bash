# bash

Repository of several bash scripts and resource files. Please note some items within these scripts
are specific for Mac. You should be able to intuitively discern whether they're needed for your
Linux system or if they can be removed altogether. For example, brew items are not needed for 
Linux and can be safely removed.

Also includes .vimrc script(s). 

# Installation

1. mkdir ~/.bash_resources
2. Put aliases and exports files in ~/.bash_resources.
   
   The original exports file is *not* included in git because it contains some sensitive information. I have
   created a sample exports file for which you can use. Just drop the .sample extension.

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
