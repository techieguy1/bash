#!/usr/bin/bash
##############################################################################
# 
# make_chroot.sh
#
# Creates a chroot directory with the necessary binary applications and 
# dependent libraries.
#
##############################################################################

# Set the location of the chroot directory.
ROOT_LOCATION=/var/local
NEW_ROOT_DIR=new_root

# Create the necessary directories.
if [[ ! -d ${ROOT_LOCATION}/${NEW_ROOT_DIR} ]]; then
   mkdir ${ROOT_LOCATION}/${NEW_ROOT_DIR}
   mkdir ${ROOT_LOCATION}/${NEW_ROOT_DIR}/bin 
   mkdir ${ROOT_LOCATION}/${NEW_ROOT_DIR}/lib 
   mkdir ${ROOT_LOCATION}/${NEW_ROOT_DIR}/lib64
fi

# Create the minimal bin directory using the binary applications listed in
# BIN_APPS.
BIN_APPS="bash touch ls rm vim cp grep df du ps head tail mkdir rmdir"
cd ${ROOT_LOCATION}/${NEW_ROOT_DIR}  
for APP in ${BIN_APPS}; do
   cp /bin/${APP} bin
done

# Copy the necessary libraries that will allow the binary applications to
# work properly.
for LIBRARIES in `ls -1 ${ROOT_LOCATION}/${NEW_ROOT_DIR}/bin`; do
   # Get the dependencies
   LIBS="$(ldd /bin/${LIBRARIES} | egrep -o '/lib.*\.[0-9]*')"
   # Loop through the dependency list and add them to the new location.
   for i in ${LIBS}; do 
      cp -v --parents "${i}" "${ROOT_LOCATION}/${NEW_ROOT_DIR}" 
   done
done

exit
