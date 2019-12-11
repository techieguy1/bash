#!/usr/local/bin/bash
#
# rsync example
#
# Backs up data from a linux + windows dual-partitioned laptop to a
# remote desktop server on the same subnet.
#####################################################################

DUMPDATE=`date +"%Y%m%d"`
LOG=/var/log/laptop.backup/backup_${DUMPDATE}.log
umask 066
{   
   # Ensure backup log directory exists. If not, create it.   
   if [[ ! -e "/var/log/laptop.backup" ]]   
   then      
      mkdir /var/log/laptop.backup    
   fi      
   
   echo "`date +\"%Y%m%d %H:%M:%S\"`: Starting incremental backup."    
   echo "`date +\"%Y%m%d %H:%M:%S\"`: "

   echo "`date +\"%Y%m%d %H:%M:%S\"`: Start backup of /home."    
   rsync --verbose  --progress --stats --compress --rsh=/usr/bin/ssh \      
      --recursive --times --perms --links --delete \      
      --exclude "*bak" \      
      --exclude "*~" \      
      --exclude "/home/myhome/BOINC" \      
      --exclude "/home/myhome/fedora" \      
      --exclude "Cache/*" \      
      --exclude ".xine/*" \      
      --exclude ".opera/*" \      
      /home backup@192.168.2.6:/extra/laptop.backup   
   echo "`date +\"%Y%m%d %H:%M:%S\"`: End backup of /home."

   echo "`date +\"%Y%m%d %H:%M:%S\"`: Start backup of Windows partition."    
   rsync --verbose  --progress --stats --compress --rsh=/usr/bin/ssh \      
      --recursive --times --perms --links --delete \      
      --exclude "*bak" \      
      --exclude "*~" \      
      --exclude "Cache/*" \      
      /mnt/win/Document*/root/My\ Documents /mnt/win/Program*/Quicken/VINCE* \       
      backup@192.168.2.6:/extra/laptop.backup   
   echo "`date +\"%Y%m%d %H:%M:%S\"`: End backup of Windows partition."

   echo "`date +\"%Y%m%d %H:%M:%S\"`: "    
   echo "`date +\"%Y%m%d %H:%M:%S\"`: Completed incremental backup."

   # Remove log files older than 10 days   
   /usr/bin/find /var/log/laptop.backup -name "*.log" -atime +10 -exec rm -f {} \;
} 2>&1 | tee ${LOG}

exit
