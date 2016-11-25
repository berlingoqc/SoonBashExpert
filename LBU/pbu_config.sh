#!/bin/bash

E_BADARGS=85

STR_BADUSAGE="Usages: $(basename $0) dir1 dir2 ..."

if [ $# -eq 0 ];then
  echo $STR_BADUSAGE
  exit $E_BADARGS
fi
echo $*
for dir in $*; do
  [ -d "$dir" ] && { echo "$dir" >> backDir.conf; }
done
#Sort line to use uniq to remove duplicat line
#sort backDir.conf > backDir.conf
#uniq backDir.conf > backDir.conf
