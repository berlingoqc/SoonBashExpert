#!/bin/bash
#Read two first entry of fstab
#exemple of block code

#

File=/etc/fstab

{
  read line1
  read line2
} < $File

echo "First line of $File is :"
echo $line1
echo "Second line of $File is :"
echo $line2

exit 0
