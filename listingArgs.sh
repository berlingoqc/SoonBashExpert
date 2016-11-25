#!/bin/bash
# Invoke with several args

E_BADARGS=85

if [ ! -n "$1" ]
then
  echo "Usages: $(basename $0) arg1 arg2 etc.."
  exit $E_BADARGS
fi

echo

index=1 #Initialize count

echo "Listing args with \"\$*\":"
for arg in "$*"
do
  echo "Args #$index = $arg"
  (( index++ ))
done
echo "Entire arg list seen as single word."

echo

index=1

echo "Listing args with \"\$@\":"
for arg in "$@"
do
  echo "Args #$index = $arg"
  (( index++ ))
done
echo "Arg list seen as seperate words."

echo "Display are with while loop and shift combo"
while [ ! -ne "$1" ]; do
  echo $1
  shift
done
