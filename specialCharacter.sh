#!/bin/bash

# (#) comment
echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # here begins a comment.

echo ${PATH#*:}       # Parameter substitution, not a comment.
echo $(( 2#101011 ))  # Base conversion, not a comment.

echo

var="'(]\\{}\$\""
echo $var        # '(]\{}$"
echo "$var"      # '(]\{}$"

echo "$(echo '"')"     # "
if [[ "$(du "$My_File1")" -gt "$(du "$My_File2")" ]]
#     ^     ^         ^ ^     ^     ^         ^ ^
then
  ...
fi


# (;)
# To put multiple cmd on the same line
echo Hey; echo Hello There
if [ -x "$filename" ]; then
  echo "Brah Brah"
fi; echo " Brah"

# (;;)
# Terminate a case option
case "$variable" in
  abc)  echo "\$variable = abc" ;;
  xyz)  echo "\$variable = xyz" ;;
esac

# (.)
# like source to executes a script in a script
# the files must be in the same directory

# ()
# comma are use to link arithmetic operation and the last result is store
let "t2 = ((a = 9, 15 / 2))" # Set "a = 9" and "t2 = 15 / 2"
