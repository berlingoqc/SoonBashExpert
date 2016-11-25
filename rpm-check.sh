#!/bin/bash
#rpm-check.sh
#Use result of block code like lambda

SUCCES=0
E_NOARGS=65

if [ -ne $1 ]; then
  echo "Usage : `basename %0` rpm-file"
  exit $E_NOARGS
fi

{
  echo
  echo "Archive Description :"
  rpm -qpi $1
  echo
  echo "Archive Listing :"
  rpm -qpl $1
  echo
  rpm -i --test $1
  if [ "$?" -eq $SUCCESS ]; then
    echo "$1 can be installed"
  else
    echo "$1 can\'t be installed"
  fi
  echo
} > "$1.test"

exit 0
