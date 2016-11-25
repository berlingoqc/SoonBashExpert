#!/bin/bash
# View gzipped files with 'more' filter

E_NOARGS=85
E_NOTFOUND=86
E_NOTGZIP=87

#Test if there is args
if [ $# -eq 0 ];then
  echo "Usage : $(basename $0) filename" >&2
  exit $E_NOARGS
fi

filename=$1

#Test if args 1 is a file that exists
if [ ! -f "$filename" ]; then
  echo "File $filename not found" >&2
  exit $E_NOTFOUND
fi

# in if extract file name extension
# and test if its the good one
if [ ${filename##*.} != "gz" ]; then
  echo "File $1 is not a gzipped file!"
  exit $E_NOTGZIP
fi
#Show gzipped files if all succeed
zcat $1 | more

exit $?
