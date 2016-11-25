#!/bin/bash


a=375
echo $a
echo ${a}
echo "$a"

echo
echo
#can assigne with the let operator
let a=15-9

#in a for loop iteration
for a in [7..10]
do
  echo -n "$a"
done

echo
echo

# With the read
echo -n "Enter \"a\" is now $a"
echo

#Assigne the result cmd
a=`echo Hello!`
#Or better like this
a=$(echo Hello!)
echo $a

#Variable assignation return error status
(( 0 && 1))
echo $? #return 1 to tell fail to expand non-zero value
let "num = (( 200 || 11 ))"
echo $? #0
echo $num #1


exit 0
