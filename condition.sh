#!/bin/bash

#Use if to test cmd result
#succed if exit status is 0
str="Files $(basename $1) and $(basename $2)"
if cmp $1 $2 &> /dev/null; then
  echo str+" are identical"
else echo str+" are not identical"
fi

word="Linux"
letter_seq="inu"

# Option -q of grep suppresse output
if echo "$word" | grep -q "$letter_seq"
then
  echo "$letter_seq found in $word"
else
  echo "$letter_seq not found in $word"
fi

#we got elif thanks god
if [ False ]; then
  :
elif [ True ]; then
  echo "I Love elif"
fi

#The best in the use double bracket who are build in in bash
dec=15
hex=0x0f
if [[ "$dec" -eq "$hex" ]]; then
  echo "Can compare decimal with hexa"
else
  echo "Cannot compare decimal with hexa"
fi # Double bracket can

if [ "$dec" -eq "$hex" ]; then
  echo "Can compare decimal with hexa"
else
  echo "Cannot compare decimal with hexa"
fi # Single bracket can't

# Condition can occur in (( ... ))
(( 5 > 4 ))
echo $? #0
(( 1 / 0 )) 2>/dev/null #Divison illegal, error who is redirecte

var1=5
var2=4
if (( var1 > var2 )); then ; echo "$var1 is greater than $var2"; fi

#Use binary operator for variable assigation like if
[ $# -eq 0 ] && dir=$(pwd) || dir=$@
#If number args == 0 True alors execture le && sinon le ||





exit 0
