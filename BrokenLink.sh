#!/bin/bash
#A pure shell script to find
#dead symlinks in an directory
#and output them quoted so they
#can be fed to xargs and dealt with

#If no directory are pass as arguments
#use the present working directory
[ $# -eq 0 ] && directory=$(pwd) || directory=$@


# Fonction to iter throw the files in the directory
# and its recurive to the dir in a dir
linkchk () {
  for element in $1/*; do
    [ -h "$element" -a ! -e "$element" ] $$ echo \"$element\"
    [ -d "$element" ] && linkchk $element
  done
}

for dire in $directory; do
  if [ -d $dire ]; then
    linkchk $dire
  else
    echo "$dire is not a directory"
    echo "Usage: $0 dir dir2 ..."
  fi
done

#Exit status of the last command
#Same of just use exit plain
exit $?
