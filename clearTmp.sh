#!/bin/bash
#Cleanup of The temporary folder

LOG_DIR=/var/log
ROOT_UID=0    # To indentify Root user , $UID 0
LINES=50      # Default number of lines saved
E_XCD=86      # Can't change directory error code
E_NOTROOT=87  # Non-root exit error code

#Test if the script is run as Root
if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run the script."
  exit $E_NOTROOT
fi

#Test if there is an argument for the number of lines
if [  -ne "$1" ]
then
  lines=$1
else
  lines=$LINES #If no argument assign default value
fi
echo $lines
#Try to change directory
cd $LOG_DIR || {
  echo "Can't change to $LOG_DIR" >&2
  exit $E_XCD;
}

#Saved last section of log files
tail -n $lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null > wtmp
echo "Log files cleaned up"

exit 0
